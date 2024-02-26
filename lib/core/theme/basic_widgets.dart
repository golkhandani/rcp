import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';

class BasicElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String labelText;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final BoxConstraints? constraints;
  final Color? background;
  final Color? foreground;
  const BasicElevatedButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.height = 48,
    this.width = double.infinity,
    this.background,
    this.foreground,
    this.isLoading = false,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final c = background ?? context.customTheme.pallete.primary;
    final f = foreground ?? context.customTheme.pallete.onPrimary;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: constraints == null ? Size(width, height) : null,
        padding: padding,
        maximumSize: constraints == null
            ? null
            : Size(constraints!.maxWidth, constraints!.maxHeight),
        minimumSize: constraints == null
            ? null
            : Size(constraints!.minWidth, constraints!.minHeight),
        splashFactory: NoSplash.splashFactory,
        shadowColor: Colors.black45,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: c,
        foregroundColor: f,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? SizedBox(
              width: height / 2,
              height: height / 2,
              child: CircularProgressIndicator(
                color: f,
              ),
            )
          : Text(
              labelText,
              style: context.typoraphyTheme.subtitleMedium.textStyle,
            ),
    );
  }
}

class BasicLinkButton extends StatelessWidget {
  const BasicLinkButton({
    super.key,
    required this.labelText,
    required this.onPressed,
    this.foreground,
  });
  final String labelText;
  final VoidCallback onPressed;
  final Color? foreground;

  @override
  Widget build(BuildContext context) {
    final f = foreground ?? context.customTheme.pallete.primary;
    return UnconstrainedBox(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(f),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: context.typoraphyTheme.primaryLink
              .copyWithColor(color: f)
              .textStyle,
        ),
      ),
    );
  }
}

enum BasicTextInputDecoration {
  primary,
  secondary,
}

class BasicTextInput extends StatelessWidget {
  const BasicTextInput({
    super.key,
    required this.fieldName,
    this.controller,
    this.labelText,
    this.suffix,
    this.validator,
    this.keyboardType = TextInputType.none,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
  }) : _decorationType = BasicTextInputDecoration.primary;

  const BasicTextInput.secondary({
    super.key,
    required this.fieldName,
    this.controller,
    this.labelText,
    this.suffix,
    this.validator,
    this.keyboardType = TextInputType.none,
    this.obscureText = false,
    this.enabled = true,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
  }) : _decorationType = BasicTextInputDecoration.secondary;

  final String fieldName;
  final TextEditingController? controller;
  final String? labelText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final TextAlign textAlign;

  final BasicTextInputDecoration _decorationType;

  @override
  Widget build(BuildContext context) {
    var decoration = context.themeData.inputDecoration;
    if (_decorationType == BasicTextInputDecoration.secondary) {
      decoration = decoration.copyWith(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: context.colorTheme.secondary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: context.colorTheme.secondaryContainer,
            width: 2.0,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: context.typoraphyTheme.subtitleMedium.onBackground.textStyle,
            textAlign: TextAlign.start,
          ),
          const Gap(4),
        ],
        FormBuilderTextField(
          enabled: enabled,
          name: fieldName,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          decoration: decoration.copyWith(
            suffixIcon: suffix,
          ),
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}

class BasicTextDivider extends StatelessWidget {
  final String labelText;
  const BasicTextDivider({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Divider(
          thickness: 2,
          color: context.colorTheme.onBackground,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          labelText,
          style: context.typoraphyTheme.subtitleMedium.onBackground.textStyle,
        ),
      ),
      Expanded(
        child: Divider(
          thickness: 2,
          color: context.colorTheme.onBackground,
        ),
      ),
    ]);
  }
}

class AppLogo extends StatelessWidget {
  static String heroTag = 'app_logo_hero';
  final String? labelText;
  final Color? foregroundColor;
  const AppLogo({
    this.labelText,
    this.foregroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: Assets.images.logo.provider(),
            radius: 48,
          ),
          if (labelText != null) ...[
            const Gap(8),
            AnimatedDefaultTextStyle(
              style: context.typoraphyTheme.titleSmall.primary
                  .copyWith(color: foregroundColor)
                  .textStyle,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  labelText!,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class BasicBackgroundContainer extends StatelessWidget {
  const BasicBackgroundContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height,
        maxHeight: MediaQuery.sizeOf(context).height,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.loginBg.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
