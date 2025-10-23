void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  List<int> passed = scores.where((s) => s >= 50).toList();

  print(passed);
  print('${passed.length} students almost failed');
}