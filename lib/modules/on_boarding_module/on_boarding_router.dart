import 'package:go_router/go_router.dart';

import 'package:bnf/modules/on_boarding_module/on_boarding_screen.dart';

final onBoardingRoute = GoRoute(
  path: '/on_boarding',
  builder: (context, state) => const OnBoardingScreen(),
);
