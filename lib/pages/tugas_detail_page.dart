// ignore_for_file: deprecated_member_use, must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/models/tugas.dart';
import 'package:pembelajaran/models/user.dart';
import 'package:pembelajaran/services/get/get_picker.dart';
import 'package:pembelajaran/services/image_picker.dart';
import 'package:pembelajaran/services/tugas_service.dart';

class DetailTugas extends StatelessWidget {
  final Tugas tugas;
  final User user;
  DetailTugas(
    this.tugas,
    this.user,
  );

  final pickerController = Get.put(PickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6930c3),
        title: Text('UPLOAD TUGAS'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Center(
              child: Text(
                tugas.name!,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GetBuilder<PickerController>(
                  builder: (_) => (pickerController.pickedFile == null)
                      ? Text('Tidak ada gambar')
                      : Image(
                          height: Get.height / 3,
                          image: FileImage(
                              File(pickerController.pickedFile!.path))))),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(Size(Get.width - 20, 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: Text(
                "PILIH GAMBAR",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                imgFromGallery();
              }),
          SizedBox(
            height: 10,
          ),
          GetBuilder<PickerController>(
            builder: (_) => ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(Get.width - 20, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text(
                  "KIRIM",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  TugasService.upload(user.id, tugas.id!);
                }),
          ),
        ],
      ),
    );
  }
}
