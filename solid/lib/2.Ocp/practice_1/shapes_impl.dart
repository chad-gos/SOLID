import 'dart:math';
import 'shape.dart';

class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * pow(radius, 2);
  }
}

class Rectangle implements Shape {
  final double height;
  final double width;

  Rectangle(this.height, this.width);

  @override
  double calculateArea() {
    return height * width;
  }
}

class Triangle implements Shape {
  final double length;

  Triangle(this.length);

  @override
  double calculateArea() {
    return 0.5 * length * length;
  }
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}