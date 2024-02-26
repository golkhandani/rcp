import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/scaffold_shell.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:rcp/modules/authentication_module/bloc/auth_state.dart';
import 'package:rcp/modules/dashboard_module/dashboard_router.dart';
import 'package:rcp/utils/extensions/context_go_extension.dart';

final profileCreationRoute = GoRouteNamed(
  path: '/profile_creation',
  name: 'profile_creation',
  builder: (context, state) => const ProfileCreationScreen(),
);

class ProfileCreationScreen extends StatefulWidget {
  const ProfileCreationScreen({super.key});

  @override
  State<ProfileCreationScreen> createState() => _ProfileCreationScreenState();
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class _ProfileCreationScreenState extends State<ProfileCreationScreen> {
  late final AuthenticationCubit authCubit = context.read();
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
  }

  void _createProfile() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    authCubit.createProfile(
      username: _usernameController.text.trim().toLowerCase(),
      fullname: _fullnameController.text.trim(),
      onSuccess: () => context.neglectNamed(dashboardRoute.name),
      onFailure: () {},
    );
  }

  void _goToSignin() {
    authCubit.logout();
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
                      AppLogo(
                        labelText: 'Profile!',
                        foregroundColor: context.colorTheme.secondary,
                      ),
                      const Gap(24),
                      BasicTextInput.secondary(
                        fieldName: 'username_field',
                        labelText: 'Username',
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LowerCaseTextFormatter(),
                        ],
                        validator: ValidationBuilder()
                            .minLength(8)
                            .maxLength(16)
                            .required()
                            .regExp(
                              RegExp(r"^\S+\w{8,32}\S{1,}"),
                              'Username should not contains space or special characters!',
                            )
                            .build(),
                      ),
                      const Gap(8),
                      BasicTextInput.secondary(
                        fieldName: 'fullname_field',
                        labelText: 'Full Name',
                        controller: _fullnameController,
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationBuilder()
                            .minLength(4)
                            .maxLength(42)
                            .required()
                            .build(),
                      ),
                      const Gap(32),
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          return BasicElevatedButton(
                            background: context.colorTheme.secondary,
                            foreground: context.colorTheme.onSecondary,
                            isLoading: state.isLoading,
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              _createProfile();
                            },
                            labelText: 'Create',
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
        ));
  }
}
