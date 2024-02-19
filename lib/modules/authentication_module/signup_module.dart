import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';

import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/dwew.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/modules/authentication_module/auth_router.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:bnf/utils/extensions/context_go_extension.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final AuthenticationCubit authCubit = context.read();
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

  void _signup() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    authCubit.signupWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      onSuccess: _goToSignin,
      onFailure: () {},
    );
  }

  void _goToSignin() {
    context.neglectNamed(signinRoute.name);
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
                          style: context.typoraphyTheme.titleMedium.onBackground
                              .textStyle,
                        ),
                      ),
                      const Gap(64),
                      Text(
                        'Email',
                        style: context.typoraphyTheme.subtitleMedium
                            .onBackground.textStyle,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'email_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const Gap(8),
                      Text(
                        'Password',
                        style: context.typoraphyTheme.subtitleMedium
                            .onBackground.textStyle,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'password_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _passwordController,
                        decoration: context.themeData.inputDecoration.copyWith(
                          suffixIcon: IconButton(
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
                      Text(
                        'Confirm Password',
                        style: context.typoraphyTheme.subtitleMedium
                            .onBackground.textStyle,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'password_confirmation_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _passwordConfirmationController,
                        decoration: context.themeData.inputDecoration.copyWith(
                          suffixIcon: IconButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
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
                        validator: (value) {
                          if (_formKey.currentState?.fields['password_field']
                                  ?.value !=
                              value) {
                            return 'Password Confirmation does not match!';
                          }
                          return null;
                        },
                      ),
                      const Gap(16),
                      AppThemeElevatedButton(
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _signup();
                        },
                        child: Text(
                          'Signup',
                          style: context.typoraphyTheme.subtitleMedium.onPrimary
                              .textStyle,
                        ),
                      ),
                      const Gap(32),
                      Row(children: <Widget>[
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: context.typoraphyTheme.hint.textStyle,
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
                          _goToSignin();
                        },
                        child: Text(
                          'Signin',
                          style: context.typoraphyTheme.subtitleMedium
                              .onSecondary.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
