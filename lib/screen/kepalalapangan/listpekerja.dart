import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/model/user_response.dart';

import '../../component/style.dart';
import '../../controller/mainc.dart';

class ListPekerja extends StatefulWidget {
  const ListPekerja({Key? key}) : super(key: key);

  @override
  State<ListPekerja> createState() => _ListPekerjaState();
}

class _ListPekerjaState extends State<ListPekerja> {
  final main = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'List Pekerja Lapang',
              style: TextStyle(
                  color: Style.text2Color,
                  fontFamily: Style.font,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Style.text1Color,
              ),
              child: main.listUser.isEmpty
                  ? Center(
                      child: Text('Data Kosong'),
                    )
                  : ListView.builder(
                      itemCount: main.listUser.length,
                      itemBuilder: (ctx, index) {
                        Users user = main.listUser[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffCFD1D4)),
                            color: Style.text1Color,
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 20,
                            ),
                            title: Text(
                              '${user.name}',
                              style: TextStyle(
                                  color: Style.text2Color,
                                  fontFamily: Style.font,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                        );
                      }),
            ),
          )
        ],
      ),
    );
  }
}
