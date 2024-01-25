import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.drawerItems,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int index) onItemTapped;
  final List drawerItems;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: DrawerHeader(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
              child: Image.asset('images/planbu_logo.png'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: widget.drawerItems.length,
              itemBuilder: (context, index) {
                final item = widget.drawerItems[index];

                return ListTile(
                  selectedTileColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  selected: index == widget.selectedIndex, // true/false check
                  leading: Container(
                    width: 30,
                    height: 30,
                    child: item['icon'],
                  ),
                  title: Text(item['title']),
                  onTap: () {
                    widget.onItemTapped(index);

                    // To Home
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
