enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final int _yearsOfExperience;
  final Address _address;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  int get yearsOfExperience => _yearsOfExperience;
  Address get address => _address;

  Employee(this._name, this._baseSalary, this._skills, this._yearsOfExperience, this._address);

  Employee.mobileDeveloper(String name, double baseSalary, int yearsOfExperience, Address address)
  : this(name, baseSalary, [Skill.DART, Skill.FLUTTER], yearsOfExperience, address);

  double computeSalary() {
    double totalSalary = _baseSalary;
    totalSalary += _yearsOfExperience * 1000;
    if (_skills.contains(Skill.FLUTTER)) {
      totalSalary += 5000;
    }
    if (_skills.contains(Skill.DART)) {
      totalSalary += 3000;
    }
    if (_skills.contains(Skill.OTHER)) {
      totalSalary += 6969;
    }
    return totalSalary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
    print('Addrress: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Skills: $_skills');
    print('Years of Experience: $_yearsOfExperience');
    print('Total Salary: \$${computeSalary()}');
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  Address(this._street, this._city, this._zipCode);
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.DART, Skill.FLUTTER], 5, Address('Dr Doom street', 'Gotham', '6969'));
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.DART, Skill.FLUTTER,Skill.OTHER], 3, Address('Walrus street', 'Ugandan town', '6969'));
  emp2.printDetails();

  var emp3 = Employee('KMern', 40000, [Skill.OTHER], 69, Address('Nevada', 'Area 51', '6969'));
  emp3.printDetails();
}