import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Created by zgm on 2022/1/12
/// Describe:
///

class MTextField extends StatefulWidget {
  const MTextField({
    Key? key,
    this.text,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.autofocus,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.restorationId,
    this.enableIMEPersonalizedLearning,
  }) : super(key: key);
  final String? text;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final InputDecoration? decoration;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final TextCapitalization? textCapitalization;

  final TextStyle? style;

  final StrutStyle? strutStyle;

  final TextAlign? textAlign;

  final TextAlignVertical? textAlignVertical;

  final TextDirection? textDirection;

  final bool? autofocus;

  final String? obscuringCharacter;

  final bool? obscureText;

  final bool? autocorrect;

  final SmartDashesType? smartDashesType;

  final SmartQuotesType? smartQuotesType;

  final bool? enableSuggestions;

  final int? maxLines;

  final int? minLines;

  final bool? expands;

  final bool? readOnly;

  final ToolbarOptions? toolbarOptions;

  final bool? showCursor;

  final int? maxLength;

  final MaxLengthEnforcement? maxLengthEnforcement;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onSubmitted;

  final AppPrivateCommandCallback? onAppPrivateCommand;

  final List<TextInputFormatter>? inputFormatters;

  final bool? enabled;

  final double? cursorWidth;

  final double? cursorHeight;

  final Radius? cursorRadius;

  final Color? cursorColor;

  final Brightness? keyboardAppearance;

  final EdgeInsets? scrollPadding;

  final bool? enableInteractiveSelection;

  final TextSelectionControls? selectionControls;

  final GestureTapCallback? onTap;

  final MouseCursor? mouseCursor;

  final InputCounterWidgetBuilder? buildCounter;

  final ScrollPhysics? scrollPhysics;

  final ScrollController? scrollController;

  final Iterable<String>? autofillHints;

  final String? restorationId;

  final bool? enableIMEPersonalizedLearning;
  @override
  _MTextFieldState createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextField> {
  late TextEditingController controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.text != null && (widget.controller == null || widget.controller?.text == null)) {
      controller.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.key,
      controller: controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign ?? TextAlign.start,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      autocorrect: widget.autocorrect ?? true,
      autofocus: widget.autofocus ?? false,
      obscuringCharacter: widget.obscuringCharacter ?? '•',
      obscureText: widget.obscureText ?? false,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions ?? true,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands ?? false,
      readOnly: widget.readOnly ?? false,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth ?? 2,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
      enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
      selectionControls: widget.selectionControls,
      onTap: widget.onTap,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      autofillHints: widget.autofillHints,
      restorationId: widget.restorationId,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning ?? true,
    );
  }
}
