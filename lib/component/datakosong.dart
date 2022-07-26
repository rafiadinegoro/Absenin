import 'package:flutter/material.dart';

class DataKosong extends StatefulWidget {
  const DataKosong({Key? key}) : super(key: key);

  @override
  _DataKosongState createState() => _DataKosongState();
}

class _DataKosongState extends State<DataKosong> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          Image.asset(
            'assets/images/no-data.png',
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(
            height: 15,
          ),
          Text('Data Kosong')
        ],
      ),
    );
  }
}
