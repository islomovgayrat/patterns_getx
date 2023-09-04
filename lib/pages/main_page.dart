import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../models/post_model.dart';

import '../views/item_main_post.dart';
import 'create_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String id = '/main_id';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            ListView.builder(
              itemCount: Get.find<MainController>().items.length,
              itemBuilder: (ctx, index) {
                Post post = Get.find<MainController>().items[index];
                return itemMainPost(Get.find<MainController>(), post);
              },
            ),
            Get.find<MainController>().isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CreatePage(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
