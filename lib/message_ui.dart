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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.grey[50],
            pinned: true,
            // floating: true,
            // snap: true,
            // stretch: true,
            centerTitle: false,
            title: const Text(
              'Chatterbox',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: Container(
                width: size.width,
                height: 100,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text('Add Story'),
                          )
                        ],
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text('Stella '),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 8),
              child: Text(
                'Chats',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://img.mensxp.com/media/content/2019/Apr/game-of-thrones-arya-stark-wardrobe1-1555333683.jpg',
                      ),
                    ),
                    title: const Text('Marjan Hussein'),
                    subtitle: const Text('Good morning Africa ...'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('14 min ago'),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(0XFF0156E4),
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.message_sharp), label: 'messages'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'phone'),
          NavigationDestination(
              icon: Icon(Icons.video_call_outlined), label: 'video'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
    );
  }
}
