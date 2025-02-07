import 'package:go_router/go_router.dart';
import 'package:insync_flutter/core/navigation/endpoints.dart';
import 'package:insync_flutter/presentation/screens/SplashScreen.dart';
import 'package:insync_flutter/presentation/screens/home/bottomNavigation/BottomNavigation.dart';
import 'package:insync_flutter/presentation/screens/onboarding/OnboardingScreen.dart';
import 'package:insync_flutter/presentation/screens/signin/SignInScreen.dart';

class AppRouter {

    static final GoRouter router = GoRouter(
      initialLocation: RouteEndpoints.splashScreen.path,
      routes: [
        // Splash Screen
        GoRoute(
          path: RouteEndpoints.splashScreen.path,
          builder: (context, state) => const Splashscreen(),
        ),

        // Onboarding screen
        GoRoute(
          path: RouteEndpoints.onboardScreen.path,
          builder: (context, state) => const OnboardingScreen(),
        ),

        // Sign in screen
        GoRoute(
          path: RouteEndpoints.sigInScreen.path,
          builder: (context, state) => const SignInScreen(),
        ),

        // Home screen
        GoRoute(
          path: RouteEndpoints.homeScreen.path,
          builder: (context, state) => BottomNavigation(),
        ),
      ],
    );
}