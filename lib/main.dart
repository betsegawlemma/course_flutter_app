import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc_observer.dart';
import 'package:flutter_network/course/course.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();

  final CourseRepository courseRepository = CourseRepository(
    dataProvider: CourseDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    CourseApp(courseRepository: courseRepository),
  );
}

class CourseApp extends StatelessWidget {
  final CourseRepository courseRepository;

  CourseApp({@required this.courseRepository})
      : assert(courseRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.courseRepository,
      child: BlocProvider(
        create: (context) => CourseBloc(courseRepository: this.courseRepository)
          ..add(CourseLoad()),
        child: MaterialApp(
          title: 'Course App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: CourseAppRoute.generateRoute,
        ),
      ),
    );
  }
}
