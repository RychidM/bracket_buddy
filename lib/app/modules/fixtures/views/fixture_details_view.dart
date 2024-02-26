import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixtureDetailsPage extends GetView<FixturesController> {
  const FixtureDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text('FixturePage')),

    body: const SafeArea(
      child: Text('FixtureController'))
    );
  }
}