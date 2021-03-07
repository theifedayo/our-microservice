import 'package:flutter/material.dart';

class CreateTalkPage extends StatefulWidget {
  CreateTalkPage({ this.talkGroupName, this.talkGroupTime });

  String talkGroupName;
  String talkGroupTime;
  @override
  _CreateTalkPageState createState() => _CreateTalkPageState();
}

class _CreateTalkPageState extends State<CreateTalkPage> {
  String talkvalue;
  String talkTime;
  @override
  void initState(){
    super.initState();
    updateUI(widget.talkGroupName, widget.talkGroupTime);
  }

  void updateUI(dynamic talkValue, dynamic talkTime){
    setState(() {
      talkvalue = talkValue;
      talkTime = talkTime;
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('$talkvalue'),
            Text('$talkTime')
          ],
        )
      ),
    );
  }
}
