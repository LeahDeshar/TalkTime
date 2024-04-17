import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }
}

Widget _buildUserList() {
  return StreamBuilder(
    stream: _chatService.getUsersStream(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text("Error");
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading...");
      }

      return ListView(
        children: snapshot.data!
            .map<Widget>((userData) => _buildUserListItem)
            .toList(),
      );
    },
  );
}

Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  return UserTile(
    text: userData["email"],
    onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatPage(),))
    },
  );
}
