
class Question {
  final String question;
  final List<String>? option;
  final int? correctAnswer;
  final String? image; //

  Question({required this.question, this.option,this.correctAnswer,  this.image});

  // static Future<List<Question>> docTuJson(String duongDan) async {
  //   final data = await rootBundle.loadString(duongDan);
  //   final jsonResult = jsonDecode(data);
  //
  //   return jsonResult.map<Question>((item) {
  //     return Question(
  //       cauHoi: item['cauHoi'],
  //       luaChon: List<String>.from(item['luaChon']),
  //       dapAnDung: item['dapAnDung'],
  //       hinhAnh: item['hinhAnh'],
  //     );
  //   }).toList();
  // }

}

