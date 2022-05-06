import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  static void write({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.ref("users/$userId");

      await _databaseReference.set(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> read({required String userId}) async {
    try {
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.ref("users/$userId");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> _snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        return _snapshotValue['name'] ?? '';
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
