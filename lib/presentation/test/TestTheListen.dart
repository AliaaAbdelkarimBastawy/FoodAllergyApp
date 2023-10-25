import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListenPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyListenPage> {

  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    // Listen for changes to the data at the specified path
    databaseReference.child('Recipes/Recipe4/Name').onValue.listen((event) {
      // Handle the data update
      DataSnapshot snapshot = event.snapshot;
      dynamic data = snapshot.value;
      print("Updated Data");
      print(data);
      // Do something with the updated data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Realtime Database'),
      ),
      body: Center(
        child: Text('Listen for changes in Firebase Realtime Database'),
      ),
    );
  }
}