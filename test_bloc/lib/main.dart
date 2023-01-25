import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/video_cubit.dart';
import 'package:test_bloc/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(_)=> VideoCubit(), child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),);
  }
}
