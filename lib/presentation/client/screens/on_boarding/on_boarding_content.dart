import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String img;

  const Content({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0), // Adjust the value as needed
              bottomRight: Radius.circular(20.0), // Adjust the value as needed
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(img),
            ),
          ),
        ),
      ),
    );
  }
}
