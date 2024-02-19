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

class ConfirmOtpCodeScreen extends StatefulWidget {
  const ConfirmOtpCodeScreen({super.key});

  @override
  State<ConfirmOtpCodeScreen> createState() => _ConfirmOtpCodeScreenState();
}

class _ConfirmOtpCodeScreenState extends State<ConfirmOtpCodeScreen> {
  late final AuthenticationCubit authCubit = context.read();
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
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
                          'Reset Password Code',
                          style: context
                              .typoraphyTheme.titleLarge.primary.textStyle,
                        ),
                      ),
                      const Gap(64),
                      Text(
                        'Code',
                        style: context.typoraphyTheme.subtitleMedium
                            .onBackground.textStyle,
                      ),
                      const Gap(4),
                      FormBuilderTextField(
                        name: 'otp_code_field',
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: _otpController,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const Gap(32),
                      AppThemeElevatedButton(
                        background: context.colorTheme.cardBackground,
                        width: MediaQuery.sizeOf(context).width,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          authCubit.loginWithOtp(
                            otp: _otpController.text,
                            onSuccess: () =>
                                context.neglectNamed(confrimPasswordRoute.name),
                            onFailure: () {},
                          );
                          // update password and go to dashboard
                        },
                        child: Text(
                          'Submit',
                          style: context.typoraphyTheme.subtitleMedium
                              .onCardBackground.textStyle,
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
        ));
  }
}
