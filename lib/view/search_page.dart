import 'package:apple_music_clone/view/search_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text("Search"),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Hero(
              tag: 'search',
              child: CupertinoSearchTextField(
                placeholder: "Artists, Songs, Lyrics and More",
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => SearchDetailsPage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          SlideTransition(
                              position: Tween(
                                      begin: const Offset(0.0, 1.0),
                                      end: const Offset(0.0, 0.0))
                                  .animate(anim),
                              child: child),
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Browse Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const CategoriesGrid(),
        const SliverPadding(
          padding: EdgeInsets.only(top: kBottomNavigationBarHeight + 5),
        ),
      ],
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            int _color = (math.Random().nextDouble() * 0xFFFFFF).toInt();
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(_color).withOpacity(1.0),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _color.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
          childCount: 20,
        ),
      ),
    );
  }
}
