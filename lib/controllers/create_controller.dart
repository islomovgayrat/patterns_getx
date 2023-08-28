import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;

  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  var post = Post().obs;

  Future apiPostCreate(Post post) async {
    isLoading.value = true;

    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (title.isEmpty || body.isEmpty || userIdController.text.isEmpty) return;

    //create
    post = Post(title: title, body: body, userId: userId);

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      isLoading.value = false;
      //onTapCreate();
      print(response);
    } else {
      //print(response);
    }
  }
}
