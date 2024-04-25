import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mae_assurance_mobile/presentation/components/action_button/action_button.dart';
import 'package:mae_assurance_mobile/presentation/components/arrow_back/arrow_back_button_view.dart';
import 'package:mae_assurance_mobile/presentation/components/input_field/input_field.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';
import 'package:mae_assurance_mobile/presentation/ressources/fonts.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.ultraLight,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Constants.screenWidth * 0.07,
                    top: Constants.screenHeight * 0.04,
                    bottom: Constants.screenHeight * 0.02),
                child: Row(
                  children: [
                    SplashedIcon(
                      onPressed: () {
                        Get.back();
                      },
                      highlightColor: Colors.grey.withOpacity(0.2),
                      child: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(height: Constants.screenHeight * 0.2, child: Image.asset("assets/images/mae.png")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Réinitialisez votre mot de passe en un clic", style: TextStyle(fontFamily: Fonts.RalewayBold)),
              ),
              InputField(
                  prefixWidget: Icon(Icons.email),
                  label: "Email ",
                  textInputType: TextInputType.emailAddress,
                  controller: emailController),
              ActionButton(color: AppColors.primaryGreen, onPressed: () {}, label: "Envoyer")
            ],
          ),
        ),
      ),
    );
  }
}
