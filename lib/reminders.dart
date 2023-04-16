import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders',)

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text("Welcome to Reminders"),
                  SizedBox(height: 5,),
                  Text('Please Hold!!'),
                  SizedBox(height: 5,),
                  Text('The App is under Development')
                ],
              ),
            ),
          )
      ),
    );
  }
}
