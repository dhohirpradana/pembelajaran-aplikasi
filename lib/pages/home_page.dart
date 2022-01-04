import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/services/auth_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/materi');
                  },
                  child: Center(
                    child: Container(
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00917c),
                      ),
                      child: Center(
                          child: Text(
                        "MATERI",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/game');
                  },
                  child: Center(
                    child: Container(
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFef8d32),
                      ),
                      child: Center(
                          child: Text(
                        "GAME",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/tugas');
                  },
                  child: Center(
                    child: Container(
                      width: Get.width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF6930c3),
                      ),
                      child: Center(
                          child: Text(
                        "TUGAS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey[700]),
                        minimumSize:
                            MaterialStateProperty.all(Size(Get.width, 100))),
                    onPressed: () {
                      Auth.logout();
                    },
                    child: Text(
                      'PROFIL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
