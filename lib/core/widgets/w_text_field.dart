import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';

import '../constants/app_colors.dart';

class WTextField extends StatefulWidget {
  final bool? hasBorderColor;
  final bool? hasClearButton;
  final String title;
  final double borderRadius;
  final double? cursorHeight;
  final Color? cursorColor;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? prefixStyle;
  final TextStyle? hintTextStyle;
  final bool? hideCounterText;
  final Widget? prefix;
  final EdgeInsets? prefixPadding;
  final double? width;
  final double? height;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? isObscureText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final EdgeInsets? suffixPadding;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final EdgeInsets? contentPadding;
  final bool hasError;
  final double sizeBetweenFieldTitle;
  final Color? errorColor;
  final bool? readonly;
  final Color? fillColor;
  final EdgeInsets? margin;
  final VoidCallback? onEyeTap;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function? onTapSuffix;
  final Function()? onEditCompleted;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final int? maxlines;
  final int? minLines;
  final bool autoFocus;
  final Color? disabledColor;
  final Function()? onClearTap;
  final String? titleWidget;
  final ValueChanged<bool>? onFocusChange;
  final Border? border;
  final Color? borderColor;
  final bool? floatingLabel; // yangi parametr
  final bool? isDense;

  const WTextField({
    this.validator,
    this.onFocusChange,
    this.controller,
    this.onChanged,
    this.hasBorderColor,
    this.disabledColor,
    this.hideCounterText,
    this.borderColor,
    this.autoFocus = false,
    this.borderRadius = 32,
    this.maxlines = 1,
    this.prefixStyle,
    this.hasClearButton,
    this.textAlign = TextAlign.start,
    this.width,
    this.fillColor,
    this.title = '',
    this.titleTextStyle,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.border,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    this.prefix,
    this.prefixPadding = const EdgeInsets.all(2),
    this.suffix,
    this.suffixIcon,
    this.suffixPadding = const EdgeInsets.all(12),
    this.isObscureText,
    this.onEyeTap,
    this.margin,
    this.sizeBetweenFieldTitle = 8,
    this.errorColor,
    this.hasError = false,
    this.textInputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyBoardType,
    this.maxLength,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.height,
    this.onTapSuffix,
    super.key,
    this.onEditCompleted,
    this.minLines,
    this.onTap,
    this.onClearTap,
    this.titleWidget,
    this.cursorColor,
    this.cursorHeight,
    this.readonly,
    this.floatingLabel = false,
    this.isDense = false,
  });

  @override
  _WTextFieldState createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField>
    with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    focusNode = FocusNode();

    focusNode.addListener(() {
      setState(() => focused = !focused);
      widget.onFocusChange != null
          ? widget.onFocusChange!(focusNode.hasFocus)
          : null;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Text(
              widget.title,
              style: widget.titleTextStyle ?? theme.textTheme.displayMedium,
            ),
          SizedBox(
            height:
                widget.title.isNotEmpty || widget.titleWidget != null
                    ? widget.sizeBetweenFieldTitle
                    : null,
          ),
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 60,
                    spreadRadius: 5,
                    offset: Offset(12, 30),
                    color: AppColors.shadowBlue,
                  ),
                ],
                borderRadius: BorderRadius.circular(32),
                color: AppColors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: TextFormField(
                      validator: widget.validator,
                      readOnly: widget.readonly ?? false,
                      onTap: widget.onTap ?? () {},
                      textAlign: widget.textAlign,
                      inputFormatters: widget.textInputFormatters,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      obscureText: widget.isObscureText ?? false,
                      keyboardType: widget.keyBoardType,
                      maxLength: widget.maxLength,
                      controller: widget.controller,
                      minLines: widget.minLines ?? 1,
                      maxLines: widget.maxlines,
                      autofocus: widget.autoFocus,
                      cursorColor:
                          widget.cursorColor ?? Colors.black.withOpacity(0.4),
                      cursorHeight: widget.cursorHeight ?? 20,
                      onEditingComplete: widget.onEditCompleted,
                      onChanged: (s) {
                        setState(() => hasText = s.isNotEmpty);
                        if (widget.onChanged != null) {
                          widget.onChanged!(s);
                        }
                      },
                      focusNode: focusNode,
                      style: widget.textStyle ?? AppTextStyles.s14w600,
                      decoration: InputDecoration(
                        isDense: widget.isDense,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 1,
                            color:
                                widget.hasError
                                    ? theme.colorScheme.error
                                    : AppColors.gray100,
                          ),
                        ),
                        errorStyle: const TextStyle(fontSize: 0),
                        counterText:
                            widget.hideCounterText != null &&
                                    widget.hideCounterText!
                                ? ''
                                : null,
                        labelText:
                            widget.floatingLabel == true
                                ? widget.hintText
                                : null,
                        labelStyle: widget.hintTextStyle,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelBehavior:
                            widget.floatingLabel == true
                                ? FloatingLabelBehavior.auto
                                : FloatingLabelBehavior.never,
                        hintText:
                            widget.floatingLabel != true
                                ? widget.hintText
                                : null,
                        hintStyle:
                            widget.hintTextStyle ??
                            AppTextStyles.s16w400.copyWith(color: Colors.grey),
                        filled: true,
                        suffix: widget.suffix,
                        suffixIcon:
                            widget.suffixIcon != null
                                ? IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    widget.onTapSuffix!();
                                  },
                                  icon: widget.suffixIcon ?? const SizedBox(),
                                )
                                : null,
                        prefixIcon: widget.prefix,
                        fillColor: widget.fillColor ?? Colors.transparent,
                        contentPadding: widget.contentPadding,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius,
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color:
                                widget.hasBorderColor != null &&
                                        !widget.hasBorderColor!
                                    ? widget.borderColor ?? AppColors.gray100
                                    : widget.hasError
                                    ? Colors.red
                                    : AppColors.gray100,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius,
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color:
                                widget.hasBorderColor != null &&
                                        !widget.hasBorderColor!
                                    ? widget.borderColor ?? AppColors.gray100
                                    : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : AppColors.gray100,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius,
                          ),
                          borderSide: BorderSide(
                            width: 1,
                            color:
                                widget.hasBorderColor != null &&
                                        !widget.hasBorderColor!
                                    ? widget.borderColor ?? AppColors.gray100
                                    : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : AppColors.gray100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
