import 'package:apple_music_clone/bloc/search_cubit.dart';
import 'package:apple_music_clone/bloc/selected_home_tab_cubit.dart';
import 'package:apple_music_clone/view/home_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedHomeTabCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Apple Music Clone',
        home: HomeTabPage(),
      ),
    );
  }
}
