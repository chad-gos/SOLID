import 'package:solid/2.Ocp/practice_1/shape.dart';
import 'package:solid/2.Ocp/practice_1/shapes_impl.dart';
import 'package:solid/2.Ocp/practice_2/employees_impl.dart';
import 'package:test/test.dart';


void main() {
  group('Shape Tests', () {
    test('Circle area calculation', () {
      final circle = Circle(5);
      expect(circle.calculateArea(), closeTo(78.54, 0.01));
    });

    test('Rectangle area calculation', () {
      final rectangle = Rectangle(4, 5);
      expect(rectangle.calculateArea(), 20);
    });

    test('Triangle area calculation', () {
      final triangle = Triangle(3);
      expect(triangle.calculateArea(), 4.5);
    });

    test('Square area calculation', () {
      final square = Square(4);
      expect(square.calculateArea(), 16);
    });

    test('Total area calculation', () {
      final shapes = [
        Circle(5),
        Rectangle(4, 5),
        Triangle(3),
        Square(4)
      ];
      final calculator = ShapeCalculator(shapes);
      expect(calculator.calculateTotalArea(), closeTo(119.04, 0.01));
    });
  });

  group('Employee Tests', () {
    test('FullTime employee salary', () {
      final employee = FullTimeEmployee('Alice');
      expect(employee.calculateSalary(), 5000);
    });

    test('PartTime employee salary', () {
      final employee = PartTimeEmployee('Bob');
      expect(employee.calculateSalary(), 3000);
    });

    test('Intern employee salary', () {
      final employee = InternEmployee('Charlie');
      expect(employee.calculateSalary(), 1000);
    });

    test('Freelance employee salary', () {
      final employee = FreelanceEmployee('David', 40);
      expect(employee.calculateSalary(), 1600); // 40 hours * $40
    });

    test('Employee name getter', () {
      final employee = FullTimeEmployee('Alice');
      expect(employee.name, 'Alice');
    });
  });
}