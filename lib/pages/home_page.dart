import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pembelajaran/models/user.dart';
import 'package:pembelajaran/services/auth_service.dart';
import 'package:pembelajaran/services/first_few_world.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                color: Colors.blue,
                child: Center(
                    child: Icon(
                  (user.jekel == "Perempuan")
                      ? MdiIcons.faceWoman
                      : MdiIcons.faceMan,
                  color: Colors.white,
                  size: Get.width / 3,
                )),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(top: Get.height * 4 / 5 / 7),
                color: Colors.white,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NIK                        : ' +
                            user.nik.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'JENIS KELAMIN  : ' + user.jekel.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'NAMA ORTU        : ' + user.nama_ortu.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ALAMAT               : ' + user.alamat.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'WHATSAPP          : ' + user.whatsapp.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: Get.height / 3, left: 20, right: 20),
          height: 60,
          child: Material(
            elevation: 2,
            child: Container(
              width: Get.width - 40,
              child: Center(
                  child: Text(
                user.name.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              )),
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                    minimumSize:
                        MaterialStateProperty.all(Size(Get.width - 40, 50))),
                onPressed: () {},
                onLongPress: () {
                  Auth.logout();
                },
                child: Text('KELUAR')))
      ],
    );
  }
}
