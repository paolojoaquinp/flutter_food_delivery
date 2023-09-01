import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> elem;
  final int index;
  const DetailPage({super.key, required this.elem, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryYellow,
      body: Column(
        children: [
          Expanded(flex: 8, child: _heroDetail(context)),
          Expanded(flex: 10, child: _wrapperInfo(context))
        ],
      ),
    );
  }

  Widget _wrapperInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _card1(context,
          () {
            setState(() {
              indexSelected = 0;
            });
          }
        ),
        AnimatedPositioned(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          bottom: indexSelected == 1 ? -size.height*0.32 : -size.height * 0.57,
          child: GestureDetector(
            onTap: () {
              setState(() {
                indexSelected = 1;
              });
            },
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: 10),
              width: size.width,
              height: 800,
              decoration: BoxDecoration(
                  color: secondaryYellow,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  )
              ),
              child: FractionallySizedBox(
                  heightFactor: 0.4,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ingredients',
                              style: GoogleFonts.barlowCondensed(
                                  fontWeight: FontWeight.w600, fontSize: 26)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            style: GoogleFonts.roboto(fontSize: 14, letterSpacing: -0.5),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ),
        _card3()
      ],
    );
  }

  Widget _card3() {
    final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      bottom: indexSelected == 2 
        ? -size.height * 0.44  
        : (indexSelected == 1 ? -size.height*0.8 : -size.height*0.64),
      child: GestureDetector(
        onTap: () {
          setState(() {
            indexSelected = 2;
          });
        },
        child: Container(
          width: size.width,
          height: 800,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 10),
          decoration: BoxDecoration(
              color: primaryPurple,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              )
          ),
          child: FractionallySizedBox(
            heightFactor: 0.4,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',
                        style: GoogleFonts.barlowCondensed(
                            fontWeight: FontWeight.w600, fontSize: 26)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: GoogleFonts.roboto(fontSize: 14, letterSpacing: -0.5),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card1(BuildContext context,VoidCallback onTap) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        width: size.width,
        height: 800,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width,
              height: size.height * 0.1,
              child: Text(
                '${widget.elem['title']}\n${widget.elem['type']}',
                style: GoogleFonts.barlowCondensed(
                    fontSize: 30, fontWeight: FontWeight.w700, height: 0),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _counterWidget(context),
                  _itemDescription('Size', '16"'),
                  _itemDescription('Preparation', '4 minute'),
                  _itemDescription('Cooking', '10 minute'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _counterWidget(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = size.width * 0.035;
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Quantity',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: iconSize,
                backgroundColor: Color(0xffd39d49),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: iconSize,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text('1',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: size.width * 0.02,
              ),
              CircleAvatar(
                radius: iconSize,
                backgroundColor: primaryPink,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: iconSize,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _itemDescription(String title, String label) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              letterSpacing: -0.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _heroDetail(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          child: Hero(
              tag: 'pizza_${widget.index.toString()}',
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset(
                  widget.elem['image'],
                  fit: BoxFit.fitWidth,
                ),
              )),
        ),
        Positioned(
            top: size.height * 0.05,
            left: size.width * 0.03,
            child: CircleAvatar(
              backgroundColor: primaryYellow,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
          )
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.05),
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 4),
            decoration: BoxDecoration(
              color: primaryPurple,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1,color: Colors.black)
            ),
            child: const Text('\$6.20',
              style: TextStyle(
                letterSpacing: -0.5
              ),
            )
          ),
        ),
      ],
    );
  }
}
