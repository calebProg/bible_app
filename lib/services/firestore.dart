import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;

  // Add a note for the current user
  Future<void> addNote(String topic, String reference, String message) async {
    // Get current user
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await database.collection('users').doc(user.uid).collection('notes').add({
        'topic': topic,
        'reference': reference,
        'message': message,
        'timestamp': Timestamp.now(),
      });
    }
  }

  // Get notes stream for the current user
  Stream<QuerySnapshot> getNotesStream() {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return database
          .collection('users')
          .doc(user.uid)
          .collection('notes')
          .orderBy('timestamp', descending: true)
          .snapshots();
    } else {
      // Return an empty stream if the user is not logged in
      return const Stream.empty();
    }
  }

  // Update a note for the current user
  Future<void> updateNote(String docID, String newTopic, String newReference,
      String newMessage) async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await database
          .collection('users')
          .doc(user.uid)
          .collection('notes')
          .doc(docID)
          .update({
        'topic': newTopic,
        'reference': newReference,
        'message': newMessage,
        'timestamp': Timestamp.now(),
      });
    }
  }

  // Delete a note for the current user
  Future<void> deleteNote(String docID) async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await database
          .collection('users')
          .doc(user.uid)
          .collection('notes')
          .doc(docID)
          .delete();
    }
  }
}
