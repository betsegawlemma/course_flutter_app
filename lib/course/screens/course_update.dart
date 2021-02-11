import 'package:flutter/material.dart';

class UpdateCourse extends StatefulWidget {
  static const routeName = 'courseUpdate';
  @override
  _UpdateCourseState createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Course'),
      ),
      body: Container(),
    );
  }
}
