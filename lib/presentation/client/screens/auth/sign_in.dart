import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mae_assurance_mobile/presentation/components/action_button/action_button.dart';
import 'package:mae_assurance_mobile/presentation/components/input_field/input_field.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';
import 'package:mae_assurance_mobile/presentation/ressources/fonts.dart';
import 'package:mae_assurance_mobile/presentation/ressources/routes/router.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    return SafeArea(
      child: WillPopScope(
          onWillPop: avoidReturnButton,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: Constants.screenHeight,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                          decoration: const BoxDecoration(),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                                0,
                                0.9,
                              ],
                            ),
                          ),
                          height: Constants.screenHeight / 3,
                          child: Image.asset(
                            "assets/images/woman.jpg",
                            fit: BoxFit.fill,
                          ))),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(height: Constants.screenHeight * 0.2, child: Image.asset("assets/images/mae.png")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Bienvenue à la famille de MAE", style: TextStyle(fontFamily: Fonts.RalewayBold)),
                        ),
                        InputField(
                            prefixWidget: Icon(Icons.account_circle),
                            label: "Email",
                            textInputType: TextInputType.emailAddress,
                            controller: emailController),
                        InputField(
                            prefixWidget: Icon(Icons.lock),
                            label: "Mot de passe",
                            textInputType: TextInputType.visiblePassword,
                            controller: passwordController),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Constants.screenHeight * 0.02, horizontal: Constants.screenWidth * 0.07),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.transparent))),
                                overlayColor:
                                    MaterialStateColor.resolveWith((states) => AppColors.primaryGreenLight.withOpacity(0.2)),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(color: AppColors.primaryGreenLight, fontFamily: Fonts.Raleway),
                              ),
                            ),
                          ),
                        ),
                        ActionButton(
                          onPressed: () {},
                          label: "Se Connecter",
                        ),
                        Container(
                          width: Constants.screenWidth / 2,
                          child: Padding(
                            padding: EdgeInsets.only(top: Constants.screenHeight * 0.03, bottom: Constants.screenHeight * 0.02),
                            child: Divider(
                              color: AppColors.primaryGreen,
                              thickness: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Constants.screenHeight * 0.02, horizontal: Constants.screenWidth * 0.07),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.transparent))),
                                overlayColor:
                                    MaterialStateColor.resolveWith((states) => AppColors.primaryGreenLight.withOpacity(0.2)),
                              ),
                              onPressed: () {
                                Get.toNamed(AppRouting.signUp);
                              },
                              child: Text(
                                "Vous n'avez pas un compte ? S'inscrire",
                                style: TextStyle(color: AppColors.primaryGreenLight, fontFamily: Fonts.RalewayBold, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
