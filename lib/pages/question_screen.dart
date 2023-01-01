import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/controllers/question_controller.dart';
import 'package:pora_lekha/utils/dimensions/Dimensions.dart';

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

          answers = [];
          answers = answersFixedLengthList;
          groupValues = [];
          groupValues = groupValuesFixedLengthList;
          //String groupValue = '';
          return ListView.builder(
            itemCount: snapshot.data!.length, //5, //snapshot.data!.length,
            itemBuilder: (context, index) {
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
                          value: snapshot.data![index]['A'],
                          groupValue: snapshot.data![index]
                              ['question'], //groupValues[index],
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
                              groupValuesFixedLengthList[index] =
                                  value.toString();
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
          double mark = 0.0;
          print(groupValues);
          print(answers);
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
