enum RouteEndpoints {
  splashScreen('/'),
  onboardScreen('/onboard'),
  sigInScreen('/sign_in'),
  homeScreen('/home');

  final String path;

  const RouteEndpoints(this.path);
}
