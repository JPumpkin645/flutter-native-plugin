import 'package:flutter/services.dart';

Future<void> _getDeviceInfo(MethodChannel methodChannel) async {
  String deviceInfo;
  try {
    final String result = await methodChannel.invokeMethod('getDeviceInfo');
  } on PlatformException catch (e) {
    deviceInfo = 'Failed ot get Device info: ${e.message}';
  }
}
