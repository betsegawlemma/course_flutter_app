import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_network/course/course.dart';

class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseEmpty extends CourseState {}

class CourseLoading extends CourseState {}

class CourseOperationSuccess extends CourseState {}

class CourseLoadSuccess extends CourseState {
  final Course course;

  CourseLoadSuccess({@required this.course}) : assert(course != null);

  @override
  List<Object> get props => [course];
}

class CoursesLoadSuccess extends CourseState {
  final List<Course> courses;

  CoursesLoadSuccess([this.courses = const []]);

  @override
  List<Object> get props => [courses];
}

class CourseOperationFailure extends CourseState {}
