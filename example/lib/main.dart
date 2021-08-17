import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_device_id/firebase_device_id.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Device token example')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: FutureBuilder(
              future: _getToken(),
              builder: (ctx, AsyncSnapshot<String?> snapshot) {
                if (snapshot.hasError)
                  return Text("Error: ${snapshot.error}");
                else if (snapshot.hasData)
                  return Text(snapshot.data ?? "Failed to get token");

                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _getToken() async {
    await Firebase.initializeApp();
    return getDeviceToken();
  }
}

