import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalifa/core/extensions/extensions.dart';

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
  final String? suffixIcon;
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
  final int? maxlines;
  final int? minLines;
  final bool autoFocus;
  final Color? disabledColor;
  final Function()? onClearTap;
  final String? titleWidget;

  const WTextField({
    this.controller,
    this.onChanged,
    this.hasBorderColor,
    this.disabledColor,
    this.hideCounterText,
    this.autoFocus = false,
    this.borderRadius = 5,
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
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    Key? key,
    this.onEditCompleted,
    this.minLines,
    this.onTap,
    this.onClearTap,
    this.titleWidget,
    this.cursorColor,
    this.cursorHeight,
    this.readonly,
  }) : super(key: key);

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

    focusNode.addListener(
      () => setState(() => focused = !focused),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title.isNotEmpty)
              Text(
                widget.title,
                style: widget.titleTextStyle ??
                    Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                        ),
              ),
            SizedBox(
              height: widget.title.isNotEmpty || widget.titleWidget != null
                  ? widget.sizeBetweenFieldTitle
                  : null,
            ),
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: TextField(
                      readOnly: widget.readonly ?? false,
                      onTap: widget.onTap,
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
                      style: widget.textStyle ??
                          Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasError
                                ? Theme.of(context).colorScheme.error
                                : context.colors.inpBorderColor.withOpacity(.1),
                          ),
                        ),
                        counterText: widget.hideCounterText != null &&
                                widget.hideCounterText!
                            ? ''
                            : null,
                        hintText: widget.hintText,
                        hintStyle: widget.hintTextStyle ??
                            Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w300),
                        filled: true,
                        suffix: widget.suffix,
                        prefixIcon: widget.prefix,
                        fillColor: widget.fillColor ??
                            context.colors.greyish1.withOpacity(0.5),
                        contentPadding: widget.contentPadding,
                        disabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : context.colors.inpBorderColor
                                        .withOpacity(.1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : context.colors.inpBorderColor
                                        .withOpacity(.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : context.colors.inpBorderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
