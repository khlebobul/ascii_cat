import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

final tailMovementProvider = StateProvider<bool>((ref) => false);

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> {
  late Timer _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(tailMovementProvider.notifier).state =
          !ref.read(tailMovementProvider);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTailMoving = ref.watch(tailMovementProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onLongPress: () async {
            await _audioPlayer.play(AssetSource('sounds/purr.mp3'));
            Timer(const Duration(seconds: 5), () {
              _audioPlayer.stop();
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                isTailMoving
                    ? ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍˍ)ノ'
                    : ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍˍ)︵',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Fira Code',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
