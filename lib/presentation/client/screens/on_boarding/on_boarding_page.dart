import 'package:flutter/material.dart';
import 'package:mae_assurance_mobile/presentation/client/screens/on_boarding/on_boarding_controller.dart';
import 'package:mae_assurance_mobile/presentation/ressources/colors.dart';
import 'package:mae_assurance_mobile/presentation/ressources/dimensions/constants.dart';

import 'on_boarding_content.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

PageController _controller = PageController();
int currentPage = 0;
List<Content> contentList = [
  Content(
    img: 'assets/images/on2.jpg',
  ),
  Content(
    img: 'assets/images/on3.jpg',
  ),
  Content(
    img: 'assets/images/on4.jpg',
  ),
];
OnBoardingController onBoardingController = OnBoardingController();

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: contentList.length,
                  scrollDirection: Axis.horizontal, // the axis
                  controller: _controller,
                  itemBuilder: (context, int index) {
                    return contentList[index];
                  }),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(contentList.length, (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: Constants.screenHeight * 0.01,
                        width: (index == currentPage)
                            ? Constants.screenWidth * 0.08
                            : Constants.screenWidth * 0.04, // condition au lieu de if else
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: Constants.screenHeight * 0.03),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (index == currentPage) ? AppColors.primaryGreen : AppColors.primaryGreenLight),
                      );
                    }),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: ElevatedButton(
                              onPressed: () {
                                onBoardingController.check();
                                //Get.to(SignInScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryGreenLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Adjust the value to change the border radius
                                ),
                              ),
                              child: Text(
                                "Ignorer",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              child: ElevatedButton(
                                  onPressed: (currentPage == contentList.length - 1)
                                      ? () {
                                          //  Get.to(SignInScreen());
                                        }
                                      : () {
                                          onBoardingController.check();
                                          _controller.nextPage(
                                              duration: Duration(milliseconds: 400), curve: Curves.easeInOutQuint);
                                        },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: AppColors.primaryGreen,
                                  ),
                                  child: (currentPage == contentList.length - 1)
                                      ? Text(
                                          "Commencer",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      : Text(
                                          'Suivant',
                                          style: TextStyle(color: Colors.white),
                                        )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
