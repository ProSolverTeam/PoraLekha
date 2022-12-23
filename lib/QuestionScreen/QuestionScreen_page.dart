import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pora_lekha/utils/dimensions/Dimensions.dart';

class QuestionScreenPage extends StatefulWidget {
  const QuestionScreenPage({super.key});

  @override
  State<QuestionScreenPage> createState() => _QuestionScreenPageState();
}

class _QuestionScreenPageState extends State<QuestionScreenPage> {
  String? groupValue; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  String answer = "13";
  double marks = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: Dimensions.height20 * 15,
        width: Dimensions.width20 * 15,
        color: Colors.amber,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "9+4=?",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            RadioListTile(
              title: const Text("10"),
              value: "10",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("13"),
              value: "13",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("16"),
              value: "16",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value.toString();
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submit,
        child: const Icon(Icons.save_alt_outlined),
      ),
    );
  }

  void submit() {
    if (kDebugMode) {
      print(groupValue);
      print(answer);
    }

    if (groupValue == answer) {
      marks++;
    } else {
      marks = marks - 1 / 4;
    }
    if (kDebugMode) {
      print(marks);
    }
  }
}
