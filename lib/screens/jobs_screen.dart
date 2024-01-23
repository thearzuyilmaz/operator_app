import 'package:flutter/material.dart';
import 'package:planbu_operator_app/widgets/main_drawer.dart';

import 'current_job_screen.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Jobs',
      style: TextStyle(color: Colors.white),
    ));
  }
}
