import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../views/item_home_post.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = 'home_id';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (ctx, index) {
                Post post = controller.items[index];
                return itemHomePost(controller, post);
              },
            ),
            controller.isLoading.value
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
