class QuestionModel {
  QuestionModel({
    this.id,
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
    this.createdAt,
    this.updatedAt,
  });

  QuestionModel.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
    answer = json['Answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? answer;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['A'] = a;
    map['B'] = b;
    map['C'] = c;
    map['D'] = d;
    map['Answer'] = answer;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
