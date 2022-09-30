import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeView();
  }
}

class _HomeView extends State<HomeView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  void getProfile() async {
    final docRef= db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid);
    await db
        .collection("perfiles")
        .doc("AKZuNe4nq7c6ocHfrSt8XloxyyH3")
        .get()
        .then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print("---------------->" + data["edad"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Bienvenido"),
          ],
        ),
      ),
    );
  }
}
