import 'package:equatable/equatable.dart';
import 'package:flutter_network/course/course.dart';

class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseLoading extends CourseState {}

class CoursesLoadSuccess extends CourseState {
  final List<Course> courses;

  CoursesLoadSuccess([this.courses = const []]);

  @override
  List<Object> get props => [courses];
}

class CourseOperationFailure extends CourseState {}
