import 'dart:io';

// Interface
abstract class IPrintable {
  void printDetails();
}

// Base class
class LivingBeing {
  void breathe() {
    print('Breathing...');
  }

  void speak() {
    print('Making a sound...');
  }
}

// Class implementing an interface
class Person extends LivingBeing implements IPrintable {
  String firstName;
  String lastName;
  int age;
  String address;

  Person(this.firstName, this.lastName, this.age, this.address);

  @override
  void printDetails() {
    print('Name: $firstName $lastName');
    print('Age: $age');
    print('Address: $address');
  }

  // Method overriding
  @override
  void breathe() {
    print('Person is breathing...');
  }

  @override
  void speak() {
    print('Person is speaking...');
  }
}

// Derived class
class Student extends Person {
  String grade;

  Student(
      String firstName, String lastName, int age, String address, this.grade)
      : super(firstName, lastName, age, address);

  @override
  void printDetails() {
    super.printDetails();
    print('Grade: $grade');
  }
}

void main() {
  List<Person> people = [];

  // Print the current working directory
  // print(Directory.current);

  // Read data from file and create Person instances
  const String fileName = 'Person_data.txt';
  final lines = File(fileName).readAsLinesSync();

  // Skip the header line
  for (int i = 1; i < lines.length; i++) {
    final values = lines[i].split(',');
    if (values.length == 4) {
      people.add(Person(
        values[0].trim(),
        values[1].trim(),
        int.parse(values[2].trim()),
        values[3].trim(),
      ));
    }
  }

  // Loop to demonstrate iteration
  for (Person person in people) {
    person.printDetails();
    person.breathe();
    person.speak();
    print('---');
  }
}
