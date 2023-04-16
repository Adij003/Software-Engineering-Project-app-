import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/focus_study.dart';
import 'package:productivity_app/main_ui_page.dart';
import 'package:productivity_app/reminders.dart';
import 'package:productivity_app/resources.dart';
import 'package:productivity_app/new_to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

  // User sign-out method
  void signOutUser(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: signOutUser,
          icon: const Icon(Icons.logout))],
          title: const Text('Welcome to The Big Project'),
      ),

      body: SafeArea(
        child: Center(
        child: Column(
          children: [
            const SizedBox(height: 150,),
            // To do list
            MyButtonTask(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const ToDoListFun()));
                }
                , text: 'To Do List'),
            const SizedBox(height: 50,),
            // Focus Study
            MyButtonTask(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const PomodoroTimer()));
                }
                , text: 'Focus Study'
            ),
            const SizedBox(height: 50,),
            // Resources
            MyButtonTask(onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ResourceHomePage()));
            }, text: 'Resources'),
            const SizedBox(height: 50,),
            // Reminders
            MyButtonTask(onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Reminders()));
            }, text: 'Reminders'),
            const SizedBox(height: 50,),
          ],
        ),
      ),

      )
    );
  }
}
