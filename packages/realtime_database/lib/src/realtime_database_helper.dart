import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  static void write({
    required String email,
    required Map<String, dynamic> data,
  }) async {
    DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref("users/$email");

    await _databaseReference.set(data);
  }

  static void read({required String email}) async {
    DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref("users/$email");
    final snapshot = await _databaseReference.get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}
