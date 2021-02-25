import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_calendar/AddItemPage.dart';
import 'package:game_calendar/SingleCard.dart';

class Item {
  String name;
  int timer;
}

final List<String> tempitems = [
  'temp item 1',
  'temp item 2',
  'temp item 3',
  'temp item 4'
];

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  List<ItemModel> items = [
    ItemModel(name: 'xenoblade', dayTime: TimeOfDay.now().toString())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push<ItemModel>(
              context, MaterialPageRoute(builder: (context) => AddItemPage()));
          print(result);
        },
      ),
      body: Column(
          children: items
              .map((e) =>
                  SingleCard(image: 'image', name: e.name, timer: e.dayTime))
              .toList()
          // [
          //   SingleCard(
          //     image: 'image',
          //     name: 'Metroid Prime 4',
          //     timer: 'never',
          //   ),
          //   SingleCard(
          //     image: 'image',
          //     name: 'Shin Megami Tensei V',
          //     timer: 'this year?',
          //   ),
          //   SingleCard(
          //     image: 'image',
          //     name: 'Silksong',
          //     timer: 'SOON',
          //   ),
          // ],
          ),
    );
  }
}
