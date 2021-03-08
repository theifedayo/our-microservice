import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            children: [
              SizedBox(height: 10),
              Row(
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.pop(context);
                    },child: Icon(Icons.arrow_back_sharp)),
                    SizedBox(width: 20,),
                    Text('Settings', textAlign: TextAlign.left, style: TextStyle(
                        fontFamily: 'Akaya Kanadaka',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none
                    ),),
                  ]
              ),
              SizedBox(height: 10,),

              SizedBox(height: 40,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.user, color: Colors.white,),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Account', style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              SizedBox(height: 20,),
              SettingsCard(cardText: 'Change Password', cardIcon: Icon(Icons.chevron_right, size: 40,),),
              SizedBox(height: 10,),
              SettingsCard(cardText: 'Content settings', cardIcon: Icon(Icons.chevron_right, size: 40,),),
              SizedBox(height: 10,),
              SettingsCard(cardText: 'Language', cardIcon: Icon(Icons.chevron_right, size: 40,),),
              SizedBox(height: 10,),
              SettingsCard(cardText: 'Privacy and security', cardIcon: Icon(Icons.chevron_right, size: 40,),),
              SizedBox(height: 40,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.volumeUp, color: Colors.white,),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Notifications', style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ],
              ),
              SettingsCardToggle(cardText: 'Account activity'),
              SizedBox(height: 10,),
              SettingsCardToggle(cardText: 'Push notifications'),
              SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("LOG OUT", style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        ))
                      ],
                    ),
                  ),
                ),
              ),

            ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  SettingsCard({ this.cardText, this.cardIcon});

  final String cardText;
  final Icon cardIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(
        )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF151521),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        width: 150,
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cardText, style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                )),
              ),
              // SizedBox(width: 200,),
              cardIcon
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCardToggle extends StatefulWidget {
  SettingsCardToggle({ this.cardText});

  final String cardText;

  @override
  _SettingsCardToggleState createState() => _SettingsCardToggleState();
}

class _SettingsCardToggleState extends State<SettingsCardToggle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(
        )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF151521),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        width: 150,
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.cardText, style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                )),
              ),
              // SizedBox(width: 200,),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


