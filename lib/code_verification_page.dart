
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
        
        // title: Text(
        //   'Verification Code',
        //   style: TextStyle(
        //     fontSize: 35,
        //     color: Color.fromRGBO(250, 218, 0, 1),
        //     fontWeight: FontWeight.bold,
        //     shadows: <Shadow>[
        //         Shadow(
        //           blurRadius: 20,
        //           color: Color.fromRGBO(0, 0, 50, 1),
        //           offset: Offset(0, 13.0)
        //         )
        //     ]
        //   ),
        // ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            
          ],
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
