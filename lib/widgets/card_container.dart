

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardContainer extends StatelessWidget {

final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, ),
      child: Container (
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: cardcreate(),
        child: this.child,
        )
    );
  }

  BoxDecoration cardcreate() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
  
}