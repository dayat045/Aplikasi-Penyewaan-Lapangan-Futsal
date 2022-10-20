import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tut_2/boxes.dart';
import 'package:hive_tut_2/model/todo.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late String lap;
  late String hargatotal;
   late String Pembayaran;
  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form Not Validated");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Sewa'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: InputDecoration(labelText: 'Tanggal'),
                   onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: '',
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                  ),
                   onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: InputDecoration(labelText: 'Lapangan'),
                   onChanged: (value) {
                      setState(() {
                        lap = value;
                      });
                    },
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "required";
                    }
                    return null;
                  },
                ),
                
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: InputDecoration(labelText: 'hargatotal'),
                   onChanged: (value) {
                      setState(() {
                        hargatotal = value;
                      });
                    },
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "required";
                    }
                    return null;
                  },
                ),
                
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: InputDecoration(labelText: 'Pembayaran'),
                   onChanged: (value) {
                      setState(() {
                        Pembayaran = value;
                      });
                    },
                  validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "required";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                  onPressed: () {
                    validated();
                  },
                  child: Text("Add Form"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFormSubmit() {
    Box<Todo> contactsBox = Hive.box<Todo>(HiveBoxes.todo);
    contactsBox.add(Todo(title: title, description: description, lap: lap, hargatotal: hargatotal, Pembayaran: Pembayaran));
    Navigator.of(context).pop();
  }
}
