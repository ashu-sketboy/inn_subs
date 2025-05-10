import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField.outlineBorder({
    super.key,
    this.borderRadius = 4,
    this.textStyle,
    this.controller,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.counterText = false,
    this.counterStyle,
    this.initialValue,
    this.inputFormatter,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onFieldSubmitted,
  }) : _isOutlinedBorder = true;

  const CustomTextField.underlineBorder({
    super.key,
    this.borderRadius = 4,
    this.textStyle,
    this.controller,
    this.counterText = false,
    this.counterStyle,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.inputFormatter,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onFieldSubmitted,
  }) : _isOutlinedBorder = false;

  final bool _isOutlinedBorder;
  final bool isCollapsed;
  final bool setMaxLineNull;
  // ===============================
  final double? hintTextSize;
  final String? hintText;
  final double borderRadius;
  final Widget? suffixIcon, prefixIcon;
  final EdgeInsets? contentPadding;
  final String? labelText;
  final TextStyle? labelTextStyle, textStyle, errorTextStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool counterText;
  final TextStyle? counterStyle;
  final bool? enabled;
  final int? maxLines, maxLength;
  final TextEditingController? controller;
  final Color? borderColor, hintColor;
  final BoxConstraints? suffixIconConstraints, prefixIconConstraints;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Timer? _debounce;

  // bool isSomethingInString = false;

  // void _onTypingFinished() {
  //   if (_debounce != null) {
  //     _debounce!.cancel();
  //   }

  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     // Call your callback function here
  //     if (widget.controller!.text.trim().isNotEmpty || isSomethingInString) {
  //       isSomethingInString = false;
  //       // add(const ReportsEvent.getAdmissionYearWise(pageNo: 1));
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _onTypingFinished();
  //   // addlistner((){});
  // }

  // @override
  // void dispose() {
  //   widget.controller?.removeListener(() {});
  //   _debounce?.cancel();
  //   // widget.controller?.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    InputBorder border =
        widget._isOutlinedBorder
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color:
                    widget.borderColor ??
                    Theme.of(context).colorScheme.onSurface,
              ),
            )
            : UnderlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color:
                    widget.borderColor ??
                    Theme.of(context).colorScheme.onSurface,
              ),
            );

    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      initialValue: widget.initialValue,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      maxLines: widget.setMaxLineNull ? null : widget.maxLines ?? 1,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        isCollapsed: widget.isCollapsed,
        counterText: widget.counterText ? null : '',
        counterStyle:
            widget.counterStyle ?? Theme.of(context).textTheme.bodyMedium,
        labelText: widget.labelText,
        labelStyle:
            widget.labelTextStyle ?? Theme.of(context).textTheme.bodyMedium,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: widget.hintTextSize,
          color: widget.hintColor,
        ),
        errorStyle: widget.errorTextStyle,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        fillColor:
            widget.enabled ?? true
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.surface.withOpacity(0.5),
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: widget.suffixIconConstraints,
        prefixIconConstraints: widget.prefixIconConstraints,
        contentPadding: widget.contentPadding,
      ),
    );
  }
}
