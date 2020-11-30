import 'dart:math';

double calculate(var height, var weight) {
  return (weight / pow(height, 2)) * 10000;
}

String suggestion(var value) {
  double a = double.parse(value);
  var str;
  if (a < 18.5) {
    str = 'Underweight';
  } else {
    if (18.5 < a && a < 24.9) {
      str = 'Normal Weight';
    } else {
      if (25 < a && a < 29.9) {
        str = 'Over Weight';
      } else {
        if (30 < a) {
          str = 'Obesity';
        }
      }
    }
  }
  return str;
}
