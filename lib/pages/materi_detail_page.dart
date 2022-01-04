// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pembelajaran/model/materi.dart';
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/services/materi_detail_service.dart';

class DetailMateriPage extends StatelessWidget {
  final Materi materi;
  DetailMateriPage(this.materi);

  final materiDetailController = Get.put(MateriDetailController());
  @override
  Widget build(BuildContext context) {
    MateriDetailService.getMateriDetail(materi.id!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00917c),
        title: Text("${materi.title.toString()}".toUpperCase()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  10, 0, 10, (materi.konten == null) ? 10 : 0),
              child: GetBuilder<MateriDetailController>(
                builder: (_) => ListView.builder(
                    itemCount: materiDetailController.materiDetail.length,
                    itemBuilder: (BuildContext context, i) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Image.network(BaseUrl.image +
                            materiDetailController.materiDetail[i].image!),
                      );
                    }),
              ),
            ),
          ),
          (materi.konten == null)
              ? SizedBox()
              : Html(data: """${materi.konten}""", style: {
                  "p": Style(fontSize: FontSize(18)),
                })
        ],
      ),
    );
  }
}
