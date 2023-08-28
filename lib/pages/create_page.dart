import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/create_controller.dart';

import '../models/post_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  static const String id = 'create_id';

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: controller.bodyController,
              decoration: const InputDecoration(
                hintText: 'Body',
              ),
            ),
            TextField(
              controller: controller.userIdController,
              decoration: const InputDecoration(
                hintText: 'UId',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Post post = controller.post.value;
                controller.apiPostCreate(post);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
