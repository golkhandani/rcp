import 'package:bnf/core/go_route_named.dart';
import 'package:bnf/modules/authentication_module/confirm_otp_module.dart';
import 'package:bnf/modules/authentication_module/confirm_password_module.dart';
import 'package:bnf/modules/authentication_module/reset_password_module.dart';
import 'package:bnf/modules/authentication_module/signin_module.dart';
import 'package:bnf/modules/authentication_module/signup_module.dart';

final signinRoute = GoRouteNamed(
  path: '/signin',
  name: 'signin',
  builder: (context, state) => const SigninScreen(),
);

final signupRoute = GoRouteNamed(
  path: '/signup',
  name: 'signup',
  builder: (context, state) => const SignupScreen(),
);

final resetPasswordRoute = GoRouteNamed(
  path: '/reset_password',
  name: 'reset_password',
  builder: (context, state) => const ResetPasswordScreen(),
);

final confrimOtpCodeRoute = GoRouteNamed(
  path: '/confrim_otp_code',
  name: 'confrim_otp_code',
  builder: (context, state) => const ConfirmOtpCodeScreen(),
);

final confrimPasswordRoute = GoRouteNamed(
  path: '/confrim_password',
  name: 'confrim_password',
  builder: (context, state) => const ConfirmPasswordScreen(),
);

final authRouter = [
  signinRoute,
  signupRoute,
  resetPasswordRoute,
  confrimOtpCodeRoute,
  confrimPasswordRoute,
];
