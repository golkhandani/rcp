import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/modules/app_onboarding_module/on_boarding_screen.dart';

final onBoardingRoute = GoRouteNamedPage(
  path: '/on_boarding',
  name: 'on_boarding',
  pageBuilder: animatedPageBuilder(const OnBoardingScreen()),
);
