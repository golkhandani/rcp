import 'package:go_router/go_router.dart';

import 'package:bnf/modules/authentication_module/signin_module.dart';
import 'package:bnf/modules/authentication_module/signup_module.dart';

final signinRoute = GoRoute(
  path: '/signin',
  name: 'signin',
  builder: (context, state) => const SigninScreen(),
);

final signupRoute = GoRoute(
  path: '/signup',
  name: 'signup',
  builder: (context, state) => const SignupScreen(),
);

final authRouter = [
  signupRoute,
  signinRoute,
];
