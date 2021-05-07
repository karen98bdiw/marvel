import 'package:flutter/material.dart';
import 'package:marvel/icons/my_flutter_app_icons.dart';
import 'package:marvel/widgets/custom_botton.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/pages/sign_in_page.dart';

class OnBoard extends StatefulWidget {
  static final routeName = "OnBoard";

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                      "assets/image/background1.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/image/mainimg.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MyFlutterApp.circle_thin,
                        color: Colors.yellow,
                      ),
                      Icon(
                        MyFlutterApp.circle_thin,
                        color: Colors.yellow,
                      ),
                      Icon(
                        MyFlutterApp.circle_thin,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Welcom to the  Marvel Universe",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
                CutomButton(
                  buttonColor: Theme.of(context).buttonColor,
                  text: "SKIP",
                  onTap: () {
                    Navigator.of(context).pushNamed(SignInPage.routeName);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
