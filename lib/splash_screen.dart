import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart' as c;
import 'package:food_delivery/widgets/button_primary.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: c.primaryYellow,
        body: Stack(
          children: [
            Positioned(
              bottom: -15,
              left: -10,
              child: Image.asset(
                'assets/background-splash.png',
                fit: BoxFit.cover,
                width: size.width,
              ),
            ),
            Positioned(
              right: 80,
              top: size.height * 0.28,
              child: Transform.rotate(
                angle: 70,
                origin: Offset(0.0, 0.0),
                child: Image.asset(
                  'assets/smiley-red-face.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            //0.9
            TweenAnimationBuilder<double>(
              curve: Curves.easeOutSine,
              duration: const Duration(milliseconds: 800),
              tween: Tween(begin: size.height*0.9, end: size.height*0.65),
              builder: (context, value, _ ) {
                return Transform.translate(
                  offset: Offset(0,value),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      'assets/hand-profile-hamburguer.png',
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  width: double.infinity,
                  child: Text(
                    'Yum Yum Yay!\nEat Play\nLove',
                    style: GoogleFonts.barlowCondensed(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.0,
                        fontSize: 75,
                        height: 0.9,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: size.width * 0.4,
                  height: 60,
                  child: ButtonPrimary(label: 'Dig In Now')
                )
              ],
            ),
          ],
        ));
  }
}
