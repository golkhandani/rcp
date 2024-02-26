import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/modules/authentication_module/confirm_otp_module.dart';
import 'package:rcp/modules/authentication_module/confirm_password_module.dart';
import 'package:rcp/modules/authentication_module/profile_creation_module.dart';
import 'package:rcp/modules/authentication_module/reset_password_module.dart';
import 'package:rcp/modules/authentication_module/signin_module.dart';
import 'package:rcp/modules/authentication_module/signup_module.dart';

final authRoute = GoRouteNamed(
  path: '/auth',
  name: 'auth',
  builder: (context, state) => const Placeholder(),
  redirect: (context, state) =>
      state.fullPath == '/auth' ? state.namedLocation(signinRoute.name) : null,
  routes: [
    signinRoute,
    resetPasswordRoute,
    updatePasswordRoute,
    signupRoute,
    profileCreationRoute,
  ],
);

final signinRoute = GoRouteNamedPage(
  path: 'signin',
  name: 'signin',
  pageBuilder: (context, state) => CustomTransitionPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    child: const SigninScreen(),
  ),
);

final signupRoute = GoRouteNamedPage(
  path: 'signup',
  name: 'signup',
  pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      child: const SignupScreen()),
);

final resetPasswordRoute = GoRouteNamedPage(
  path: 'reset_password',
  name: 'reset_password',
  pageBuilder: (context, state) => CustomTransitionPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    child: const ResetPasswordScreen(),
  ),
  routes: [
    confrimOtpCodeRoute,
  ],
);

final confrimOtpCodeRoute = GoRouteNamed(
  path: 'confrim_otp_code',
  name: 'confrim_otp_code',
  builder: (context, state) => const ConfirmOtpCodeScreen(),
);

final updatePasswordRoute = GoRouteNamed(
  path: 'confrim_password',
  name: 'confrim_password',
  builder: (context, state) => const ConfirmPasswordScreen(),
);

final profileCreationRoute = GoRouteNamed(
  path: 'profile_creation',
  name: 'profile_creation',
  builder: (context, state) => const ProfileCreationScreen(),
);
