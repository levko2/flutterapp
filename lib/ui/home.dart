import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createChatList(),
    );
  }

  _createChatList() {
    return StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) return Text("Loading");
          return ListView.builder(
              itemBuilder: (context, index) =>
                  _createItemBuilder(context, snapshot.data.docements[index]),
              itemCount: snapshot.data.documents.lenght,
              itemExtent: 80.0);
        },
        stream: Firestore.instance.collection("bandnames").snapshots());

    ListView.builder(itemBuilder: null, itemExtent: 80.0, itemCount: 2);
  }

  _createItemBuilder(BuildContext context, DocumentSnapshot snapshot) {
    return ListTile(
      title: Row(children: [
        Expanded(child: Text(snapshot["name"])),
        Container(
          decoration: const BoxDecoration(color: Colors.red),
          padding: const EdgeInsets.all(10.0),
          child: Text(snapshot["vote"].toString()),
        )
      ]),
      onTap: () {
        print("TAPPPPP");
      },
    );
  }
}
