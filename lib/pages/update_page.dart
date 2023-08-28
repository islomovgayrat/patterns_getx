import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/update_controller.dart';

import '../models/post_model.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static const String id = '/update_id';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<UpdateController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: Get.find<UpdateController>().idController,
              decoration: const InputDecoration(
                hintText: 'Id',
              ),
            ),
            TextField(
              controller: Get.find<UpdateController>().titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: Get.find<UpdateController>().bodyController,
              decoration: const InputDecoration(
                hintText: 'Body',
              ),
            ),
            TextField(
              controller: Get.find<UpdateController>().userIdController,
              decoration: const InputDecoration(
                hintText: 'UId',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Post post = Get.find<UpdateController>().post.value;
                Get.find<UpdateController>().apiPostUpdate(post);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
