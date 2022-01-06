import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/models/user.dart';
import 'package:pembelajaran/services/get/get_nilai.dart';
import 'package:pembelajaran/services/nilai_service.dart';
import 'package:pembelajaran/widgets/shimmer_widget.dart';

class NilaiPage extends StatelessWidget {
  final User user;
  NilaiPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final nilaiController = Get.put(NilaiController());
  @override
  Widget build(BuildContext context) {
    NilaiService.getNilai(user.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6930c3),
        title: Text('NILAI TUGAS'),
      ),
      body: GetBuilder<NilaiController>(
        builder: (_) => (nilaiController.isLoad)
            ? ShimmerWidget()
            : ListView.builder(
                itemCount: nilaiController.nilai.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    tileColor: (nilaiController.nilai[index].nilai! < 1)
                        ? Colors.white
                        : (nilaiController.nilai[index].nilai! > 0 &&
                                nilaiController.nilai[index].nilai! < 50)
                            ? Colors.red
                            : (nilaiController.nilai[index].nilai! > 49 &&
                                    nilaiController.nilai[index].nilai! < 80)
                                ? Colors.orange
                                : Colors.green,
                    textColor: (nilaiController.nilai[index].nilai! < 1)
                        ? Colors.black
                        : Colors.white,
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                      child:
                          Text(nilaiController.nilai[index].nilai.toString()),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(nilaiController.nilai[index].name!),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
