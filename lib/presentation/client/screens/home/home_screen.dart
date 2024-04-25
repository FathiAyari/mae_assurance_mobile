import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/components/action_button/action_button.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/services/auth_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ActionButton(
          color: AppColors.primaryGreen,
          onPressed: () {
            AuthServices().logOut(context);
          },
          label: "Se deconnecter",
        ),
      ),
    );
  }
}
