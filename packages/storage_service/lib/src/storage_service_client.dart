import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageClient {
  Future<void> uploadFile(
    Uint8List fileData,
    String fileName,
  ) async {
    await FirebaseStorage.instance.ref().child(fileName).putData(fileData);
  }
}
