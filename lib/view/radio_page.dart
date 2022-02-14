import 'package:apple_music_clone/constant/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Radio',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 0, color: Colors.grey),
                HeroCard(
                  title: 'Music 1',
                  subTitle: 'The new music that matters.',
                  image: 'assets/images/radio_1.jpg',
                  broadcastHolder: 'J-Pop Now Radio',
                  broadcastDesc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
                HeroCard(
                  title: 'Music Hits',
                  subTitle: 'Songs you know and love.',
                  image: 'assets/images/radio_2.jpg',
                  broadcastHolder: 'Apple Music Radio',
                  broadcastDesc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
                HeroCard(
                  title: 'Music Country',
                  subTitle: 'Where it sounds like home.',
                  image: 'assets/images/radio_3.jpg',
                  broadcastHolder: 'Gaga Radio',
                  broadcastDesc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Broadcast Radio',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Show All',
                        style: TextStyle(color: activeTabColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.95,
              scrollPhysics: const BouncingScrollPhysics(),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BroadcastRadioTile(
                          index: i.toString(),
                        ),
                        const Divider(height: 0),
                        BroadcastRadioTile(
                          index: '${i}a',
                        ),
                        const Divider(height: 0),
                        // BroadcastRadioTile(
                        //   index: '${i}b',
                        // ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}

class BroadcastRadioTile extends StatelessWidget {
  final String index;

  const BroadcastRadioTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'RTHK Radio $index',
        style: const TextStyle(fontSize: 14),
      ),
      subtitle: const Text(
        'From TuneIn',
        style: TextStyle(fontSize: 12),
      ),
      leading: Image.asset('assets/images/rthk.png'),
      trailing: const Icon(
        Icons.more_horiz,
        color: Colors.black,
        size: 16,
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? image;
  final String broadcastHolder;
  final String broadcastDesc;

  HeroCard({
    Key? key,
    required this.title,
    required this.subTitle,
    this.image,
    required this.broadcastHolder,
    required this.broadcastDesc,
  }) : super(key: key);

  final DateTime _now = DateTime.now();
  final DateTime _t1 = DateTime.utc(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, DateTime.now().hour + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const FaIcon(
                FontAwesomeIcons.apple,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Text(subTitle),
          trailing: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(45),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: const Icon(
                CupertinoIcons.calendar,
                size: 14,
                color: activeTabColor,
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.asset(
                      image ?? 'assets/images/radio_1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey[800]!.withOpacity(0.6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Broadcasting \u22c5 ${DateFormat('HH:00').format(_now)} - ${DateFormat('HH:00').format(_t1)}",
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                broadcastHolder,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[100],
                                ),
                              ),
                              Text(
                                broadcastDesc,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(45),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: Icon(
                              CupertinoIcons.play_arrow_solid,
                              size: 16,
                              color: Colors.grey[600]!.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(height: 0, color: Colors.grey),
      ],
    );
  }
}
