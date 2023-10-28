import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Kindly Provide me The Help Content",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
