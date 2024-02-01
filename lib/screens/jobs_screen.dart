import 'package:flutter/material.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  bool showCompletedValue = true;
  static const TextStyle textStyle = TextStyle(
      color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);

  List columnTitles = [
    'MO ID',
    'Product',
    'Operation',
    'Quantity',
    'Deadline',
    'Status',
    '% Complete'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Theme.of(context).primaryColorDark, // testing alignment
          margin: const EdgeInsets.only(
            right: 20,
            top: 16,
            bottom: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Show Completed',
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight, fontSize: 14),
              ),
              const SizedBox(
                width: 10,
              ),
              Switch(
                  value: showCompletedValue,
                  onChanged: (value) {
                    setState(() {
                      showCompletedValue = value;
                    });
                  }),
            ],
          ),
        ),
        Container(
          height: 40,
          padding:
              const EdgeInsets.only(left: 70, right: 164.3), // calculated value
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            //color: Theme.of(context).primaryColorDark, // to see the alignment
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: columnTitles
                      .map(
                        (e) => Container(
                          alignment: Alignment.centerLeft,
                          width: 100,
                          child: Text(
                            e,
                            style: textStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                height: 100,
                padding: const EdgeInsets.only(left: 70, right: 40),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColorDark.withOpacity(0.6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: columnTitles
                            .map((e) => Container(
                                  alignment: Alignment.centerLeft,
                                  width: 100,
                                  child: Icon(
                                    Icons.linear_scale_sharp,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: const CircleBorder(),
                        onPressed: () {
                          print('test');
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                transform: GradientRotation(0.5),
                                colors: [
                                  Theme.of(context).colorScheme.tertiary,
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            size: 52,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
