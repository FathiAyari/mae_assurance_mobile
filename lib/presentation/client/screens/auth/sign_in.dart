import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<bool> avoidReturnButton() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: Constants.screenHeight * 0.1,
                    child: Text(
                      "vous etes sur de sortir ?",
                      style: TextStyle(fontSize: 20),
                    )),
                Row(
                  children: [
                    Expanded(child: Negative(context)),
                    Expanded(child: Positive()),
                  ],
                )
              ],
            ),
          );
        });
    return true;
  }

  Widget Positive() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.primaryGreen),
      child: TextButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            " Oui",
            style: TextStyle(
              color: Color(0xffEAEDEF),
            ),
          )),
    );
  }

  Widget Negative(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.primaryGreenLight),
        child: TextButton(
            onPressed: () {
              Navigator.pop(context); // fermeture de dialog
            },
            child: Text(
              " Non",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: avoidReturnButton, child: Scaffold());
  }
}
