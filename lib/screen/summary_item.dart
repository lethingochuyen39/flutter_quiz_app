import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/question_identiffer.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectQuestion =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      //?2 cột
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? Gen orther widget
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectQuestion: isCorrectQuestion,
          ),
          const SizedBox(
            width: 10,
          ),
          //!đi theo chiều ngang phần còn lại sẽ chiếm hết
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //! kiểu o chuyển thành string
                  itemData['question'] as String,
                  style: GoogleFonts.heebo(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 3, 12),
                  ),
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 48, 8, 229),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
