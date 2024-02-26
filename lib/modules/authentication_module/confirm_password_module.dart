import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/modules/dashboard_module/dashboard_router.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  late final AuthenticationCubit authCubit = context.read();
  final _formKey = GlobalKey<FormBuilderState>();

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
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(48),
                        const AppLogo(labelText: 'Update Password'),
                        const Gap(24),
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
                        BasicTextInput(
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
                        const Gap(16),
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            return BasicElevatedButton(
                              width: MediaQuery.sizeOf(context).width,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                authCubit.updatePassword(
                                  password: _passwordController.text,
                                  onSuccess: () =>
                                      context.neglectNamed(dashboardRoute.name),
                                  onFailure: () {},
                                );
                              },
                              labelText: 'Update Password',
                            );
                          },
                        ),
                        const Gap(8),
                        const Gap(16),
                        BasicLinkButton(
                          onPressed: () {
                            context.neglectNamed(signinRoute.name);
                          },
                          labelText: 'Back to Login',
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
