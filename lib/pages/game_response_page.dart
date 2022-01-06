import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponseGame extends StatelessWidget {
  final int? benar;
  ResponseGame(this.benar);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: Get.width - 20,
                height: Get.height - 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (benar == 1) ? Color(0xFF00af91) : Color(0xFFaf0069),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      (benar == 1)
                          ? "Jawaban Anda Benar\nSiiiip...\n🤟🤟🤟🤟🤟🤟🤟"
                          : "Jawaban Anda Salah\nAwOkawOk\n🤣🤣🤣🤣🤣🤣🤣",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: Get.width - 20,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[800],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Kembali Ke Game",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
