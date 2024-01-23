import 'package:flutter/material.dart';
import 'package:planbu_operator_app/screens/jobs_screen.dart';
import 'package:planbu_operator_app/widgets/main_drawer.dart';

import '../screens/current_job_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/messages_screen.dart';
import '../screens/practice_screen.dart';

class OperatorApp extends StatefulWidget {
  const OperatorApp({Key? key}) : super(key: key);

  @override
  State<OperatorApp> createState() => _OperatorAppState();
}

class _OperatorAppState extends State<OperatorApp> {
  int _selectedIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.of(context).pop(); // Close the drawer
  }

  final List drawerItems = [
    {'icon': Icons.home_filled, 'title': 'Jobs', 'screen': const JobsScreen()},
    {
      'icon': Icons.play_arrow_rounded,
      'title': 'Current Job',
      'screen': const CurrentJobScreen()
    },
    {
      'icon': Icons.dashboard,
      'title': 'Dashboard',
      'screen': const DashboardScreen()
    },
    {
      'icon': Icons.messenger_rounded,
      'title': 'Messages',
      'screen': const MessagesScreen()
    },
    {
      'icon': Icons.video_call_rounded,
      'title': 'Practice',
      'screen': const PracticeScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: MainDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _setIndex,
        drawerItems: drawerItems,
      ),
      body: drawerItems[_selectedIndex]['screen'],
    );
  }
}
