extension PowerString on String {
  String firstFewWords() {
    int? startIndex = 0, indexOfSpace;

    for (int i = 0; i < 6; i++) {
      indexOfSpace = this.indexOf(' ', startIndex!);
      if (indexOfSpace == -1) {
        //-1 is when character is not found
        return this;
      }
      startIndex = indexOfSpace + 1;
    }

    return this.substring(0, indexOfSpace) + '...';
  }
}
