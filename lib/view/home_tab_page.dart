import 'package:apple_music_clone/bloc/selected_home_tab_cubit.dart';
import 'package:apple_music_clone/view/library_page.dart';
import 'package:apple_music_clone/view/radio_page.dart';
import 'package:apple_music_clone/view/search_page.dart';
import 'package:apple_music_clone/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  Widget _selectedPage(SelectedHomeTab selectedHomeTab) {
    switch (selectedHomeTab) {
      case SelectedHomeTab.radio:
        {
          return const RadioPage();
        }
      case SelectedHomeTab.library:
        {
          return const LibraryPage();
        }
      case SelectedHomeTab.search:
        {
          return const SearchPage();
        }
      default:
        {
          return const RadioPage();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SelectedHomeTabCubit, SelectedHomeTab>(
          builder: (context, state) {
            return Stack(
              children: [
                _selectedPage(state),
                const Positioned(
                  bottom: 0,
                  child: BottomNavBar(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
