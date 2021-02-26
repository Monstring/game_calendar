import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_moment/simple_moment.dart';

class SingleCard extends StatefulWidget {
  final String name;
  final DateTime initialTime;
  final String image;
  SingleCard({Key key, this.name, this.initialTime, this.image})
      : super(key: key);

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  Duration remainingTime;
  Timer timer;
  String timerText = '';
  Moment timerMoment;
  @override
  void initState() {
    remainingTime = widget.initialTime.difference(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // remainingTime = remainingTime - (Duration(seconds: 1));
        // timerMoment = Moment.fromDateTime(widget.initialTime);
        timerText = remainingTime.inDays.toString();
        // timerText = timerMoment.fromNow();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10).copyWith(top: 5),
      child: Card(
          child: Row(
        children: <Widget>[
          Expanded(child: Text(widget.image)),
          Expanded(child: Text(widget.name)),
          Expanded(child: Text(timerText))
        ],
      )),
    );
  }
}
