import 'package:flutter/material.dart';
import '../model/backend.dart'; // Importamos el backend
import 'DetailScreen.dart';  // Importamos la pantalla de detalles
import '../widgets/EmailWidget.dart';  // Importamos el nuevo widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blueAccent),
          ),
          elevation: 5,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: MyHomePage(title: 'Email App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Backend _backend = Backend();

  @override
  Widget build(BuildContext context) {
    final emails = _backend.getEmails();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];

          return EmailWidget(
            email: email,
            backend: _backend,
            onTap: () {
              setState(() {
                _backend.markEmailAsRead(email.id);
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailDetailPage(email: email),
                ),
              );
            },
            onLongPress: () {
              setState(() {
                _backend.markEmailAsRead(email.id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email marked as read')),
              );
            },
            onDismissed: (direction) {
              setState(() {
                _backend.deleteEmail(email.id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email deleted')),
              );
            },
          );
        },
      ),
    );
  }
}