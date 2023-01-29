import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/view_models/services/splash_services.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices  splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);

    // Timer.periodic(Duration(seconds: 5), (timer) {

    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Icon(
              Icons.flutter_dash_sharp,
              size: 100,
              color: Colors.blue,
            ),
          ),
          Text(
            'My MVVM Architechture',
            style: TextStyle(fontSize: 34, color: Colors.blue),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:  38.0),
            child: LinearProgressIndicator(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
