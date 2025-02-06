import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/models/user_data.dart';

class CounterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserData?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserData.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  Future<void> incrementCounter(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'counterValue': FieldValue.increment(1),
      });
    } catch (e) {
      print('Error incrementing counter: $e');
    }
  }
}