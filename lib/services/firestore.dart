import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("biblenotes");
  // Create
  Future<void> addNote(String topic, String reference, String message) {
    return notes.add({
      'topic': topic,
      'reference': reference,
      'message': message,
      'timestamp': Timestamp.now(),
    });
  }

  // read from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  // update
  Future<void> updateNote(
      String docID, String newTopic, String newReference, String newMessage) {
    return notes.doc(docID).update({
      'topic': newTopic,
      'reference': newReference,
      'message': newMessage,
      'timestamp': Timestamp.now(),
    });
  }

  // delete
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
