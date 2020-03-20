
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pakle/afri_spinner.dart';

class CodeVerificationPage extends StatefulWidget {
  CodeVerificationPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CodeVerificationPageState createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {

  TextEditingController controllerInput1=new TextEditingController();
  TextEditingController controllerInput2=new TextEditingController();
  TextEditingController controllerInput3=new TextEditingController();
  TextEditingController controllerInput4=new TextEditingController();
  TextEditingController controllerInput5=new TextEditingController();
  String code;
  


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          onPressed: () {},
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
              onPressed: () {},
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

  tapPadNumber(String text){
    controllerInput1.text=text;
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
                  onPressed: () {},
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
