import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/dwew.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/modules/authentication_module/auth_router.dart';
import 'package:bnf/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:bnf/utils/extensions/context_go_extension.dart';

class ResetPasswordScreen extends StatefulWidget {
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
    return BlocProvider.value(
      value: authCubit,
      child: ScaffoldShell(
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
                            'Reset Password',
                            style: context
                                .typoraphyTheme.titleLarge.primary.textStyle,
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
                        const Gap(32),
                        AppThemeElevatedButton(
                          background: context.colorTheme.secondaryContainer,
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            authCubit.requestResetPassword(
                              email: _emailController.text,
                              onSuccess: () => context
                                  .neglectNamed(confrimOtpCodeRoute.name),
                              onFailure: () {},
                            );
                          },
                          child: Text(
                            'Get Code',
                            style: context.typoraphyTheme.subtitleMedium
                                .onSecondaryContainer.textStyle,
                          ),
                        ),
                        const Gap(16),
                        TextButton(
                          onPressed: () {
                            context.neglectNamed(signinRoute.name);
                          },
                          child: Text(
                            'Back to Login',
                            style: context.typoraphyTheme.primaryLink.textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
