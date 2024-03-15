import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../theme/theme_helper.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.showPasswordToggle = false,
    this.iconColor,
  }) : super(
    key: key,
  );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final bool showPasswordToggle;
  final Color? iconColor;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isPasswordVisible;
  late bool _isLogin;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.obscureText!;
  }

  void initLogin() {
    _isLogin = !_isLogin;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
      alignment: widget.alignment ?? Alignment.center,
      child: textFormFieldWidget(context),
    )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
    width: widget.width ?? double.maxFinite,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: widget.controller,
      focusNode: widget.focusNode ?? FocusNode(),
      autofocus: widget.autofocus!,
      style: widget.textStyle ?? theme.textTheme.bodySmall,
      obscureText: !_isPasswordVisible,
      textInputAction: widget.textInputAction!,
      keyboardType: widget.textInputType!,
      maxLines: widget.maxLines ?? 1,
      decoration: decoration,
      validator: widget.validator,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: widget.hintText ?? "",
    hintStyle: widget.hintStyle ?? theme.textTheme.titleMedium,
    prefixIcon: widget.prefix,
    prefixIconConstraints: widget.prefixConstraints,
    suffixIcon: widget.showPasswordToggle
        ? IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: widget.iconColor,
      ),
      onPressed: _togglePasswordVisibility,
    )
        : null,
    suffixIconConstraints: widget.suffixConstraints,
    isDense: true,
    contentPadding: widget.contentPadding ?? EdgeInsets.all(12.h),
    fillColor: widget.fillColor ?? appTheme.blueGray50,
    filled: widget.filled,
    border: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.h),
          borderSide: BorderSide(
            color: appTheme.teal300,
            width: 1,
          ),
        ),
    enabledBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.h),
          borderSide: BorderSide(
            color: appTheme.teal300,
            width: 1,
          ),
        ),
    focusedBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.h),
          borderSide: BorderSide(
            color: appTheme.blue400,
            width: 1,
          ),
        ),
  );
}
