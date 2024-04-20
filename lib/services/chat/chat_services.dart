import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    print('Fetching users...');
    return _firestore.collection('Users').snapshots().map((snapshot) {
      print('Fetched ${snapshot.docs.length} users');
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send messages
  Future<void> sendMessage(
      String senderEmail, String receiverEmail, String message) async {
    // get current user info
    final currUserId = _authService.currentUser!.uid;
    final currUserEmail = _authService.currentUser!.email;
    // time stamp
    final Timestamp timestamp = Timestamp.now();

    // create a new chat message
  }
}
