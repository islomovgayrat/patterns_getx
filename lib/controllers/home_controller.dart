import 'package:get/get.dart';

import '../models/post_model.dart';
import '../services/network.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
    isLoading.value = true;
    var response = await Network.GET(Network.API_POST, Network.paramsEmpty());

    isLoading.value = false;
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
  }

  void apiPostDelete(Post post) async {
    isLoading.value = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    } else {}
    isLoading.value = false;
  }
}
