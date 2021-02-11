import 'package:meta/meta.dart';
import 'package:flutter_network/course/course.dart';

class CourseRepository {
  final CourseDataProvider dataProvider;

  CourseRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Course> createCourse(Course course) async {
    return await dataProvider.createCourse(course);
  }

  Future<Course> getCourse(String id) async {
    return await dataProvider.getCourse(id);
  }

  Future<List<Course>> getCourses() async {
    return await dataProvider.getCourses();
  }

  Future<Course> updateCourse(Course course) async {
    return await dataProvider.updateCourse(course);
  }

  Future<void> deleteCourse(String id) async {
    await dataProvider.deleteCourse(id);
  }
}
