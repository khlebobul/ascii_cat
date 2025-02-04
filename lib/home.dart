import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final tailMovementProvider = StateProvider<bool>((ref) => false);

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> {
  late Timer _timer;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTailMoving = ref.watch(tailMovementProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isTailMoving
                  ? ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍ,)ノ'
                  : ' ╱|、\n(˚ˎ 。7\n l、˜〵\n じしˍ,)︵',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
