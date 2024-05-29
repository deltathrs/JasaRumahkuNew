import 'package:flutter/material.dart';

class OngoingScreen extends StatefulWidget {
  const OngoingScreen({super.key});

  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.all(22),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Stack(
            children: [
              Container(
                width: 274,
                height: 82,
                color: Colors.red,
              ),
              Padding(padding: EdgeInsets.all(2))
            ],
          ),
        )
      ]),
    ));
  }
}
