import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {
final Widget child;

  const AuthBackground({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return Container( 
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

        
        _PurpleBox(),
        HeaderIcon(),
        this.child, 
        
        ],
      ),
    );
  }

  SafeArea HeaderIcon() {
    return SafeArea(
        child :Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          child: Icon(Icons.person_pin, color: Colors.white, size: 100),
        )
       );
  }
}


class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
           Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(child: Bubble(), top: 90, left: 30),
          Positioned(child: Bubble(), top: -40, left: -30),
          Positioned(child: Bubble(), top: -50, right: -20),
          Positioned(child: Bubble(), bottom: -50, right: -10),
          Positioned(child: Bubble(), bottom: 120, right: 20),   
          Positioned(child: Bubble(), bottom: -50, left: -20), 
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}