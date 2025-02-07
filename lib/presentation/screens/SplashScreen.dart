import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insync_flutter/core/navigation/endpoints.dart';
import 'package:insync_flutter/core/service/StatusBarManager.dart';
import 'package:insync_flutter/presentation/view_models/onboard/onboard_view_model.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // To control the visibility of the image (fade-in effect)
  bool _isVisible = false;

  static const Duration _fadeInDuration = Duration(seconds: 1);
  static const Duration _navigateDelay = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    // Hide the status bar for splash screen
    _hideStatusBar();

    _startSplashSequence();

    _navigate();
  }

  void _navigate() async {
    final onboardViewModel = context.read<OnboardViewModel>();
    await onboardViewModel.checkOnboardStatus();

    Future.delayed(const Duration(seconds: 2), () {
        if(mounted){
          // check if onboard is competed if yes then check if logged in already if yes home page else sign in page.
          if(onboardViewModel.isOnboardCompleted){
              context.replace(RouteEndpoints.sigInScreen.path);
          }else{
              context.replace(RouteEndpoints.onboardScreen.path);
          }
        }else{
          // handle not mounted errors...
        }
    });
  }

  void _hideStatusBar() {
    if (!StatusBarManager.isHidden) {
      StatusBarManager.hideStatusBar();
    }
  }

  Future<void> _startSplashSequence() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isVisible = true; // Trigger the fade-in effect
    });
  }

  @override
  void dispose() {
    // Restore the status bar when leaving the splash screen
    StatusBarManager.transparentStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,  // Fade in the image
          duration: _fadeInDuration,  // Duration of fade-in
          child: Image.asset(
            'assets/images/insync_logo.png', // Replace with your image
          ),
        ),
      ),
    );
  }
}
