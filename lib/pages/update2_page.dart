import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/update2_controller.dart';

class UPage extends StatefulWidget {
  const UPage({super.key});
  static const String id = 'u_id';

  @override
  State<UPage> createState() => _UPageState();
}

class _UPageState extends State<UPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<UController>().apiPostUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: GetBuilder<UController>(
        init: UController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller.idController,
                  decoration: const InputDecoration(
                    hintText: 'Id',
                  ),
                ),
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
                    hintText: 'UserId',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.apiPostUpdate();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
