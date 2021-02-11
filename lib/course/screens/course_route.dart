import 'package:flutter/material.dart';
import 'package:flutter_network/course/course.dart';

class CourseAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => CoursesList());
    }

    if (settings.name == AddUpdateCourse.routeName) {
      CourseArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateCourse(
                args: args,
              ));
    }

    if (settings.name == CourseDetail.routeName) {
      Course course = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CourseDetail(
                course: course,
              ));
    }

    return MaterialPageRoute(builder: (context) => CoursesList());
  }
}

class CourseArgument {
  final Course course;
  final bool edit;
  CourseArgument({this.course, this.edit});
}
