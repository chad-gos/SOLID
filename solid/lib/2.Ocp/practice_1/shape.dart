abstract class Shape {
  double calculateArea();
}

class ShapeCalculator {
  final List<Shape> shapes;

  ShapeCalculator(this.shapes);

  double calculateTotalArea() {
    return shapes.fold(0, (total, shape) => total + shape.calculateArea());
  }
}