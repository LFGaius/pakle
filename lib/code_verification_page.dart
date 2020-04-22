
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:pakle/afri_spinner.dart';

class CodeVerificationPage extends StatefulWidget {
  final String from;
  CodeVerificationPage({this.from});

  @override
  _CodeVerificationPageState createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {

  TextEditingController controllerInput1=new TextEditingController();
  TextEditingController controllerInput2=new TextEditingController();
  TextEditingController controllerInput3=new TextEditingController();
  TextEditingController controllerInput4=new TextEditingController();
  TextEditingController controllerInput5=new TextEditingController();
  String globalcode='';
  List<String> codes=['','','','',''];
  int currentindex=0;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      appBar: AppBar(
        elevation:0.0,
        backgroundColor: Color.fromRGBO(250, 218, 0, 1),
        leading: IconButton(
          icon:new Icon(
            Icons.keyboard_arrow_left,
            color: Color.fromRGBO(27, 34, 50, 1),
            size: 40,
          ),
          onPressed: () {
            if(widget.from=='login' || widget.from=='forgetlink')
              Navigator.of(context).pushNamed(
                '/login',
                arguments:'from verification'
              );
            else if(widget.from=='signup')
              Navigator.of(context)..pushNamed(
                '/signup',
                arguments:'from verification'
              );
          },
        )
        
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            showHeaderText(),
            SizedBox(height: 40),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CodeInput(
                    controller: controllerInput1,
                  ),
                  CodeInput(
                    controller: controllerInput2,
                  ),
                  CodeInput(
                    controller: controllerInput3,
                  ),
                  CodeInput(
                    controller: controllerInput4,
                  ),
                  CodeInput(
                    controller: controllerInput5,
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text(
                'Resend Code',
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              onPressed: () {resendCode();},
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.08),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.7,
              child: showPadNumbers()
            )
          ],
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );

    
  }

  resendCode(){
    eraseAll();
  }

  eraseAll(){
    codes[0]='';codes[1]='';codes[2]='';codes[3]='';codes[4]='';
    feedInputs();
  }

  eraseLast(){
    if(currentindex>0){
      currentindex--;
    }
    codes[currentindex]='';
    feedInputs();
  }

  tapPadNumber(String text){
    if(currentindex<5){
      codes[currentindex]=text;
      feedInputs();
      currentindex++;
      if(currentindex==5){
        //check if <globalcode> match to the sent code if not display error
      }
    }
  }

  feedInputs(){
    controllerInput1.text=codes[0];
    controllerInput2.text=codes[1];
    controllerInput3.text=codes[2];
    controllerInput4.text=codes[3];
    controllerInput5.text=codes[4];
    globalcode='${codes[0]}${codes[1]}${codes[2]}${codes[3]}${codes[4]}';
  }

  Widget showPadNumbers(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PadNumber(
              number:1,
              onPressed: () {tapPadNumber('1');},
            ),
            PadNumber(
              number:2,
              onPressed: () {tapPadNumber('2');},
            ),
            PadNumber(
              number:3,
              onPressed: () {tapPadNumber('3');},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PadNumber(
              number:4,
              onPressed: () {tapPadNumber('4');},
            ),
            PadNumber(
              number:5,
              onPressed: () {tapPadNumber('5');},
            ),
            PadNumber(
              number:6,
              onPressed: () {tapPadNumber('6');},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PadNumber(
              number:7,
              onPressed: () {tapPadNumber('7');},
            ),
            PadNumber(
              number:8,
              onPressed: () {tapPadNumber('8');},
            ),
            PadNumber(
              number:9,
              onPressed: () {tapPadNumber('9');},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 60,width: 60),
            PadNumber(
              number:0,
              onPressed: () {tapPadNumber('0');},
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(27, 34, 50, 0.8),
                borderRadius: BorderRadius.circular(50)
              ),
              child: MaterialButton(
                  child: Icon(
                    Icons.backspace,
                    color: Color.fromRGBO(250, 218, 0, 1),
                  ), 
                  onPressed: () {eraseLast();},
              ),
            )
          ],
        )
      ],
    );
  }

  Widget showHeaderText(){
    return  Center(
              child: Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.bold,
                  color:Color.fromRGBO(27, 34, 50, 1),
                  // shadows: <Shadow>[
                  //   Shadow(blurRadius: 40,color: Color.fromRGBO(27, 34, 50, 1),offset: Offset(0,10))
                  // ]
                ),
              ),
            );
  }

  
}

class CodeInput extends StatelessWidget {
  // This widget is the root of your application.

  final TextEditingController controller; 
  CodeInput({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.15,
      child: TextField(
        controller: controller,
        enabled: false,
        obscureText: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(250, 218, 0, 1),
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
          ),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Color.fromRGBO(27, 34, 50, 0.5),
        ),
      ),
    );
  }
}

class PadNumber extends StatelessWidget {
  // This widget is the root of your application.

  final int number; 
  final Function() onPressed;
  PadNumber({this.number,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.15,
      height: MediaQuery.of(context).size.width*0.15,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color.fromRGBO(27, 34, 50, 0.8),
        borderRadius: BorderRadius.circular(50)
      ),
      child: MaterialButton(
        child: Text(
          '$number',
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(250, 218, 0, 1),
          )
        ), onPressed: onPressed,
      ),
    );
  }
}
