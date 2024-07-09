import 'package:bible_app/components/my_drawer.dart';
import 'package:bible_app/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final user = FirebaseAuth.instance.currentUser!;
  final username = FirebaseAuth.instance.currentUser!.email!;
  final TextEditingController noteController = TextEditingController();

  void openNoteBox([String? docID]) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: noteController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // add a new note
              if (docID == null) {
                firestoreService.addNote(noteController.text);
              }
              // update an existing note
              else {
                firestoreService.updateNote(docID, noteController.text);
              }
              noteController.clear();
              Navigator.pop(context);
            },
            child: Text("Save note"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docID = document.id;

                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  String noteText = data['note'];

                  // display list tile
                  return ListTile(
                    title: Text(noteText),
                    trailing: IconButton(
                      onPressed: () => openNoteBox(docID),
                      icon: const Icon(Icons.settings),
                    ),
                  );
                });
          } else {
            return const Center(child: Text("No notes yet..."));
          }
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
