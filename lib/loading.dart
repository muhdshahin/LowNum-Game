import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05)),
          Column(
            children: [
              Image(
                image: AssetImage('assets/numbers.png'),
                width: 139,
                height: 128,
              ),
              Text(
                "Low Num",
                style: TextStyle(
                  color: Color.fromRGBO(255, 159, 64, 1),
                  fontSize: 48,
                  fontFamily: "titlefont",
                ),
              ),
            ],
          ),
          Container(
              child: Center(
            child: Image(
              image: AssetImage('assets/logo.png'),
              width: 139,
              height: 126,
            ),
          )),
        ],
      ),
    );
  }
}


 



