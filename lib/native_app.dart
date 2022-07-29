import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NativeApp extends StatefulWidget {
  const NativeApp({Key? key}) : super(key: key);

  @override
  State<NativeApp> createState() => _NativeAppState();
}

class _NativeAppState extends State<NativeApp> {
  static const platform = MethodChannel('com.flutter.dev/info');
  final String _deviceInfo = 'Unknown info';

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
            // _getDeviceInfo();
          },
          child: const Icon(Icons.get_app),
        ));
  }
}
