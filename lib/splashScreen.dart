import 'dart:async';
import 'package:bs_tek/login.dart';
import 'package:flutter/material.dart';

import 'Wrapper.dart';


class splash_screen extends StatefulWidget {
  splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home page after 6 seconds
    Timer(Duration(seconds: 60), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Wrapper()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "picture/img.png",
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 10,),
              Text("Book Appointment",style: TextStyle(fontSize: 40,color: Colors.deepPurpleAccent,fontWeight: FontWeight.w900),),
              SizedBox(height: 10,),
              Text("Book Doctor's Appointment For\n the patients"),
              SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.deepPurpleAccent,
                  child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white),)),

                ),
                onTap: ()=>{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),),
                },
              ),



            ],
          ),
        ),
      ),
    );
  }
}