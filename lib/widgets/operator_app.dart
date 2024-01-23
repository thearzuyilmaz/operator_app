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
    {
      'icon': Image.asset('images/icon-jobs.png', color: Colors.white),
      'title': 'Jobs',
      'screen': const JobsScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-current-job.png',
        color: Colors.white,
      ),
      'title': 'Current Job',
      'screen': const CurrentJobScreen(),
    },
    {
      'icon': Image.asset(
        'images/icon-dashboard.png',
        color: Colors.white,
      ),
      'title': 'Dashboard',
      'screen': const DashboardScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-messages.png',
        color: Colors.white,
      ),
      'title': 'Messages',
      'screen': const MessagesScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-practice.png',
        color: Colors.white,
      ),
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
