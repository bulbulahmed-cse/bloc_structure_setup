import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityHelper{
  late StreamSubscription<List<ConnectivityResult>> subscription;
  StreamSubscription<List<ConnectivityResult>>? subscription2;
  static ValueNotifier<ConnectivityResult> networkState = ValueNotifier<ConnectivityResult>(ConnectivityResult.none);


  ConnectivityHelper(){
    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      networkState.value = result.first;
    });
  }

  ConnectivityHelper.listen({required Function(bool) listen}){
    subscription2 = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      listen(result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile));
    });
  }

  // This method is important for ConnectivityHelper.listen()
  // When use ConnectivityHelper.listen() then must call this method inside onClose() lifecycle method
  ConnectivityHelper.closeListen(){
    subscription2?.cancel();
  }
}