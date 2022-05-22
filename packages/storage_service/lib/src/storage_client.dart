import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<void> uploadFile(
    Uint8List filePath,
    String fileName,
  ) async {
    try {
      await FirebaseStorage.instance.ref().child(fileName).putData(filePath);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadURL(String fileName) async {
    try {
      return await FirebaseStorage.instance
          .ref()
          .child(fileName)
          .getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  Future<void> deleteFile(String fileName) async {
    try {
      await FirebaseStorage.instance.ref().child(fileName).delete();
    } catch (e) {
      print(e);
    }
  }
}
