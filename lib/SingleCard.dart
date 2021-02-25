import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleCard extends StatefulWidget {
  final String name;
  final String timer;
  final String image;
  SingleCard({Key key, this.name, this.timer, this.image}) : super(key: key);

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
          child: Row(
        children: <Widget>[
          Expanded(child: Text(widget.image)),
          Expanded(child: Text(widget.name)),
          Expanded(child: Text((widget.timer)))
        ],
      )),
    );
  }
}
