import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  /// Private constructor
  ConnectivityController._();

  /// Static instance
  static final ConnectivityController instance = ConnectivityController._();

  /// Notifier for connection status
  ValueNotifier<bool> isConnected = ValueNotifier(true);
  

  /// Initialize connectivity monitoring
  Future<void> init() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    isInternetConnected(connectivityResult);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  /// Handle connectivity changes
  bool isInternetConnected(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false;
    } else if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}
