import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/starter_page.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class UController extends GetxController {
  var isLoading = false;
  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();
  Post post = Post();

  apiPostUpdate() async {
    isLoading = true;
    update();

    int id = int.parse(idController.text.toString());
    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (idController.text.isEmpty ||
        title.isEmpty ||
        body.isEmpty ||
        userIdController.text.isEmpty) return;

    post = Post(id: id, title: title, body: body, userId: userId);

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));

    if (response != null) {
      print(response);
      Get.to(const StarterPage());
    }
  }
}
