import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/modules/authentication_module/reset_password_module.dart';
import 'package:rcp/modules/authentication_module/signup_module.dart';
import 'package:rcp/modules/dashboard_module/dashboard_router.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final AuthenticationCubit authCubit = context.read();
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _signedinWithEmail = false;

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
    setState(() {
      _signedinWithEmail = true;
    });
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    authCubit.signinWithEmail(
      email: _emailController.text,
      password: _passwordController.text,
      onSuccess: () => context.neglectNamed(dashboardRoute.name),
      onFailure: () {
        setState(() {
          _signedinWithEmail = false;
        });
      },
    );
  }

  void _goToSignup() {
    context.neglectNamed(signupRoute.name);
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
                        const AppLogo(labelText: 'Welcome Back!'),
                        const Gap(24),
                        BasicTextInput(
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
                        BasicTextInput(
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
                        const Gap(16),
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            return Hero(
                              tag: ResetPasswordScreen.heroTag,
                              child: BasicElevatedButton(
                                isLoading: state.isLoading,
                                labelText: 'Signin',
                                width: MediaQuery.sizeOf(context).width,
                                onPressed: () {
                                  _signin();
                                },
                              ),
                            );
                          },
                        ),
                        const Gap(16),
                        BasicLinkButton(
                          foreground: context.colorTheme.primary,
                          labelText: 'Forgot Password?',
                          onPressed: () {
                            context.neglectNamed(resetPasswordRoute.name);
                          },
                        ),
                        const Gap(16),
                        SupaSocialsAuth(
                            showSuccessSnackBar: false,
                            socialProviders: const [
                              OAuthProvider.google,
                              OAuthProvider.apple,
                            ],
                            onSuccess: (session) {
                              if (_signedinWithEmail) {
                                return;
                              }
                              context.neglectNamed(dashboardRoute.name);
                            }),
                        const Gap(16),
                        const BasicTextDivider(
                          labelText: "Don't have an account?",
                        ),
                        const Gap(24),
                        Hero(
                          tag: SignupScreen.heroTag,
                          child: BasicElevatedButton(
                            labelText: 'Signup',
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.zero,
                            background: context.colorTheme.secondary,
                            foreground: context.colorTheme.onSecondary,
                            onPressed: () {
                              _goToSignup();
                            },
                          ),
                        ),
                        const Gap(16),
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
