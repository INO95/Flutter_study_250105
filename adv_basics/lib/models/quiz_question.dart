class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get suffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
  //   List<String> getSuffledAnswers() {
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }
}
