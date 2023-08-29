import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/create2_controller.dart';

class CPage extends StatefulWidget {
  const CPage({super.key});
  static const String id = 'c_id';

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CController>().apiPostCreate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: GetBuilder<CController>(
        init: CController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
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
                    hintText: 'UserId',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.apiPostCreate();
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
