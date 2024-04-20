// message model
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': receiverId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  // factory Message.fromMap(Map<String, dynamic> map) {
  //   return Message(
  //     senderEmail: map['senderEmail'],
  //     receiverEmail: map['receiverEmail'],
  //     message: map['message'],
  //     timestamp: map['timestamp'],
  //   );
  // }
}
