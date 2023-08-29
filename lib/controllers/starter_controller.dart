import 'package:get/get.dart';
import 'package:patterns_getx/services/network.dart';

import '../models/post_model.dart';

class StarterController extends GetxController {
  var isLoading = false;
  var items = [];

  apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_POST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    update();
  }

  apiPostDelete(Post post) async {
    isLoading = true;
    update();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
  }
}
