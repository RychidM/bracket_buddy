import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fixture_info_controller.dart';

class FixtureInfoView extends GetView<FixtureInfoController> {
  const FixtureInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FixtureInfoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FixtureInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
