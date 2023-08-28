import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';

import '../controllers/main_controller.dart';
import '../models/post_model.dart';
import '../views/item_of_main.dart';
import '../views/item_of_post.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String id = '/ main_id';

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
      appBar: AppBar(
        title: const Text('GetX'),
      ),
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
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
