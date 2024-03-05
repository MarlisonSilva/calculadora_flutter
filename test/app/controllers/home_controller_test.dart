import 'package:calculator/app/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HomeController controller = HomeController();
  test('teste double operador', () {
    print(controller.answer.value);
    controller.addOp('*');
    controller.addOp('*');
    print(controller.answer.value);
  });

  test('funcionamento findNumbers', () {
    controller.addAlg('2');
    controller.addAlg('3');
    controller.addAlg('8');
    controller.addOp('+');
    controller.addAlg('3');
    controller.addAlg('3');
    controller.addAlg('3');
    controller.addOp('+');
    print(controller.calcExpression());
    print(controller.answer.value);
    print(controller.currentNum);
  });
}