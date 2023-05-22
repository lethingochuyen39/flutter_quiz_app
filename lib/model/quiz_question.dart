class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

//list từng phần tử trả lời
  List<String> getShuffledAnswer() {
    final List<String> shuffedList = List.of(answers);
    shuffedList.shuffle();
    return shuffedList;
  }
}
