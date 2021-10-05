import 'package:flutter/material.dart';

class ViewGames extends StatefulWidget {
  const ViewGames({Key? key}) : super(key: key);

  @override
  _ViewGamesState createState() => _ViewGamesState();
}

class _ViewGamesState extends State<ViewGames> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var searchText = "";
  var games = [
    {"title": "Super Mario Bros. 3"},
    {"title": "The Legend Of Zelda: A Link To The Past"},
    {"title": "Tetris"},
    {"title": "Street Fighter II Turbo"},
    {"title": "Super Mario Kart"},
    {"title": "Sonic The Hedgehog 2"},
    {"title": "Donkey Kong"},
    {"title": "Outrun"},
    {"title": "Streets Of Rage 2"},
    {"title": "Space Invaders"},
    {"title": "Super Metroid"},
  ];

  @override
  Widget build(BuildContext context) {
    var filteredGames = games.where((element) =>
        element["title"]!.toLowerCase().contains(searchText.toLowerCase()));
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 125,
          flexibleSpace: Container(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bruno's Retro Games",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _controller,
                    onChanged: (String value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: "Search here...", border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            filteredGames.length,
            (index) => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                child: Text("${filteredGames.elementAt(index)["title"]}"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
