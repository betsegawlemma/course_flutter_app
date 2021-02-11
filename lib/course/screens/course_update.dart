import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/course/course.dart';

class UpdateCourse extends StatefulWidget {
  static const routeName = 'courseUpdate';
  final Course course;

  UpdateCourse({@required this.course});
  @override
  _UpdateCourseState createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _course = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Course: ${widget.course.code}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.course.code,
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
                  initialValue: widget.course.title,
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
                  initialValue: widget.course.ects.toString(),
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
                  initialValue: widget.course.description,
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
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      BlocProvider.of<CourseBloc>(context).add(
                        CourseUpdate(
                          Course(
                              id: widget.course.id,
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
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
