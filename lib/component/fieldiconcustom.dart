import 'package:flutter/material.dart';
import 'package:tugasakhir/component/style.dart';

class TextFieldIconCustom extends StatefulWidget {
  final String hintText;
  final int? line;
  final Widget? icon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  // ignore: use_key_in_widget_constructors
  const TextFieldIconCustom({
    required this.hintText,
    this.controller,
    this.line,
    this.textInputType,
    this.icon,
    this.validator,
  });
  @override
  _RoundIconDataState createState() => _RoundIconDataState();
}

class _RoundIconDataState extends State<TextFieldIconCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        style: TextStyle(color: Style.text2Color),
        decoration: InputDecoration(
            prefixIcon: widget.icon,
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Style.secondColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Style.secondColor)),
            hintStyle: TextStyle(
                fontFamily: Style.font, fontSize: 12, color: Style.text4Color)),
      ),
    );
  }
}
