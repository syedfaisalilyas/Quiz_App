class Questions {
  const Questions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getsshuffledList() {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
