import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

class ResetPasswordScreen extends StatefulWidget {
  static String heroTag = 'reset_password_btn_hero';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final AuthenticationCubit authCubit = context.read();
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
      safeareaColor: context.colorTheme.background,
      bodyColor: context.colorTheme.background,
      child: BasicBackgroundContainer(
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
                    const AppLogo(labelText: 'Reset Password'),
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
                    const Gap(32),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        return Hero(
                          tag: ResetPasswordScreen.heroTag,
                          child: BasicElevatedButton(
                            isLoading: state.isLoading,
                            labelText: 'Get Code',
                            width: MediaQuery.sizeOf(context).width,
                            onPressed: () {
                              authCubit.requestResetPassword(
                                email: _emailController.text,
                                onSuccess: () => context
                                    .neglectNamed(confrimOtpCodeRoute.name),
                                onFailure: () {},
                              );
                            },
                          ),
                        );
                      },
                    ),
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
    );
  }
}
