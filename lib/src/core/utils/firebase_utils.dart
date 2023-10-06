import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static Future<String> uploadImage({
    required String folder,
    required String name,
    required String image,
  }) async {
    if (!image.isLink) {
      Reference upload = FirebaseStorage.instance.ref().child("$folder/$name");
      await upload.putFile(File(image));
      return await upload.getDownloadURL();
    }
    return image;
  }

  static Future<bool> deleteImage(String image) async {
    try {
      FirebaseStorage.instance.refFromURL(image).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
