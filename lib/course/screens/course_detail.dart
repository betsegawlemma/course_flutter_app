import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/course/course.dart';

class CourseDetail extends StatelessWidget {
  static const routeName = 'courseDetail';
  final Course course;

  CourseDetail({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.course.code}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateCourse.routeName,
              arguments: CourseArgument(course: this.course, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<CourseBloc>().add(CourseDelete(this.course));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    CoursesList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.course.title}'),
              subtitle: Text('ECTS: ${this.course.ects}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.course.description),
          ],
        ),
      ),
    );
  }
}
