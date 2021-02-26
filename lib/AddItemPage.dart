import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemModel {
  String name;
  DateTime dateTime;

  ItemModel({this.name, this.dateTime});
}

class AddItemPage extends StatefulWidget {
  AddItemPage({Key key}) : super(key: key);

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  DateTime _dateTime;
  final nameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
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
                TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: (DateTime(DateTime.now().year + 10)))
                          .then((date) {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                    child: Text('select date'))
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
                                  dateTime: _dateTime))
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
