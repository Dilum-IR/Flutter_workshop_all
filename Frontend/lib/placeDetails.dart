import 'package:flutter/material.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({super.key});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ));
  }
}
