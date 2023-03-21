import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethiozoom/resources/firestore_method.dart';
import 'package:flutter/material.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => ListTile(
            title:
                Text('Room Name: ${snapshot.data!.docs[index]['meetingName']}'),
            subtitle:
                Text('Joined on ${snapshot.data!.docs[index]['createdAt']}'),
          ),
        );
      },
    );
  }
}
