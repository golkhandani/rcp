import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/modules/authentication_module/auth_router.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';
import 'package:bnf/utils/extensions/context_go_extension.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthenticationCubit signupCubit = locator.get();
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
  }

  void _signin() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    signupCubit.signinWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      onSuccess: _goToDashboard,
      onFailure: () {},
    );
  }

  void _goToDashboard() {
    context.neglectNamed(dashboardRoute.name!);
  }

  void _goToSignup() {
    context.neglectNamed(signupRoute.name!);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
        safeareaColor: context.colorTheme.background,
        bodyColor: context.colorTheme.background,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 64),
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightForFinite(
                    width: 420,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Welcome',
                          style:
                              context.textTheme.titleMedium.onBackground.style,
                        ),
                      ),
                      const Gap(64),
                      Text(
                        'Email',
                        style:
                            context.textTheme.subtitleMedium.onBackground.style,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'email_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _emailController,
                        decoration: context.inputDecoration(),
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const Gap(8),
                      Text(
                        'Password',
                        style:
                            context.textTheme.subtitleMedium.onBackground.style,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'password_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _passwordController,
                        decoration: context.inputDecoration(
                          suffix: IconButton(
                            style: const ButtonStyle(
                                splashFactory: NoSplash.splashFactory),
                            splashColor: Colors.transparent,
                            icon: Icon(_obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.none,
                        obscureText: _obscurePassword,
                        validator: ValidationBuilder()
                            .minLength(8)
                            .maxLength(16)
                            .build(),
                      ),
                      const Gap(16),
                      AppThemeElevatedButton(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _signin();
                        },
                        child: Text(
                          'Signin',
                          style:
                              context.textTheme.subtitleMedium.onPrimary.style,
                        ),
                      ),
                      const Gap(32),
                      Row(children: <Widget>[
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: context.textTheme.hint.style,
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ]),
                      const Gap(32),
                      AppThemeElevatedButton(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.zero,
                        background: context.colorTheme.secondary,
                        onPressed: () {
                          _goToSignup();
                        },
                        child: Text(
                          'Signup',
                          style: context.textTheme.subtitleMedium
                              .withColor(Colors.white)
                              .style,
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
