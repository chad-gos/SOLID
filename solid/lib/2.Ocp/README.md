Below is a code that violates Open/Close Principle. Please refactor and write a test case that covers 100% of the code below.
### additional exercises
* PRACTICE 1: Add Square class and enter area calculation in Shape class
* PRACTICE 2: Add EmployeeType = Freelancer with Salary based on working time * 40$.
```
/*=========== START PRACTICE 1 ===============*/
class Shape {
    shapes: Shape[];
    constructor(shapes: Shape[]) {
        this.shapes = shapes;
    }

    calculateArea(): number {
        let total = 0;
        this.shapes.forEach((shape) => {
            if (shape instanceof Circle) {
                total += Math.PI * Math.pow(shape.radius, 2);
            }
            if (shape instanceof Rectangle) {
                total += shape.height * shape.width;
            }
            if (shape instanceof Triangle) {
                total += 0.5 * shape.length * shape.length;
            }
        });
        return total;
    }
}

class Circle extends Shape {
    radius: number;
    constructor(radius: number) {
        super([]);
        this.radius = radius;
    }
}

class Rectangle extends Shape {
    height: number
    width: number
    constructor(height: number, width: number) {
        super([]);
        this.height = height;
        this.width = width;

    }
}
class Triangle extends Shape {
    length: number
    constructor(length: number) {
        super([]);
        this.length = length;
    }
}


let shapes: Shape[] = [
    new Circle(5),
    new Rectangle(4, 5),
    new Triangle(3)
];
const shapesInstance = new Shape(shapes);
console.log(shapesInstance.calculateArea());
/*=========== END PRACTICE 1 ===============*/



/*=========== START PRACTICE 2 ===============*/
enum EmployeeType {
    FullTime,
    PartTime,
    Intern
}

class Employee {
    constructor(public name: string, public type: EmployeeType) { }

    calculateSalary(): number {
        switch (this.type) {
            case EmployeeType.FullTime:
                return 5000;
            case EmployeeType.PartTime:
                return 3000;
            case EmployeeType.Intern:
                return 1000;
            default:
                throw new Error("Unknown employee type");
        }
    }
}

const fullTimeEmployee = new Employee("Alice", EmployeeType.FullTime);
console.log(`${fullTimeEmployee.name}'s salary is ${fullTimeEmployee.calculateSalary()}`);

const internEmployee = new Employee("Bob", EmployeeType.Intern);
console.log(`${internEmployee.name}'s salary is ${internEmployee.calculateSalary()}`);
/*=========== END PRACTICE 2 ===============*/
```