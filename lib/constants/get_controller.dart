import 'package:get/get.dart';
import 'package:pembelajaran/services/get/get_auth.dart';
import 'package:pembelajaran/services/get/get_game.dart';
import 'package:pembelajaran/services/get/get_game_detail.dart';
import 'package:pembelajaran/services/get/get_materi.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';

var userController = Get.put(UserController());
var gameDetailController = Get.put(GameDetailController());
var gameController = Get.put(GameController());
var materiDetailController = Get.put(MateriDetailController());
var materiController = Get.put(MateriController());
