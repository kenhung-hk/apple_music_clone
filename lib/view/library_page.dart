import 'package:apple_music_clone/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: const Text("Library"),
          trailing: InkWell(
            onTap: () {},
            child: const Text(
              'Edit',
              style: TextStyle(
                color: activeTabColor,
              ),
            ),
          ),
        ),
        const LibraryListTiles(),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const RecentlyAddedSection(),
        const SliverPadding(
          padding: EdgeInsets.only(top: kBottomNavigationBarHeight + 5),
        ),
      ],
    );
  }
}

class LibraryListTiles extends StatelessWidget {
  const LibraryListTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const Divider(height: 0),
          _tile(title: "Playlists", icon: CupertinoIcons.music_note_list),
          _tile(title: "Artists", icon: CupertinoIcons.music_mic),
          _tile(title: "Albums", icon: CupertinoIcons.square_stack),
          _tile(title: "Songs", icon: CupertinoIcons.music_note),
          _tile(title: "Genres", icon: CupertinoIcons.guitars),
          _tile(title: "Composers", icon: CupertinoIcons.music_note_2),
          _tile(title: "Downloaded", icon: CupertinoIcons.arrow_down_circle),
          // const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _tile({required String title, required IconData icon}) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          leading: Icon(icon),
          trailing: Icon(
            CupertinoIcons.forward,
            size: 16,
            color: inactiveTabColor,
          ),
          contentPadding: const EdgeInsets.only(right: 8, left: 16),
          minLeadingWidth: 20,
          iconColor: activeTabColor,
          dense: true,
          onTap: () {},
        ),
        const Divider(
          height: 0,
          indent: 16,
        ),
      ],
    );
  }
}

class RecentlyAddedSection extends StatelessWidget {
  const RecentlyAddedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.87,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.music_note_2,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Text('Song $index'),
                Text(
                  'Artist $index',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
          childCount: 20,
        ),
      ),
    );
  }
}
