import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: SpotifyApp(),
    );
  }
}

class SpotifyApp extends StatefulWidget {
  const SpotifyApp({super.key});

  @override
  State<SpotifyApp> createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {
  final ScrollController _scrollController = ScrollController();
  double appBarTop = 0;

  @override
  void initState() {
    super.initState();
    listenToScroll();
  }

  void listenToScroll() {
    _scrollController.addListener(
      () {
        double pos = _scrollController.offset;
        if (pos < 60) {
          appBarTop = _scrollController.offset * -1;
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 130),
              child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              'https://i.scdn.co/image/ab67616d0000b2735805afd0516e0628fb04c496',
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Dax - All S',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    padding: const EdgeInsets.only(top: 18),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16, top: 16),
                            child: Text(
                              'Your top mixes',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 170,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150,
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        'https://dailymix-images.scdn.co/v2/img/ab6761610000e5eb8b010945f9d218d19d255f9b/4/en/small',
                                        fit: BoxFit.fitHeight,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Juice WRLD, Chris Brown, Wakadinali',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(),
              curve: Curves.linear,
              top: appBarTop,
              child: Container(
                width: mediaQuery.size.width,
                padding: const EdgeInsets.only(top: 26, left: 16, right: 16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Good evening',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child:
                              Icon(Icons.history_rounded, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Icon(Icons.settings_outlined,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          backgroundColor: Colors.grey.shade900,
                          label: const Text(
                            'Music',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.grey.shade900,
                          label: const Text(
                            'Podcasts & Shows',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: kBottomNavigationBarHeight,
              child: Container(
                width: mediaQuery.size.width - 32,
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.only(left: 8, bottom: 8, top: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(6)),
                      child: Image.network(
                        'https://images.genius.com/c77ea5270bbe69056a4935cc2727d458.1000x1000x1.jpg',
                        height: 40,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Extra Pressure',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Wakadinali',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.speaker_group,
                      color: Colors.grey,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.grey.shade400,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(.9),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_music_outlined),
                label: 'Your Libray'),
          ],
        ),
      ),
    );
  }
}
