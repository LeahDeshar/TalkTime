import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrUser;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isCurrUser ? Colors.blue : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
        child: Text(message, style: const TextStyle(color: Colors.white)));
  }
}
