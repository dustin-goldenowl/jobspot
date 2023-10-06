import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static Future<String> uploadImage({
    required String folder,
    required String name,
    required String image,
  }) async {
    Reference upload = FirebaseStorage.instance.ref().child("$folder/$name");
    await upload.putFile(File(image));
    return await upload.getDownloadURL();
  }
}
