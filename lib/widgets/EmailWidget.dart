import 'package:flutter/material.dart';
import '../model/email.dart';
import '../model/backend.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Backend backend;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final DismissDirectionCallback onDismissed;

  EmailWidget({
    required this.email,
    required this.backend,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(email.id.toString()),
      onDismissed: onDismissed,
      background: Container(color: Colors.red),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blueAccent),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                child: Text(email.from[0], style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                email.subject,
                style: TextStyle(
                  fontWeight: email.read ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(email.from),
                  SizedBox(height: 5),
                  Text(
                    email.dateTime.toLocal().toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onTap: onTap,
              onLongPress: onLongPress,
              tileColor: email.read ? Colors.grey[300] : Colors.white,
            ),
            Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}