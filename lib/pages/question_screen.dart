import 'dart:collection';
import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/controllers/question_controller.dart';
//import 'package:pora_lekha/db/question-model/question_model.dart';
import '../models/question_model2.dart';
import 'package:pora_lekha/utils/dimensions/Dimensions.dart';
import 'package:http/http.dart' as http;

//import '../models/question_model.dart';

//import '../db/question-model/question_model.dart';

// List<String> groupValues = [];

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionController questionController = QuestionController();
  //String groupValue = '';
  List<String> groupValues = [];
  List<String> answers = [];
  //LinkedList<String> groupValuesLL = <String>[] as LinkedList<String>;
  double totalMarks = 0.0;
  @override
  Widget build(BuildContext context) {
    //List<String> groupValues = [];
    //List<String> answers = [];

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        initialData: const [],
        future: questionController.getAllQuestions(),
        builder: (context, snapshot) {
          final groupValuesFixedLengthList =
              List<String>.filled(snapshot.data!.length, 'fill');

          final answersFixedLengthList =
              List<String>.filled(snapshot.data!.length, 'results');
          print(groupValuesFixedLengthList);
          print(answersFixedLengthList);

          groupValuesFixedLengthList[1] = 'ggg';
          print(groupValuesFixedLengthList);

          answers = [];
          answers = answersFixedLengthList;
          groupValues = [];
          groupValues = groupValuesFixedLengthList;
          //String groupValue = '';
          return ListView.builder(
            itemCount: snapshot.data!.length, //5, //snapshot.data!.length,
            itemBuilder: (context, index) {
              //print(groupValuesFixedLengthList);
              /* 
              groupValuesFixedLengthList[index] =
                  snapshot.data![index]['question'];

              answersFixedLengthList[index] = snapshot.data![index]['Answer']; */

              //String groupValue = snapshot.data![index]['question'];
              //groupValues.add(snapshot.data![index]['question']);

              //answers.add(snapshot.data![index]['Answer']);
              //groupValues.add(snapshot.data![index]['question']);

              return Column(
                children: [
                  Container(
                    //height: Dimensions.height20 * 30,
                    // width: Dimensions.width20 * 30,
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
                          value: 3, //snapshot.data![index]['A'],
                          groupValue: groupValuesFixedLengthList[index], //3,
                          /* groupValuesFixedLengthList[
                              index],  */ //groupValues[index],
                          /* snapshot.data![index]
                              ['question'],  */ //groupValues[index],
                          onChanged: (value) {
                            setState(() {
                              //groupValues[index] = value.toString();
                              //groupValues.add(value);
                              //groupValues.add(value.toString());
                              //groupValues.replaceRange(index, index, value);
                              /* groupValues.replaceRange(index, index,
                                  value.toString() as Iterable<String>); */
                              /* groupValues.removeAt(index);
                              groupValues.add(value); */
                              //answers.add(snapshot.data![index]['Answer']);
                              //groupValuesFixedLengthList[index] = value;
                              /* groupValuesFixedLengthList[index] =
                                  snapshot.data![index]['A']; */
                              groupValuesFixedLengthList[index] =
                                  value.toString();

                              //value.toString();
                              answersFixedLengthList[index] =
                                  snapshot.data![index]['Answer'];
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['B'],
                          ),
                          value: snapshot.data![index]['B'],
                          groupValue: groupValues[index],
                          onChanged: (value) {
                            setState(() {
                              //groupValues[index] = value.toString();
                              //groupValues.add(value.toString());
                              /* groupValues.replaceRange(index, index,
                                  value.toString() as Iterable<String>); */
                              /* groupValues.removeAt(index);
                              groupValues.add(value); */
                              //answers.add(snapshot.data![index]['Answer']);
                              groupValuesFixedLengthList[index] =
                                  value.toString();
                              answersFixedLengthList[index] =
                                  snapshot.data![index]['Answer'];
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['C'],
                          ),
                          value: snapshot.data![index]['C'],
                          groupValue: groupValues[index],
                          onChanged: (value) {
                            setState(() {
                              //groupValues[index] = value.toString();
                              //groupValues.add(value.toString());
                              /* groupValues.replaceRange(index, index,
                                  value.toString() as Iterable<String>); */

                              /* groupValues.removeAt(index);
                              groupValues.add(value); */
                              //answers.add(snapshot.data![index]['Answer']);
                              groupValuesFixedLengthList[index] =
                                  value.toString();
                              answersFixedLengthList[index] =
                                  snapshot.data![index]['Answer'];
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            snapshot.data![index]['D'],
                          ),
                          value: snapshot.data![index]['D'],
                          groupValue: groupValues[index],
                          onChanged: (value) {
                            setState(() {
                              //groupValues[index] = value.toString();
                              //groupValues.add(value.toString());
                              //groupValues.replaceRange(index, index,value.toString() as Iterable<String>);
                              /* groupValues.removeAt(index);
                              groupValues.add(value); */
                              //answers.add(snapshot.data![index]['Answer']);
                              groupValuesFixedLengthList[index] =
                                  value.toString();
                              answersFixedLengthList[index] =
                                  snapshot.data![index]['Answer'];
                              groupValues = groupValuesFixedLengthList;
                              answers = answersFixedLengthList;
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
        onPressed: () {
          Future<void> getQuestionsMapsList() async {
            String baseUrl = "http://127.0.0.1:8000/api/questions";
            var response = await http.get(Uri.parse(baseUrl));
            /* QuestionModel questionModel = QuestionModel.fromJson(response.body);
            print(questionModel); */
            //print(response.body);
            var resBody = response.body;
            //print(resBody[3].toString());
            //print(resBody[o]);  //[
            //print(resBody[3]);  //i
            //print(resBody[2]); //"
            //print(resBody.length); //573
            //print(resBody.length);

            //Question questionModel =Question();

            Question questions = Question.fromJson(resBody);
            print(questions);

            print(groupValues);

            return;
          }

          getQuestionsMapsList();

          double mark = 0.0;
          //print(groupValues);
          //print(answers);
          //print(questionController.getAllQuestions());

          /* for (int i = 0; i < 4 /* groupValues.length */; i++) {
            /* print(groupValues[i]);
            print(answers[i]);
            print(groupValues);
            print(answers); */
            if (groupValues[i] == answers[i]) {
              mark++;
            } else {
              mark = mark - 1 / 4;
            }
          } */
          /* if (kDebugMode) {
            print(mark);
          }
          print(mark.toString());
          print(groupValues.toString());
          print(answers); */
          //print(groupValues);
          //print(answers);
          //Get.toNamed('/home');
        },
        child: const Icon(Icons.home_filled),
      ),
    );
  }
}
