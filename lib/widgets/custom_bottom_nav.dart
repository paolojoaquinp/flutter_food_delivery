import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:google_fonts/google_fonts.dart';


const navMenuItems= [
  {
    'icon': Icons.home,
    'label': 'home'
  },
  {
    'icon': Icons.menu_book,
    'label': 'Library'
  },
  {
    'icon': Icons.shopping_cart,
    'label': 'Shopping'
  },
  {
    'icon': Icons.account_circle,
    'label': 'Account'
  },
];


class CustomBottomNav extends StatefulWidget {
  final void Function(int) onTap;
  final int indexSel;
  const CustomBottomNav({super.key,required this.onTap,required this.indexSel});

  
  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navButton(Icons.home, 'Home', 0),
            navButton(Icons.menu_book, 'Library', 1),
            navButton(Icons.shopping_cart, 'Shopping', 2),
            navButton(Icons.account_circle, 'Account', 3),
          ],
        )
      )
    );
  }

  Widget navButton(IconData icon,String label,int index) {
    final _color = index == widget.indexSel ? primaryPurple : primaryYellow;
    bool _visible = true;
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Icon(icon,color: Colors.black),
            if(index == widget.indexSel)
              SizedBox(width: 10,),
            
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: index == widget.indexSel ? 1.0:0.0,
              onEnd: () => _visible = false,
              child: Text( index == widget.indexSel&&_visible ? label: '',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}