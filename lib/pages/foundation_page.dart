// ignore_for_file: must_be_immutable
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/pages/game_page.dart';
import 'package:pembelajaran/pages/home_page.dart';
import 'package:pembelajaran/pages/materi_page.dart';
import 'package:pembelajaran/pages/tugas_page.dart';
import 'package:pembelajaran/services/get/get_pagination.dart';

class FoundationPage extends StatelessWidget {
  FoundationPage({Key? key}) : super(key: key);

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final paginationController = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<PaginationController>(
        builder: (_) => Scaffold(
          appBar: AppBar(
            backgroundColor: paginationController.warna,
            title: Text(paginationController.title),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: paginationController.warna,
            key: _bottomNavigationKey,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.list_alt,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.gamepad_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.task,
                size: 30,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              paginationController.updatePageIndex(index);
            },
          ),
          body: (paginationController.pageIndex == 0)
              ? HomePage()
              : (paginationController.pageIndex == 1)
                  ? MateriPage()
                  : (paginationController.pageIndex == 2)
                      ? GamePage()
                      : TugasPage(),
        ),
      ),
    );
  }
}
