import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Messages',
      style: TextStyle(color: Colors.white),
    ));
  }
}
