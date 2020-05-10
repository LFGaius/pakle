
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      appBar:AppBar(
        elevation:25.0,
        backgroundColor: Color.fromRGBO(27, 34, 50, 1),
        // title: Text('home'),
        iconTheme: IconThemeData(color: Color.fromRGBO(250, 218, 0, 1)),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right:8),
        //     child: Image.asset(
        //       "assets/pakle.jpg",
        //       width: MediaQuery.of(context).size.height*0.15,

        //     ),
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(250, 218, 0, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children:  <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/backheaddawer.png'),
                    fit: BoxFit.fill
                  ),
                  color: Color.fromRGBO(27, 34, 50, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            color: Color.fromRGBO(250, 218, 0, 1),
                            size: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Gaius',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(250, 218, 0, 1),
                                  fontSize:16,
                                ),
                              ),
                              Text(
                                'lib@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(250, 218, 0, 1),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color:Color.fromRGBO(27, 34, 50, 0.9),
                ),
                title: Text(
                  'Messages',
                  style: TextStyle(
                    color:Color.fromRGBO(27, 34, 50, 1)
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color:Color.fromRGBO(27, 34, 50, 0.9),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color:Color.fromRGBO(27, 34, 50, 1)
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color:Color.fromRGBO(27, 34, 50, 0.9),
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    color:Color.fromRGBO(27, 34, 50, 1)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.35,
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hometop.png'),
                fit: BoxFit.fill
              )
            )
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Color.fromRGBO(27, 34, 50, 1),
      //   child: Icon(
      //     Icons.home,
      //     color:Color.fromRGBO(250, 218, 0, 1)
      //   ),
      // ), 
    );
  }
}
