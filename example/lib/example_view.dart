import 'package:custom_animated_button/custom_animated_button.dart';
import 'package:flutter/material.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(child: CustomAnimatedButton(
        
        child: Container(width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20)
        ),
        ),
      ),),),
    );
  }
}