import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

class SignupScreen extends StatefulWidget {
  static String heroTag = 'signup_btn_hero';
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
      email: _emailController.text.trim(),
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
        child: BasicBackgroundContainer(
          child: MobileFrame(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Gap(48),
                        AppLogo(
                          labelText: 'Join us!',
                          foregroundColor: context.colorTheme.secondary,
                        ),
                        const Gap(24),
                        BasicTextInput.secondary(
                          fieldName: 'email_field',
                          labelText: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const Gap(8),
                        BasicTextInput.secondary(
                          fieldName: 'password_field',
                          labelText: 'Password',
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: _obscurePassword,
                          validator: ValidationBuilder()
                              .minLength(8)
                              .maxLength(16)
                              .build(),
                          suffix: IconButton(
                            splashColor: Colors.transparent,
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        const Gap(8),
                        BasicTextInput.secondary(
                          fieldName: 'password_confirmation_field',
                          labelText: 'Confirm Password',
                          controller: _passwordConfirmationController,
                          keyboardType: TextInputType.text,
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
                        const Gap(32),
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            return Hero(
                              tag: SignupScreen.heroTag,
                              child: BasicElevatedButton(
                                background: context.colorTheme.secondary,
                                foreground: context.colorTheme.onSecondary,
                                isLoading: state.isLoading,
                                width: MediaQuery.sizeOf(context).width,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  _signup();
                                },
                                labelText: 'Signup',
                              ),
                            );
                          },
                        ),
                        const Gap(32),
                        BasicLinkButton(
                          foreground: context.colorTheme.primary,
                          labelText: 'Signin!',
                          onPressed: _goToSignin,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
