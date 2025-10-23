bool isBalanced(String s) {
  final stack = <String>[];
  final pairs = {')': '(', ']': '[', '}': '{'};

  for (final ch in s.split('')) {
    if (pairs.containsValue(ch)) {
      stack.add(ch);
    } else if (pairs.containsKey(ch)) {
      if (stack.isEmpty || stack.removeLast() != pairs[ch]) return false;
    }
  }
  return stack.isEmpty;
}

// A simpler ver using only switch cuz i tried this first

// bool isBalanced(String s) {
//   final stack = <String>[];

//   for (final ch in s.split('')) {
//     switch (ch) {
//       case '(': case '[': case '{': 
//         stack.add(ch);
//         break;
//       case ')': 
//         if (stack.isEmpty || stack.removeLast() != '(') return false;
//         break;
//       case ']': 
//         if (stack.isEmpty || stack.removeLast() != '[') return false;
//         break;
//       case '}': 
//         if (stack.isEmpty || stack.removeLast() != '{') return false;
//         break;
//     }
//   }
//   return stack.isEmpty;
// }

void main() {
  final examples = [
    '{what is (42)}?',
    '[text}',
    '{[[(a)b]c]d}',
  ];
  examples.forEach((e) => print(isBalanced(e) ? 'Balanced' : 'Not balanced'));
}
