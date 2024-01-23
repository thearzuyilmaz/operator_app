import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class CurrentJobScreen extends StatelessWidget {
  const CurrentJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Current Job',
      style: TextStyle(color: Colors.white),
    ));
  }
}
