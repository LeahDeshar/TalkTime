import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary,
          ),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            const Icon(Icons.person),
            Text(text),
            const SizedBox(width: 20),
            Text(text)
          ]),
        ));
  }
}
