import 'package:flutter/material.dart';
import '../model/email.dart';  // Importamos la estructura de email

class EmailDetailPage extends StatelessWidget {
  final Email email;

  EmailDetailPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.from}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Sent: ${email.dateTime.toLocal()}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
            Divider(height: 20, color: Colors.grey),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  email.body,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
