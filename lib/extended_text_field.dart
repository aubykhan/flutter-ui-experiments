import 'package:flutter/material.dart';

class ExtendedTextField extends StatefulWidget {
  final String hintText;
  final TextStyle hintStyle;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final TextAlign textAlign;
  final TextStyle style;
  final FocusNode focusNode;
  final bool autofocus;
  final TextInputType keyboardType;
  final bool enabled;
  final ValueChanged<String> onSubmitted;

  ExtendedTextField({
    this.hintText,
    this.hintStyle,
    this.obscureText: false,
    this.onChanged,
    this.onSubmitted,
    this.textAlign: TextAlign.start,
    this.style,
    this.focusNode,
    this.autofocus: false,
    this.keyboardType: TextInputType.text,
    this.enabled: true,
  })  : assert(keyboardType != null),
        assert(textAlign != null),
        assert(autofocus != null),
        assert(enabled != null),
        assert(obscureText != null);

  @override
  _FixedTextFieldState createState() => new _FixedTextFieldState();
}

class _FixedTextFieldState extends State<ExtendedTextField> {
  bool _isPlaceholderVisible;
  FocusNode _focusNode;
  
  FocusNode get effectiveFocusNode => _focusNode ??= new FocusNode();

  @override
  void initState() {
    super.initState();
    _isPlaceholderVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    final theme = Theme.of(context);

    if (_isPlaceholderVisible && widget.hintText != null) {
      children.add(Text(
        widget.hintText,
        style: widget.hintStyle ?? theme.textTheme.subhead.copyWith(color: theme.hintColor),
      ));
    }

    children.add(
      new TextField(
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        focusNode: effectiveFocusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        style: widget.style,
        onSubmitted: widget.onSubmitted,
        onChanged: (value) {
          setState(() => _isPlaceholderVisible = value?.length == 0);
          widget.onChanged(value);
        },
        textAlign: widget.textAlign,
      ),
    );

    return new Stack(
      children: children,
      alignment: _stackAlignment,
    );
  }

  Alignment get _stackAlignment {
    switch (widget.textAlign) {
      case TextAlign.start:
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.end:
      case TextAlign.right:
        return Alignment.centerRight;
      case TextAlign.center:
      case TextAlign.justify:
        return Alignment.center;
      default:
        return Alignment.centerLeft;
    }
  }
}