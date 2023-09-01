import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/home_page.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  const ButtonPrimary({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: primaryYellow,
      minimumSize: Size(size.width, 34),
      padding: EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.009),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1,color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
    return Container(
      height: double.infinity,
      /* color: Colors.red, */
      margin: EdgeInsets.only(left: size.width * 0.05),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: 10+10,
                right: constraints.constrainWidth()*0.05,
                child: Container(
                  height: 36,
                  width: constraints.constrainWidth()*0.89,
                  decoration: BoxDecoration(
                    color: primaryPink,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                ),
              ),
              Positioned(
                top: 10+6,
                right: constraints.constrainWidth()*0.07,
                child: Container(
                  height: 36,
                  width: constraints.constrainWidth()*0.89,
                  decoration: BoxDecoration(
                    color: primaryPurple,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                ),
              ),
              Positioned(
                top: 10 + 2,
                right: constraints.constrainWidth()*0.09,
                child: Container(
                  width: constraints.constrainWidth()*0.89,
                  height: 36,
                  decoration: BoxDecoration(
                    color: secondaryYellow,
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.04),
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },
                  child: Text(label),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


class ButtonPrimaryTiny extends StatelessWidget {
  final String label;
  const ButtonPrimaryTiny({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: primaryYellow,
      minimumSize: Size(size.width*0.16, 30),
      padding: EdgeInsets.symmetric(horizontal: size.width*0.001,vertical: size.height*0.002),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1,color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(90)),
      ),
    );
    return Container(
      height: double.infinity,
      margin: EdgeInsets.only(left: 10),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryPink,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Colors.black,width: 1)
                ),
              ),
            ),
          ),
          Positioned(
            child: FractionallySizedBox(
              widthFactor: 0.96,
              heightFactor: 0.94,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryPurple,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Colors.black,width: 1)
                ),
              ),
            ),
          ),
          Positioned(
            child: FractionallySizedBox(
              widthFactor: 0.92,
              heightFactor: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryYellow,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Colors.black,width: 1)
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.88,
            heightFactor: 0.84,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () {
              },
              child: Text(label),
            ),
          ),
        ],
      )
    );
  }
}