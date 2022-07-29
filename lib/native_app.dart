import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeApp extends StatefulWidget {
  const NativeApp({Key? key}) : super(key: key);

  @override
  State<NativeApp> createState() => _NativeAppState();
}

class _NativeAppState extends State<NativeApp> {
  static const platform = MethodChannel('com.flutter.dev/info');
  String _deviceInfo = 'Unknown info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Native Plugin Ex'),
        ),
        body: Center(
          child: Text(
            _deviceInfo,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getDeviceInfo(platform);
          },
          child: const Icon(Icons.get_app),
        ));
  }

  Future<void> _getDeviceInfo(MethodChannel methodChannel) async {
    String deviceInfo;
    try {
      final String result = await methodChannel.invokeMethod('getDeviceInfo');
      deviceInfo = 'Device info : $result';
    } on PlatformException catch (e) {
      deviceInfo = 'Failed to get Device info : ${e.toString()}';
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
}
