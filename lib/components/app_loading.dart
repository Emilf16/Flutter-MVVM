import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';  

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: CupertinoActivityIndicator(color: Colors.black,),
    );
  }
}
