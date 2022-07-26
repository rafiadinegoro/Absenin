import 'package:flutter/material.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/style.dart';

class DropDownCustom extends StatefulWidget {
  final String hinttext;
  final Function(dynamic)? onChange;
  final List<DropdownMenuItem<dynamic>>? dropdwon;
  final dynamic object;
  const DropDownCustom(
      {Key? key,
      required this.hinttext,
      this.onChange,
      this.dropdwon,
      this.object})
      : super(key: key);

  @override
  _DropDownCustomState createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      child: DropdownButtonFormField(
        value: widget.object,
        hint: Text(
          widget.hinttext,
          style: TextStyle(
              fontFamily: Style.font,
              fontSize: 14.0,
              color: Style.text4Color,
              decorationColor: Colors.white),
        ),
        dropdownColor: Style.mainColor,
        items: widget.dropdwon,
        onChanged: widget.onChange,
        style: TextStyle(
            fontFamily: Style.font,
            fontSize: 14.0,
            color: Style.text1Color,
            decorationColor: Style.text1Color),
        decoration: InputDecoration(
          label: Text(
            widget.hinttext,
            style: TextStyle(
                color: Style.text2Color, fontFamily: Style.font, fontSize: 14),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Style.secondColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Style.secondColor),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
