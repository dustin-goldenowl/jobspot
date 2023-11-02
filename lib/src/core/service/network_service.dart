import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';

@lazySingleton
class NetworkService {
  final _networkConnectivity = Connectivity();
  ConnectivityResult? previousState;
  bool _isInit = false;
  BuildContext? context;

  void initialise(BuildContext context) async {
    this.context = context;
    if (!_isInit) {
      ConnectivityResult result =
          await _networkConnectivity.checkConnectivity();
      if (context.mounted) _checkStatus(result);
      _networkConnectivity.onConnectivityChanged
          .listen((event) => _checkStatus(event));
      _isInit = true;
    }
  }

  void _checkStatus(ConnectivityResult result) async {
    if (previousState != null && _checkChangeState(result) ||
        result == ConnectivityResult.none) {
      _showNotification(result);
    }
    previousState = result;
  }

  void _showNotification(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        customToast(context!, text: AppLocal.text.internet_available);
        break;
      case ConnectivityResult.none:
        customToast(context!, text: AppLocal.text.no_internet);
        break;
      default:
    }
  }

  bool _checkChangeState(ConnectivityResult result) {
    final listInternet = [ConnectivityResult.wifi, ConnectivityResult.mobile];
    return !(listInternet.contains(result) &&
        listInternet.contains(previousState));
  }
}
