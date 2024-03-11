import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextfieldUi extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? readOnly;
  final bool? showCursor;
  final bool? autofocus;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLength;
  final bool? obscureText;
  final bool? autocorrect;
  final TextCapitalization textCapitalization;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool? expands;
  final int? minLines;
  final int? maxLines;
  final bool? expandsNaturally;
  final FocusNode? focusNode;
  final bool? enabled;
  final EdgeInsets? padding;
  final bool? enableIMEPersonalizedLearning;

  const TextfieldUi({
    super.key,
    this.controller,
    this.decoration,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.readOnly,
    this.showCursor,
    this.autofocus,
    this.maxLengthEnforcement,
    this.maxLength,
    this.obscureText = false,
    this.autocorrect = true,
    this.textCapitalization = TextCapitalization.none,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.materialTapTargetSize,
    this.expands = false,
    this.minLines,
    this.maxLines = 1,
    this.expandsNaturally = false,
    this.focusNode,
    this.enabled = true,
    this.padding,
    this.enableIMEPersonalizedLearning,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration!.copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.0),
        ),
      ),
      textInputAction: textInputAction,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      readOnly: readOnly ?? false,
      showCursor: showCursor,
      autofocus: autofocus ?? false,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      autocorrect: autocorrect ?? true,
      textCapitalization: textCapitalization,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions ?? true,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
    );
  }
}
