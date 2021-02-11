import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/course/bloc/bloc.dart';
import 'package:flutter_network/course/course.dart';

class CoursesList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Courses'),
      ),
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (_, state) {
          if (state is CourseOperationFailure) {
            return Text('Could not do course operation');
          }

          if (state is CoursesLoadSuccess) {
            final courses = state.courses;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${courses[idx].title}'),
                subtitle: Text('${courses[idx].code}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(CourseDetail.routeName, arguments: courses[idx]),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateCourse.routeName,
          arguments: CourseArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
