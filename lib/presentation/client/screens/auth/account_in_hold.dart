import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/components/action_button/action_button.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';
import 'package:mae_assurance_mobile/presentation/ressources/fonts.dart';

class AccountInHoldScreen extends StatefulWidget {
  const AccountInHoldScreen({Key? key}) : super(key: key);

  @override
  State<AccountInHoldScreen> createState() => _AccountInHoldState();
}

class _AccountInHoldState extends State<AccountInHoldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: Constants.screenHeight * 0.2, child: Image.asset("assets/images/mae.png")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Votre compte n'est pas avtivé encore ", style: TextStyle(fontFamily: Fonts.RalewayBold)),
            ),
            ActionButton(
              color: AppColors.red,
              onPressed: () {},
              label: "Se deconnécter",
            ),
          ],
        ),
      ),
    );
  }
}
