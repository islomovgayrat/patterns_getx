import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/services/network.dart';

import '../models/post_model.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;

  var idController = TextEditingController();
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  var post = Post().obs;

  Future apiPostUpdate(Post post) async {
    isLoading.value = true;

    int id = int.parse(idController.text.toString());
    String title = titleController.text.toString();
    String body = bodyController.text.toString();
    int userId = int.parse(userIdController.text.toString());

    if (idController.text.isEmpty ||
        title.isEmpty ||
        body.isEmpty ||
        userIdController.text.isEmpty) return;

    //create
    post = Post(id: id, title: title, body: body, userId: userId);

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));

    if (response != null) {
      isLoading.value = false;
      //onTapCreate();
      print(response);
    } else {
      print(response);
    }
  }
}
