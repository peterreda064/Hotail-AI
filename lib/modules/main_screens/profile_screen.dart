import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference IDS = FirebaseFirestore.instance.collection('IDS');
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: emailController,
        ),
      ),
      body: Center(
        child: StreamBuilder(
            stream: IDS.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
              return Column(
                children: snapshot.data!.docs.map((IDE) {
                  return Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(IDE['name']),
                        Text(IDE['phone']),
                        Text(IDE['email']),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
