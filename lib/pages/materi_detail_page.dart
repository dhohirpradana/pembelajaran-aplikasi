// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/materi.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';
import 'package:get/get.dart';

class DetailMateriPage extends StatelessWidget {
  final Materi materi;
  DetailMateriPage(this.materi);

  final materiDetailController = Get.put(MateriDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00917c),
        title: Text("Detail materi "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF00917c),
              ),
              child: Center(
                child: Text(
                  "${materi.title.toString()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
          GetBuilder<MateriDetailController>(
            builder: (_) => (materiDetailController.materiDetail != null)
                ? Image.network(
                    "http://192.168.43.205:8000/storage/images/GX9lwhxuINxgfxfiW3Kd1641152958.jpg")
                : SizedBox(),
          )

          // Expanded(
          //   child: GetBuilder<MateriDetailController>(
          //     builder: (_) => Center(
          //       child: (materiDetailController.materiDetail != null)
          //           ? Container(
          //               margin: EdgeInsets.only(top: 20),
          //               height: 300,
          //               width: 300,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   image: DecorationImage(
          //                       image: NetworkImage(
          //                         BaseUrl.image +
          //                             materiDetailController
          //                                 .materiDetail!.image!,
          //                       ),
          //                       fit: BoxFit.cover)),
          //             )
          //           : SizedBox(),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
