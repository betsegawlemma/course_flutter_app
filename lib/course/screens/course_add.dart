import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/course/course.dart';

class AddCourse extends StatefulWidget {
  static const routeName = 'courseAdd';
  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _course = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Course Code'),
                  onSaved: (value) {
                    setState(() {
                      this._course["code"] = value;
                    });
                  }),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Course Title'),
                  onSaved: (value) {
                    this._course["title"] = value;
                  }),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course ects';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Course ECTS'),
                  onSaved: (value) {
                    setState(() {
                      this._course["ects"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter course description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Course Description'),
                  onSaved: (value) {
                    setState(() {
                      this._course["description"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      BlocProvider.of<CourseBloc>(context).add(
                        CourseCreate(
                          Course(
                              code: this._course["code"],
                              title: this._course["title"],
                              ects: this._course["ects"],
                              description: this._course["description"]),
                        ),
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          CoursesList.routeName, (route) => false);
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
