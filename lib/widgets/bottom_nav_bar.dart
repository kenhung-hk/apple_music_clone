import 'dart:ui';

import 'package:apple_music_clone/bloc/selected_home_tab_cubit.dart';
import 'package:apple_music_clone/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          height: kBottomNavigationBarHeight,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<SelectedHomeTabCubit, SelectedHomeTab>(
            builder: (context, selectedHomeTab) {
              SelectedHomeTabCubit selectedHomeTabCubit =
                  context.read<SelectedHomeTabCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      selectedHomeTabCubit.update(SelectedHomeTab.radio);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.dot_radiowaves_left_right,
                          color: selectedHomeTab == SelectedHomeTab.radio
                              ? activeTabColor
                              : inactiveTabColor,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Radio",
                          style: TextStyle(
                            color: selectedHomeTab == SelectedHomeTab.radio
                                ? activeTabColor
                                : inactiveTabColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedHomeTabCubit.update(SelectedHomeTab.library);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.music_albums_fill,
                          color: selectedHomeTab == SelectedHomeTab.library
                              ? activeTabColor
                              : inactiveTabColor,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Library",
                          style: TextStyle(
                            color: selectedHomeTab == SelectedHomeTab.library
                                ? activeTabColor
                                : inactiveTabColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedHomeTabCubit.update(SelectedHomeTab.search);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          color: selectedHomeTab == SelectedHomeTab.search
                              ? activeTabColor
                              : inactiveTabColor,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: selectedHomeTab == SelectedHomeTab.search
                                ? activeTabColor
                                : inactiveTabColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
