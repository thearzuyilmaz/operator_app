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

    if (isSmallScreen) {
      return Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            drawerItems[_selectedIndex]['title'],
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        drawer: MainDrawer(
          selectedIndex: _selectedIndex,
          onItemTapped: _setIndex,
          drawerItems: drawerItems,
        ),
        body: drawerItems[_selectedIndex]['screen'],
      );

      // For larger screens, show a persistent sidebar
    } else {
      return Scaffold(
        body: Row(
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: drawerItems.length,
                      itemBuilder: (context, index) {
                        final item = drawerItems[index];

                        return ListTile(
                          selectedTileColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          selected: index == _selectedIndex, // true/false check
                          leading: Container(
                            width: 24,
                            height: 24,
                            child: item['icon'],
                          ),
                          title: Text(
                            item['title'],
                            style: TextStyle(
                                color: Theme.of(context).primaryColorLight),
                          ),
                          onTap: () {
                            _setIndex(index);
                          },
                        );
                      },
                    ),
                  ),
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
                          backgroundImage:
                              AssetImage('images/Arzu_Profile.png'),
                        )),
                  ],
                  title: Text(
                    drawerItems[_selectedIndex]['title'],
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
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
}
