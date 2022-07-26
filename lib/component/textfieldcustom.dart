import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugasakhir/component/style.dart';

class Fieldcustome extends StatefulWidget {
  final String hintText;
  final int? line;
  final Widget? icon;
  final Widget? suffic;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  // ignore: use_key_in_widget_constructors
  const Fieldcustome({
    required this.hintText,
    this.controller,
    this.line,
    this.textInputType,
    this.icon,
    this.validator,
    this.onChanged,
    this.suffic,
    this.inputFormatter,
  });
  @override
  _RoundIconDataState createState() => _RoundIconDataState();
}

class _RoundIconDataState extends State<Fieldcustome> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Style.text1Color,
        // border: Border.all(color: Style.secondColor),
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      child: TextFormField(
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.textInputType,
        maxLines: widget.line,
        controller: widget.controller,
        style: TextStyle(
            color: Style.text2Color, fontFamily: Style.font, fontSize: 14),
        decoration: InputDecoration(
            prefixIcon: widget.icon,
            label: Text(
              widget.hintText,
              style: TextStyle(
                  color: Style.text2Color,
                  fontFamily: Style.font,
                  fontSize: 14),
            ),
            suffixIcon: widget.suffic,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Style.secondColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Style.secondColor),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontFamily: Style.font, fontSize: 14, color: Style.text4Color)),
      ),
    );
  }
}
