import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust the container width based on the drawer state
        double containerWidth = constraints.maxWidth;
        if (Scaffold.of(context).isDrawerOpen) {
          containerWidth -= 200; // Adjust the value based on your drawer width
        }

        return Expanded(
          child: Center(
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.only(top: 40),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: containerWidth,
                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
