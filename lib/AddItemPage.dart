import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemModel {
  String name;
  String dayTime;

  ItemModel({this.name, this.dayTime});
}

class AddItemPage extends StatefulWidget {
  AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final nameController = TextEditingController();
  final timeController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('name of game: '),
                Expanded(
                  child: TextField(
                    controller: nameController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('day of release: '),
                Expanded(
                  child: TextField(
                    controller: timeController,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('image of game: '),
                Expanded(
                  child: TextField(),
                )
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () => {
                          Navigator.pop(
                              context,
                              ItemModel(
                                  name: nameController.text,
                                  dayTime: timeController.text))
                        },
                    child: Text('submit'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
