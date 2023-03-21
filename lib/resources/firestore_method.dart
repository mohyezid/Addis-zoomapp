import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection("meetings")
      .snapshots();

  void addToMeetingHistory(String meetingname) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .add({"meetingName": meetingname, "createdAt": DateTime.now()});
    } catch (err) {
      print(err);
    }
  }
}
