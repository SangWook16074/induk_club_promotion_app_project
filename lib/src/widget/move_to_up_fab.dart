import 'package:flutter/material.dart';

// 모바일 앱에서 사용되는 FAB 위젯
class MoveToUpFab extends StatelessWidget {
  final void Function()? onPressed;
  const MoveToUpFab({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.arrow_upward),
    );
  }
}
