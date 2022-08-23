List<String> wordsGrouper(String input, int groupCount) {
  final splitString = input.split(' ');

  final List<String> ans = [];

  // for (int i = 0; i < splitString.length; i += groupCount) {
  //   int steps;
  //   if (i + groupCount - 1 == splitString.length) {
  //     steps = splitString.length - 1 - i;
  //   } else {
  //     steps = groupCount;
  //   }

  //   String tempString = '';
  //   for (int j = 0; j < steps; j++) {
  //     tempString += '${splitString[j]} ';
  //   }

  //   ans.add(tempString);

  // }
  int wordCount = 0;
  String temp = '';
  for (int i = 0; i < splitString.length; i++) {
    temp += '${splitString.elementAt(i)} ';
    wordCount++;
    if (wordCount == groupCount) {
      ans.add(temp);
      temp = '';
    }
  }

  if (temp.isNotEmpty) {
    ans.add(temp);
  }
  return ans;
}
