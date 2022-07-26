import 'package:flutter/material.dart';
import 'package:tugasakhir/component/style.dart';

class ButtonCustom extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  // ignore: use_key_in_widget_constructors
  const ButtonCustom({
    required this.text,
    required this.onPressed,
  });
  @override
  _RoundIconDataState createState() => _RoundIconDataState();
}

class _RoundIconDataState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: height * 0.065,
        width: width,
        alignment: const Alignment(0, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Style.secondColor),
        child: Text(
          widget.text,
          style: TextStyle(
              fontFamily: Style.font,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
