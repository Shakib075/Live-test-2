import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddEmployeeScreen(),
    );
  }
}

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the action when form is valid
      String name = _nameController.text;
      int age = int.parse(_ageController.text);
      double salary = double.parse(_salaryController.text);

      print('Employee Added: Name: $name, Age: $age, Salary: \$${salary.toStringAsFixed(2)}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Employee Added Successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Employee')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter Name' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty || int.tryParse(value) == null ? 'Enter valid Age' : null,
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty || double.tryParse(value) == null ? 'Enter valid Salary' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
