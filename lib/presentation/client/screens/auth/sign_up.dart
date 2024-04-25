import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mae_assurance_mobile/presentation/components/action_button/action_button.dart';
import 'package:mae_assurance_mobile/presentation/components/arrow_back/arrow_back_button_view.dart';
import 'package:mae_assurance_mobile/presentation/components/input_field/input_field.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';
import 'package:mae_assurance_mobile/presentation/ressources/fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> items = [
    'Tunis',
    'Ariana',
    'Ben Arous',
    'La Manouba',
    'Nabeul',
    'Zaghouan',
    'Bizerte',
    'Béja',
    'Jendouba',
    'Kef',
    'Siliana',
    'Sousse',
    'Monastir',
    'Mahdia',
    'Sfax',
    'Kairouan',
    'Kasserine',
    'Sidi Bouzid',
    'Gabès',
    'Médenine',
    'Tataouine',
    'Gafsa',
    'Tozeur',
    'Kébili'
  ];
  TextEditingController nameController = TextEditingController();
  String gender = "";
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Inscription",
                        style: TextStyle(fontFamily: Fonts.RalewayBold, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              InputField(
                  prefixWidget: Icon(Icons.email),
                  label: "Email ",
                  textInputType: TextInputType.emailAddress,
                  controller: nameController),
              InputField(
                  prefixWidget: Icon(Icons.account_circle),
                  label: "Nom ",
                  textInputType: TextInputType.emailAddress,
                  controller: nameController),
              InputField(
                  prefixWidget: Icon(Icons.account_circle),
                  label: "Prénom ",
                  textInputType: TextInputType.emailAddress,
                  controller: nameController),
              InputField(
                  prefixWidget: Icon(Icons.phone),
                  label: "Numéro de téléphone ",
                  textInputType: TextInputType.number,
                  controller: nameController),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.001, horizontal: Constants.screenWidth * 0.07),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Genre : ",
                    style: TextStyle(fontFamily: Fonts.RalewayBold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            gender = "Homme";
                          });
                        },
                        highlightColor: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == "Homme" ? AppColors.primaryGreen : AppColors.primaryGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.primaryGreen, // Adjust color as needed
                              width: 1.0, // Adjust width as needed
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Homme",
                                  style: TextStyle(fontFamily: Fonts.RalewayBold, color: Colors.white),
                                ),
                                Icon(
                                  Icons.male,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            gender = "Femme";
                          });
                        },
                        highlightColor: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == "Femme" ? AppColors.primaryGreen : AppColors.primaryGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.primaryGreen, // Adjust color as needed
                              width: 1.0, // Adjust width as needed
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Femme",
                                  style: TextStyle(fontFamily: Fonts.RalewayBold, color: Colors.white),
                                ),
                                Icon(
                                  Icons.female,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.008, horizontal: Constants.screenWidth * 0.07),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Selectionner une région',
                  ),
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              ),
              InputField(
                  prefixWidget: Icon(Icons.lock),
                  label: "Mot de passe ",
                  textInputType: TextInputType.visiblePassword,
                  controller: nameController),
              ActionButton(onPressed: () {}, label: "Enregistrer")
            ],
          ),
        ),
      ),
    );
  }
}
