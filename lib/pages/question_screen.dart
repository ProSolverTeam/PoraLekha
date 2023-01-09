import 'package:flutter/material.dart';
import 'package:pora_lekha/controllers/question_controller.dart';
import '../models/question_model2.dart';
import 'package:http/http.dart' as http;

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> groupVal = [];
  QuestionController questionController = QuestionController();

  @override
  void initState() {
    super.initState();
    questionController.getAllQuestions().then((value) {
      value.forEach((element) {
        groupVal.add(element['question']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        initialData: const [],
        future: questionController.getAllQuestions(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          snapshot.data![index]['question'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['A'],
                          ),
                          value: snapshot.data![index]['A'],
                          groupValue: groupVal[index],
                          onChanged: (value) {
                            setState(() {
                              groupVal[index] = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['B'],
                          ),
                          value: snapshot.data![index]['B'],
                          groupValue: groupVal[index],
                          onChanged: (value) {
                            setState(() {
                              groupVal[index] = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['C'],
                          ),
                          value: snapshot.data![index]['C'],
                          groupValue: groupVal[index],
                          onChanged: (value) {
                            setState(() {
                              groupVal[index] = value;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['D'],
                          ),
                          value: snapshot.data![index]['D'],
                          groupValue: groupVal[index],
                          onChanged: (value) {
                            setState(() {
                              groupVal[index] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Go to Home",
        onPressed: () /* ß */ {
          Future<void> getQuestionsMapsList() async {
            String baseUrl = "http://127.0.0.1:8000/api/questions";
            var response = await http.get(Uri.parse(baseUrl));

            var resBody = response.body;

            Question questions = Question.fromJson(resBody);

            return;
          }

          getQuestionsMapsList();
        },
        child: const Icon(Icons.home_filled),
      ),
    );
  }
}
