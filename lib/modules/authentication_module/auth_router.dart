import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/modules/authentication_module/confirm_otp_module.dart';
import 'package:rcp/modules/authentication_module/confirm_password_module.dart';
import 'package:rcp/modules/authentication_module/reset_password_module.dart';
import 'package:rcp/modules/authentication_module/signin_module.dart';
import 'package:rcp/modules/authentication_module/signup_module.dart';

fadeTransitionPageBuilder({
  required ValueKey<String> pageKey,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: pageKey,
    restorationId: pageKey.value,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    child: child,
  );
}

final authRoute = GoRouteNamed(
  path: '/auth',
  name: 'auth',
  builder: (context, state) => const SizedBox.expand(),
  redirect: (context, state) => state.fullPath == '/auth'
      ? state.namedLocation(SigninScreen.route.name)
      : null,
  routes: [
    SigninScreen.route,
    resetPasswordRoute,
    updatePasswordRoute,
    signupRoute,
  ],
);

final signupRoute = GoRouteNamedPage(
  path: 'signup',
  name: 'signup',
  pageBuilder: (context, state) => fadeTransitionPageBuilder(
    pageKey: state.pageKey,
    child: const SignupScreen(),
  ),
);

final resetPasswordRoute = GoRouteNamedPage(
  path: 'reset_password',
  name: 'reset_password',
  pageBuilder: (context, state) => fadeTransitionPageBuilder(
    pageKey: state.pageKey,
    child: const ResetPasswordScreen(),
  ),
  routes: [
    confrimOtpCodeRoute,
  ],
);

final confrimOtpCodeRoute = GoRouteNamed(
  path: 'confrim_otp_code',
  name: 'confrim_otp_code',
  builder: (context, state) => fadeTransitionPageBuilder(
    pageKey: state.pageKey,
    child: const ConfirmOtpCodeScreen(),
  ),
);

final updatePasswordRoute = GoRouteNamed(
  path: 'confrim_password',
  name: 'confrim_password',
  builder: (context, state) => fadeTransitionPageBuilder(
    pageKey: state.pageKey,
    child: const ConfirmPasswordScreen(),
  ),
);
