import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/style.dart';

class TextFieldFullPassCustome extends StatefulWidget {
  final String hintText;
  final int? line;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? widget;
  final String? Function(String?)? validator;

  // ignore: use_key_in_widget_constructors
  const TextFieldFullPassCustome({
    required this.hintText,
    this.controller,
    this.line,
    this.textInputType,
    this.widget,
    this.validator,
  });
  @override
  _RoundIconDataState createState() => _RoundIconDataState();
}

class _RoundIconDataState extends State<TextFieldFullPassCustome> {
  final _showpass = true.obs;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      child: Obx(() => TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            obscureText: _showpass.value,
            keyboardType: widget.textInputType,
            controller: widget.controller,
            style: TextStyle(
                color: Style.text2Color, fontFamily: Style.font, fontSize: 14),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    _showpass.toggle();
                  },
                  icon: Icon(
                    _showpass.value == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Style.text2Color,
                  ),
                ),
                hintText: widget.hintText,
                label: Text(
                  widget.hintText,
                  style: TextStyle(
                      color: Style.text2Color,
                      fontFamily: Style.font,
                      fontSize: 14),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Style.secondColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Style.secondColor),
                ),
                hintStyle: TextStyle(
                    fontFamily: Style.font,
                    fontSize: 14,
                    color: Style.text4Color)),
          )),
    );
  }
}
