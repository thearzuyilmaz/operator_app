import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Practice',
      style: TextStyle(color: Colors.white),
    ));
  }
}
