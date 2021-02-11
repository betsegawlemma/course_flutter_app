import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  static const routeName = 'courseAdd';
  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Course'),
      ),
      body: Container(),
    );
  }
}
