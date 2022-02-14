import 'package:apple_music_clone/bloc/search_cubit.dart';
import 'package:apple_music_clone/constant/color.dart';
import 'package:apple_music_clone/widgets/bottom_nav_bar.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDetailsPage extends StatelessWidget {
  SearchDetailsPage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'search',
                      child: CupertinoSearchTextField(
                        controller: _searchController,
                        placeholder: "Artists, Songs, Lyrics and More",
                        autofocus: true,
                        onSubmitted: (value) async {
                          await context.read<SearchCubit>().search(value);
                        },
                        onTap: () {
                          context.read<SearchCubit>().reInit();
                        },
                        onSuffixTap: () {
                          context.read<SearchCubit>().reInit();
                          _searchController.clear();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          color: activeTabColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    BlocBuilder<SearchCubit, SearchCubitState>(
                      builder: (context, state) {
                        return Offstage(
                          offstage: state is SearchCubitLoaded ||
                              state is SearchCubitError,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 28,
                              child: const TabBar(
                                labelColor: Colors.black,
                                tabs: [
                                  Tab(
                                    text: "Apple Music",
                                  ),
                                  Tab(
                                    text: "Your Library",
                                  ),
                                ],
                                indicator: ContainerTabIndicator(
                                  radius: BorderRadius.all(Radius.circular(8)),
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  color: Colors.white,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocBuilder<SearchCubit, SearchCubitState>(
                            builder: (context, state) {
                              if (state is SearchCubitLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is SearchCubitLoaded) {
                                if (state.results.resultCount == 0) {
                                  return const Center(
                                    child: Text(
                                      "No results found",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(state.results
                                                  .results![index].trackName ??
                                              ""),
                                          subtitle: Text(
                                              "${state.results.results![index].kind} - ${state.results.results![index].artistName}"),
                                          leading: Image.network(
                                            state.results.results![index]
                                                    .artworkUrl100 ??
                                                "",
                                            width: 50,
                                          ),
                                          trailing: const Icon(
                                            CupertinoIcons.forward,
                                            size: 12,
                                          ),
                                        ),
                                        const Divider(height: 0),
                                      ],
                                    );
                                  },
                                  itemCount: state.results.resultCount,
                                );
                              } else if (state is SearchCubitError) {
                                return Center(
                                  child: Text(state.message),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                          const Center(
                            child: Text(
                                "You don't have any songs in your library"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
