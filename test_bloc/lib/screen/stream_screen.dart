import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key? key}) : super(key: key);

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  StreamController<int> streamController = StreamController();
  int value = 0;

  @override
  void initState() {
    super.initState();
    addDataInStream();
  }

  addDataInStream() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      value = value + 2;
      streamController.add(value);
      if (value == 10) {
        streamController.close();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple[900]),
      body: Center(
        child: StreamBuilder<int>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final _data = snapshot.data;

              return Text(_data.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Text(snapshot.connectionState.toString());
          },
          stream: streamController.stream,
        ),
      ),
    );
  }
}
