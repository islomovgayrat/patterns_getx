import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/home_page.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;
  var post = Post().obs;

  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var uIdController = TextEditingController();

  void apiPostUpdate() async {
    isLoading.value = true;

    int id = int.parse(idController.text.toString());
    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int uId = int.parse(uIdController.text.toString());

    if (idController.text.isEmpty ||
        title.isEmpty ||
        body.isEmpty ||
        uIdController.text.isEmpty) return;

    post.value = Post(id: id, title: title, body: body, userId: uId);

    var response =
        Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post.value));

    if (response != null) {
      print(response);
      Get.toNamed(HomePage.id);
    }
    isLoading.value = false;
  }
}
