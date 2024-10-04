import 'package:solid/2.Ocp/practice_2/employee.dart';

class FullTimeEmployee implements Employee {
  @override
  final String name;
  static const double _baseSalary = 5000;

  FullTimeEmployee(this.name);

  @override
  double calculateSalary() => _baseSalary;
}

class PartTimeEmployee implements Employee {
  @override
  final String name;
  static const double _baseSalary = 3000;

  PartTimeEmployee(this.name);

  @override
  double calculateSalary() => _baseSalary;
}

class InternEmployee implements Employee {
  @override
  final String name;
  static const double _baseSalary = 1000;

  InternEmployee(this.name);

  @override
  double calculateSalary() => _baseSalary;
}

class FreelanceEmployee implements Employee {
  @override
  final String name;
  final int hoursWorked;
  static const double _hourlyRate = 40;

  FreelanceEmployee(this.name, this.hoursWorked);

  @override
  double calculateSalary() => hoursWorked * _hourlyRate;
}