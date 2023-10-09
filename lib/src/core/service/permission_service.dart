import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      return false;
    }
    return true;
  }

  static Future<bool> requestPhotoPermission() async {
    var status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      return false;
    }
    return true;
  }

  static Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      return false;
    }
    return true;
  }
}
