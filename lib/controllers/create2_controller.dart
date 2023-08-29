import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/starter_page.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class CController extends GetxController {
  var isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();
  Post post = Post();

  apiPostCreate() async {
    isLoading = true;
    update();

    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (title.isEmpty || body.isEmpty || userIdController.text.isEmpty) return;

    post = Post(title: title, body: body, userId: userId);

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      isLoading = false;
      update();
      print(response);
      Get.to(const StarterPage());
    }
  }
}
