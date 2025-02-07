import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insync_flutter/core/navigation/endpoints.dart';
import 'package:insync_flutter/core/util/constants/dims.dart';
import 'package:insync_flutter/core/util/theme/colors.dart';
import 'package:insync_flutter/presentation/components/button/CFilledButton.dart';


final List<Map<String, String>> onboardData = [
  {
    "image": "assets/images/calender_png.png",
    "title": "Plan Your Schedule Effortlessly",
    "description": "Stay organized by creating and managing your schedules with ease. Never miss an important event again."
  },
  {
    "image": "assets/images/message_png.png",
    "title": "Smart Email Filtering with AI",
    "description": "Let AI sort your emails intelligently, ensuring you focus on what truly matters while reducing clutter."
  },
  {
    "image": "assets/images/robot_png.png",
    "title": "Automate Your Daily Workflow",
    "description": "From scheduling to reminders, automate tasks seamlessly and boost your productivity effortlessly."
  }
];


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  void _nextPage() {

    if(_currentPage == onboardData.length - 1 && mounted){
      print("current page: $_currentPage");
      // check if the user if already registered :
      // true -  Home page
      // false - sign in page
      context.replace(RouteEndpoints.sigInScreen.path);
    }

    if (_currentPage < onboardData.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }

  }

  void _skip() {

    // check if the user if already logged in if yes navigate to home page else to sign in.

    _pageController.jumpToPage(onboardData.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    double parentHeight = getScreenHeight(context);
    double parentWidth = getScreenWidth(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: onboardData.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: parentHeight * 0.5,
                    width: parentWidth,
                    color: softWhite,
                    child: Image.asset(onboardData[index]["image"]!, fit: BoxFit.contain),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      onboardData[index]["title"]!,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      onboardData[index]["description"]!,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Buttons
          SizedBox(
            height: parentHeight * 0.1,
            width: parentWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentPage != onboardData.length - 1)
                  CfilledButton(
                    width: parentWidth * 0.4,
                    height: 50,
                    text: "Skip",
                    buttonColor: softWhite,
                    onTap: _skip,
                  ),

                const SizedBox(width: 10),

                CfilledButton(
                  width: _currentPage == onboardData.length - 1 ? parentWidth * 0.8 : parentWidth * 0.4,
                  height: 50,
                  text: _currentPage == onboardData.length - 1 ? "Get Started" : "Next",
                  textStyle: const TextStyle(color: Colors.white),
                  buttonColor: Theme.of(context).colorScheme.secondary,
                  onTap: _nextPage,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
