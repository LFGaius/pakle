
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'afri_spinner.dart';

class ProfilePage extends StatefulWidget {
  final String from;
  final Map<String,dynamic> userData;
  ProfilePage({this.from,this.userData});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body: Center(
        child: ListView(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: MediaQuery.of(context).size.width*0.6,
              color:Color.fromRGBO(27, 34, 50, 1)
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            CustomTile(
              leading:Icon(
                Icons.person,
                size: MediaQuery.of(context).size.width*0.13,
                color:Color.fromRGBO(27, 34, 50, 0.8),
              ),
              label:'Username',
              text:'gaius',
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            CustomTile(
              leading:Icon(
                Icons.email,
                size: MediaQuery.of(context).size.width*0.13,
                color:Color.fromRGBO(27, 34, 50, 0.8),
              ),
              label:'Email',
              text:'l@ddf.fr',
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            CustomTile(
              leading:Icon(
                Icons.phone,
                size: MediaQuery.of(context).size.width*0.13,
                color:Color.fromRGBO(27, 34, 50, 0.8),
              ),
              label:'Phone',
              text:'+23700558866',
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            CustomTile(
              leading:Icon(
                Icons.group,
                size: MediaQuery.of(context).size.width*0.13,
                color:Color.fromRGBO(27, 34, 50, 0.8),
              ),
              label:'Tribe',
              text:'Bamileke',
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            CustomTile(
              leading:Icon(
                Icons.home,
                size: MediaQuery.of(context).size.width*0.13,
                color:Color.fromRGBO(27, 34, 50, 0.8),
              ),
              label:'Village',
              text:'Badjoun',
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/home'
          );
        },
        backgroundColor: Color.fromRGBO(27, 34, 50, 1),
        child: Icon(
          Icons.home,
          color:Color.fromRGBO(250, 218, 0, 1)
        ),
      ),
    );

    
  }
  
}

class CustomTile extends StatelessWidget{
  final Icon leading;
  final String label;
  final String text;
  // final bool editable;
  // final Function onEdit;

  CustomTile({this.leading,this.label,this.text});
  @override
  Widget build(context){
    return Container(
      width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left:15.0),
              child: Row(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),     leading,
                  Padding(
                    padding: const EdgeInsets.only(left:15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          label,
                          style: TextStyle(
                            color:Color.fromRGBO(27, 34, 50, 1),
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            color:Color.fromRGBO(27, 34, 50, 1),
                            fontSize: 17
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Icon(
                  //   Icons.edit,
                  //   size: MediaQuery.of(context).size.width*0.09,
                  //   color:Color.fromRGBO(27, 34, 50, 0.9),
                  // ),
                ],
              ),
            );
  }
}
