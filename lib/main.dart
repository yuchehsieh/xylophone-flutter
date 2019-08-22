import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<Map<String, dynamic>> soundKeys = [
    {'keyNum': 1, 'color': Colors.red},
    {'keyNum': 2, 'color': Colors.orange},
    {'keyNum': 3, 'color': Colors.yellow},
    {'keyNum': 4, 'color': Colors.green},
    {'keyNum': 5, 'color': Colors.teal},
    {'keyNum': 6, 'color': Colors.blue},
    {'keyNum': 7, 'color': Colors.purple},
  ];

  void playSound(int soundNum) {
    final AudioCache player = AudioCache();
    player.play('note$soundNum.wav');
  }

  Expanded buildKey(int keyNum, Color keyColor) {
    return Expanded(
      child: FlatButton(
        color: keyColor,
        onPressed: () => playSound(keyNum),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: soundKeys
                .map(
                  (key) => buildKey(
                    key['keyNum'],
                    key['color'],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
