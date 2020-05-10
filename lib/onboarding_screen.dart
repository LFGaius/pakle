
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final  int numpages=3;
  final PageController pagecontroller=PageController(initialPage: 0);
  int currentpage=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 0, 1),
      body:Padding(
        padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
        child:Column(
          children:[
            Container(
              height:MediaQuery.of(context).size.height*0.80,
              child:PageView(
                physics: ClampingScrollPhysics(),
                controller:pagecontroller,
                onPageChanged: (int page) {
                  setState(() {
                    currentpage=page;
                  });
                },
                children:[
                  OnboardingSlide(
                    imagepath: 'assets/interact.png',
                    message: 'PAKLE, an application that draw you close to your mother tongues',
                  ),
                  OnboardingSlide(
                    imagepath: 'assets/teach.png',
                    message: 'You can create new tongues for other learners',
                  ),
                  OnboardingSlide(
                    imagepath: 'assets/learn.png',
                    message: 'You can learn tongues created by the others',
                  )
                ]
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              child: (currentpage==numpages-1)?
                SizedBox( 
                  width:MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Color.fromRGBO(27, 34, 50, 1),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 218, 0, 1),
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(
                        '/login'
                      );
                    },
                  ),
                )
                :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed(
                          '/login'
                        );
                      },
                    ),
                    DotsIndicator(
                      dotsCount: numpages,
                      position: currentpage.toDouble(),
                      decorator:DotsDecorator(
                        color: Colors.black12
                      )
                    ),
                    FlatButton(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      onPressed: () {
                        pagecontroller.nextPage(duration: Duration(milliseconds: 400), curve: Curves.linear);
                      },
                    ),
                  ],
                ),
            )
          ]
        )
      )
    );
  }

}

class OnboardingSlide extends StatelessWidget {
  final String imagepath;
  final String message;
  OnboardingSlide({this.imagepath,this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  imagepath,
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width*0.85,
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Container(
                padding: EdgeInsets.symmetric(horizontal:40),
                child:Text(
                  message,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 21,
                    color: Color.fromRGBO(27, 34, 50, 0.9)
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
  }
}
