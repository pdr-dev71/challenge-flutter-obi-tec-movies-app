// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final TextCapitalization? capitalization;
  final Widget? prefixIcon;
  final String? labelText;
  final bool filed;

  final Color? fillcolor;
  final bool? enabled;
  final bool? obscureText;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;

  final FloatingLabelBehavior? floatingLabelBehavior;

  const CustomTextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    this.fillcolor,
    this.enabled,
    this.obscureText,
    this.keyboardtype,
    this.validator,
    this.autovalidateMode,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.floatingLabelBehavior,
    this.focusNode,
    this.nextFocus,
    this.inputType,
    this.inputAction,
    this.isPassword,
    this.onChanged,
    this.onSubmit,
    this.isEnabled,
    this.maxLines,
    this.capitalization,
    required this.filed,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardtype,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            width: 1.25,
            color: Color(0xFF5FCFED),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        fillColor: widget.fillcolor,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        border: InputBorder.none,
      ),
    );
  }
}
