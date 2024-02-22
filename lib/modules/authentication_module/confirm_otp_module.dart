import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

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
                      const Gap(48),
                      const AppLogo(labelText: 'Update Password'),
                      const Gap(24),
                      BasicTextInput(
                        fieldName: 'otp_code_field',
                        labelText: 'Code',
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                      ),
                      const Gap(32),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          return BasicElevatedButton(
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              authCubit.loginWithOtp(
                                otp: _otpController.text,
                                onSuccess: () => context
                                    .neglectNamed(confrimPasswordRoute.name),
                                onFailure: () {},
                              );
                            },
                            labelText: 'Submit',
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
        ));
  }
}
