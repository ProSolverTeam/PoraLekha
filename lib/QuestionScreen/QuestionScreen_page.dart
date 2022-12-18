import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './QuestionScreen_controller.dart';

class QuestionScreenPage extends GetView<QuestionScreenController> {
    
    const QuestionScreenPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('QuestionScreenPage'),),
            body: Container(),
        );
    }
}