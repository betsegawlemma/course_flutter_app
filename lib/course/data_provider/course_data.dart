import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_network/course/models/course.dart';
import 'package:http/http.dart' as http;

class CourseDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  CourseDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Course> createCourse(Course course) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/courses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': course.title,
        'code': course.code,
        'description': course.description,
        'ects': course.ects,
      }),
    );

    if (response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Course>> getCourses() async {
    final response = await httpClient.get('$_baseUrl/courses');

    if (response.statusCode == 200) {
      final courses = jsonDecode(response.body) as List;
      return courses.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteCourse(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/courses/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateCourse(Course course) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/courses/${course.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': course.id,
        'title': course.title,
        'code': course.code,
        'description': course.description,
        'ects': course.ects,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}
