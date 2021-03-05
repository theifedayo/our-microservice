import 'package:flutter/material.dart';

class CreateTalkPage extends StatefulWidget {
  CreateTalkPage({ this.talkGroupName });

  String talkGroupName;
  @override
  _CreateTalkPageState createState() => _CreateTalkPageState();
}

class _CreateTalkPageState extends State<CreateTalkPage> {
  String talkvalue;
  @override
  void initState(){
    super.initState();
    updateUI(widget.talkGroupName);
  }

  void updateUI(dynamic talkValue){
    setState(() {
      talkvalue = talkValue;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$talkvalue')
    );
  }
}
