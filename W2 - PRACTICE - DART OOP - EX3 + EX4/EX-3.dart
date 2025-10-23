class CustomDuration {

  final int _milliseconds;

  int get milliseconds => _milliseconds;

  CustomDuration(this._milliseconds);
  
  CustomDuration.fromHours(int hours)
    :_milliseconds = hours < 0
      ? throw Exception("Hours cannot be negative.")
      : hours * 60 * 60 * 1000;

  CustomDuration.fromMinutes(int minutes)
    :_milliseconds = minutes < 0
      ? throw Exception("Minutes cannot be negative.")
      : minutes * 60 * 1000;

  CustomDuration.fromSeconds(int seconds)
    :_milliseconds = seconds < 0
      ? throw Exception("Seconds cannot be negative.")
      : seconds * 1000;

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration (this.milliseconds + other.milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = this.milliseconds - other.milliseconds;
    if (result < 0) result = 0;
    return CustomDuration (result);
  }

  bool operator >=(CustomDuration other) {
    return this.milliseconds >= other.milliseconds;
  }

  @override
  String toString() => "$_milliseconds ms";
}

void main() {
  var duration1 = CustomDuration.fromHours(6);
  var duration2 = CustomDuration.fromMinutes(9);
  var duration3 = CustomDuration.fromSeconds(6969);

  var addition = duration1 + duration2 + duration3;
  var subtraction = duration1 - duration2 - duration3;
  var comparison1 = duration1 >= duration2;
  var comparison2 = duration2 >= duration3;

  print("Hours to ms: ${duration1.milliseconds} ms");
  print("Minutes to ms: ${duration2.milliseconds} ms");
  print("Seconds to ms: ${duration3.milliseconds} ms");

  print("Addition: $addition");
  print("Subtraction: $subtraction");
  print("Is duration3 greater than duration2?: ${comparison1}");
  print("Is duration2 greater than duration3?: ${comparison2}");

  // var errorDuration = CustomDuration.fromHours(-1);
  // print("Error: $errorDuration");

  try {
    var errorDuration = CustomDuration.fromHours(-1);
    print("Error: $errorDuration");
  } catch (e) {
    print("Caught an exception: $e");
  }
}