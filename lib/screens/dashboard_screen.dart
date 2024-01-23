import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Dashboard',
      style: TextStyle(color: Colors.white),
    ));
  }
}
