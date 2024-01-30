import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planbu_operator_app/screens/jobs_screen.dart';
import 'package:planbu_operator_app/widgets/main_drawer.dart';

import '../screens/current_job_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/messages_screen.dart';
import '../screens/practice_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class OperatorApp extends StatefulWidget {
  const OperatorApp({Key? key}) : super(key: key);

  @override
  State<OperatorApp> createState() => _OperatorAppState();
}

class _OperatorAppState extends State<OperatorApp> {
  int _selectedIndex = 0;
  final _key = GlobalKey<ScaffoldState>();
  double widthContainer = 100;

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.of(context).pop(); // Close the drawer
  }

  final List drawerItems = [
    {
      'icon': Image.asset(
        'images/icon-jobs.png',
        color: Colors.white.withOpacity(0.7),
      ),
      'title': 'Jobs',
      'screen': const JobsScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-current-job.png',
        color: Colors.white.withOpacity(0.7),
      ),
      'title': 'Current Job',
      'screen': const CurrentJobScreen(),
    },
    {
      'icon': Image.asset(
        'images/icon-dashboard.png',
        color: Colors.white.withOpacity(0.7),
      ),
      'title': 'Dashboard',
      'screen': const DashboardScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-messages.png',
        color: Colors.white.withOpacity(0.7),
      ),
      'title': 'Messages',
      'screen': const MessagesScreen()
    },
    {
      'icon': Image.asset(
        'images/icon-practice.png',
        color: Colors.white.withOpacity(0.7),
      ),
      'title': 'Practice',
      'screen': const PracticeScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    Widget sidebar = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: drawerItems.map((item) {
        final index = drawerItems.indexOf(item);

        return InkWell(
          customBorder: const CircleBorder(),
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          onTap: () {
            _setIndex(index);
          },
          child: index == _selectedIndex
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ], // Change colors as needed
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: item['icon'],
                  ),
                )
              : SizedBox(
                  height: 32,
                  width: 32,
                  child: item['icon'],
                ),
        );
      }).toList(),
    );

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widthContainer,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset('images/planbu-logo-circle.png'),
                  ),
                ),
                Expanded(child: sidebar),
              ],
            ),
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                surfaceTintColor: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                actions: const [
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('images/Arzu_Profile.png'),
                      )),
                ],
                title: Text(
                  drawerItems[_selectedIndex]['title'],
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
              body: drawerItems[_selectedIndex]['screen'],
            ),
          ),
        ],
      ),
    );
  }
}
