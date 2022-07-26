import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/screen/kepalalapangan/listpekerja.dart';
import 'package:tugasakhir/screen/kepalalapangan/permohonan.dart';
import 'package:tugasakhir/screen/kepalalapangan/registrasi.dart';

class PekerjaScreen extends StatefulWidget {
  const PekerjaScreen({Key? key}) : super(key: key);

  @override
  State<PekerjaScreen> createState() => _PekerjaScreenState();
}

class _PekerjaScreenState extends State<PekerjaScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final main = Get.find<MainController>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Style.mainColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => RegistrasiScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Style.secondColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Style.text1Color,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Tambah Pekerja Lapang',
                      style: TextStyle(
                          color: Style.text1Color,
                          fontFamily: Style.font,
                          fontSize: 11),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => main.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(00287096, 0, 0, 0),
                              borderRadius: BorderRadius.circular(20)),
                          child: TabBar(
                              unselectedLabelColor: const Color(0xffF7F8F8),
                              labelColor:
                                  const Color(0xff000000).withOpacity(0.1),
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Style.text1Color),
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Tab(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: width,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Style.text1Color,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.1),
                                            blurRadius: 20,
                                            offset: const Offset(0, 5),
                                          )
                                        ]),
                                    child: Text(
                                      'PEKERJA LAPANG',
                                      style: TextStyle(
                                          color: Style.text2Color,
                                          fontFamily: Style.font,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    width: width,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Style.text1Color,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Style.text1Color,
                                            blurRadius: 20,
                                            offset: const Offset(0, 5),
                                          )
                                        ]),
                                    child: Text(
                                      'PERMOHONAN CUTI',
                                      style: TextStyle(
                                          color: const Color(0xff9FA3AA),
                                          fontFamily: Style.font,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                              controller: tabController),
                        ),
                      ),
                      Expanded(
                          flex: 9,
                          child: Container(
                            child: TabBarView(
                                controller: tabController,
                                children: [ListPekerja(), Permohonan()]),
                          ))
                    ],
                  ),
                ),
        ));
  }
}
