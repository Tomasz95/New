// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/test.dart';
import 'package:flutterapp/calculator.dart';


void main() {

  test("simple test", (){
Calculator calculator = MetricCalculator();
BmiResult result = calculator.calculate(185, 70);
expect(BmiState.overwheight, result.state);
});
}
