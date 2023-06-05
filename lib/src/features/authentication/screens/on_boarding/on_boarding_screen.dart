import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mini_project_1/src/constants/colors.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/constants/text_strings.dart';
import 'package:mini_project_1/src/features/authentication/models/model_on_boarding.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page.dart';
import 'package:mini_project_1/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

late Size mq;
final controller = LiquidController();
int currentPage = 0;

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pages = [
      onBoardingPageWidget(
        model: OnBoardingModel(
            image: myOnboardingImage1,
            title: myOnboardingTitle1,
            subTitle: myOnboardingSubTitle1,
            bgColor: myOnboardingPage1Color,
            height: size.height),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
            image: myOnboardingImage2,
            title: myOnboardingTitle2,
            subTitle: myOnboardingSubTitle2,
            bgColor: myOnboardingPage2Color,
            height: size.height),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
            image: myOnboardingImage3,
            title: myOnboardingTitle3,
            subTitle: myOnboardingSubTitle3,
            bgColor: myOnboardingPage3Color,
            height: size.height),
      )
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios_new_rounded),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  foregroundColor: Colors.white),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: myDarkColor, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black, width: 10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const loginPage()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.deepPurple.shade400,
                dotHeight: 10,
                dotWidth: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  onPageChangeCallback(int activePageIndex) {
    setState(() {});
    currentPage = activePageIndex;
  }
}
