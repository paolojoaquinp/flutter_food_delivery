import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/detail_page.dart';
import 'package:food_delivery/widgets/button_primary.dart';
import 'package:food_delivery/widgets/custom_bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

const categories = [
  'All',
  'Breakfast',
  'Pizza',
  'Burguer',
  'Desert',
  'Breakfast',
  'Pizza',
  'Burguer',
  'Desert'
];

const pizzaInfo = [
  {
    'image': 'assets/pizza-flavor-1.jpeg',
    'title': 'Herbed Butter Heirloom',
    'type': 'Tomato Pizza',
    'time': 30,
    'views': 150000
  },
  {
    'image': 'assets/pizza-flavor-2.jpeg',
    'title': 'Sourdough Heirloom',
    'type': 'Pizza',
    'time': 30,
    'views': 350000
  },
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexSelected = 0;
  int navIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryYellow,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            _customHeader(context),
            const SizedBox(height: 40,),
            _bodyHomePage(),
            _customNavigationBar()
          ],
        ));
  }

  Widget _customHeader(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Food',
              style: GoogleFonts.barlowCondensed(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
              )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: CircleAvatar(
                    radius: 12,
                    child: Text('1'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.21,
                  height: 40,
                  child: ButtonPrimaryTiny(label: 'Menu'))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyHomePage() {
    return Expanded(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              alignment: Alignment.centerLeft,
              child: Text(
                'Get Cooking Today',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: -0.5),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: TextField(
                decoration: InputDecoration(
                    label: Text(
                      'Search Recipes',
                      style: GoogleFonts.roboto(letterSpacing: -0.4),
                    ),
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04),
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          indexSelected = i;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            color: indexSelected == i
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(categories[i],
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color:
                                    indexSelected == i
                                        ? Colors.white
                                        : Colors.black
                                    )),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '20 Recipes',
                    style: GoogleFonts.roboto(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  IconButton(
                    padding: null,
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt_outlined),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 420,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pizzaInfo.length,
                itemBuilder: (context, index) {
                  final el = pizzaInfo[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 650),
                          pageBuilder:  (context,animation,_) {
                            return FadeTransition(
                              opacity: animation,
                              child: DetailPage(elem: el,index: index,),
                            );
                          }
                        )
                      );
                    },
                    child: Hero(
                      tag: 'pizza_${index.toString()}',
                      child: _pizzaItem(el)
                    )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pizzaItem(Map<String, Object> el) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            el['image'] as String,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
      padding: EdgeInsets.only(bottom: 12,left: 10),
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            color: primaryYellow,
            onPressed: () {},
            icon: Icon(Icons.auto_stories),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${el['title'] as String}\n${el['type'] as String}',
                  style: GoogleFonts.barlowCondensed(
                      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 26),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: primaryPink,
                      borderRadius: BorderRadius.all(Radius.circular(26))
                    ),
                    child: Text(
                      '${el['time'].toString()} minutes',
                      style: GoogleFonts.roboto(
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: secondaryYellow,
                      borderRadius: BorderRadius.all(Radius.circular(26))
                    ),
                    child: Text(
                      '${el['time'].toString()} minutes',
                      style: GoogleFonts.roboto(
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _customNavigationBar() {
    return Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
          top: 10,
        ),
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        alignment: Alignment.topCenter,
        child: CustomBottomNav(
            onTap: (int index) {
              setState(() {
                navIndexSelected = index;
              });
            },
            indexSel: navIndexSelected
          )
        );
  }
}
