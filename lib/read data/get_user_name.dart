import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUSerName extends StatelessWidget {
  final String documentId;

  GetUSerName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the colloection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['first name']}' +
              ' ' +
              '${data['last name']}' +
              ' ' +
              '${data['age']}' +
              ' years old');
        }
        return Text('Loading...');
      }),
    );
  }
}
