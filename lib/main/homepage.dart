import 'package:flutter/material.dart';
import 'package:prjctflora/main/CustomWidget/indoorTile.dart';
import 'package:prjctflora/main/CustomWidget/popularTile.dart';
import 'CustomWidget/CategoryTile.dart';
import 'Cart.dart';
import 'Chat.dart';
import 'Wishlist.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final TextEditingController search = TextEditingController();
  final cs.CarouselController _carouselController =
      cs.CarouselController(); // Use the aliased CarouselController
  int _currentIndex = 0; // Track the current index for the carousel
  final List<String> banners = [
    'assets/images/homepagetop.png',
    'assets/images/homepagetop.png',
    'assets/images/homepagetop.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff08A562),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(width: 20), // Spacing between icons
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(width: 20), // Spacing between icons
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Wishlist()),
                  );
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(width: 20), // Spacing between icons
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                },
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35),
              Image.asset(
                'assets/images/signlogo.png',
                height: 50,
                width: 99,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            Text(
                              ' User',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff08A562),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          'Good Evening',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0), // Border width
                        decoration: const BoxDecoration(
                          color: Color(0xff08A562),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                          radius: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xff08A562),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80.0, left: 10, top: 10),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.mic_none_outlined,
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'search plant name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'search plant name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              cs.CarouselSlider(
                items: banners.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(banner, fit: BoxFit.fill));
                    },
                  );
                }).toList(),
                options: cs.CarouselOptions(
                  height: 132,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                carouselController: _carouselController,
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: banners.length,
                effect: WormEffect(
                  dotHeight: 9.0,
                  dotWidth: 9.0,
                  activeDotColor: const Color(
                      0xff000000), // Example color, adjust as needed
                  dotColor:
                      Colors.teal.shade200, // Example color, adjust as needed
                ), // Your preferred effect
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Categorytile(
                        categoryImage: 'assets/images/allplants.png',
                        categoryTitle: 'All Plants'),
                    Categorytile(
                        categoryImage: 'assets/images/indoorplants.png',
                        categoryTitle: 'Indoor '),
                    Categorytile(
                        categoryImage: 'assets/images/outdoorplants.png',
                        categoryTitle: 'Outdoor '),
                    Categorytile(
                        categoryImage: 'assets/images/flowerplants.png',
                        categoryTitle: 'Flower '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Popular Plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Populartile(
                      popularimage: 'assets/images/moneyplant.png',
                      plantname: 'Money plant',
                      plantprice: '₹ 270/-',
                      orginalprice: '₹ 300',
                      plantrating: '4.5',
                      offpercentage: '10%',
                      planttype: 'Indoor plant',
                    ),
                    Populartile(
                      popularimage: 'assets/images/Alocasia.png',
                      plantname: 'Alocasia',
                      plantprice: '₹ 250/-',
                      orginalprice: '₹ 300',
                      plantrating: '4.5',
                      offpercentage: '10%',
                      planttype: 'Indoor plant',
                    ),
                    Populartile(
                      popularimage: 'assets/images/mooncactus.png',
                      plantname: 'Moon cactus',
                      plantprice: '₹ 350/-',
                      orginalprice: '₹ 400',
                      plantrating: '4.5',
                      offpercentage: '12.5%',
                      planttype: 'Indoor plant',
                    ),
                  ],
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Indoor Plants',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                )),
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/sansivena.png', planttype: 'Indoor plant', plantname: 'Monstera', plantrating: '4.5', plantrate: '1150', plantsize: 'Medium', plantpreviousprice: '1,250', planttypecolor: Color(0xff08A562)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/monstera.png', planttype: 'Indoor plant', plantname: 'Seinsivica', plantrating: '4.5',plantrate: '450', plantsize: 'Small', plantpreviousprice: '500', planttypecolor: Color(0xff08A562),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Outdoor Plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/sansivena.png', planttype: 'Outdoor plant', plantname: 'Monstera', plantrating: '4.5', plantrate: '1150', plantsize: 'Medium', plantpreviousprice: '1,250', planttypecolor: Color(0xffCB4F4F),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/monstera.png', planttype: 'Outdoor plant', plantname: 'Seinsivica', plantrating: '4.5',plantrate: '450', plantsize: 'Small', plantpreviousprice: '500', planttypecolor: Color(0xffCB4F4F)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Local Plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/sansivena.png', planttype: 'Outdoor plant', plantname: 'Monstera', plantrating: '4.5', plantrate: '1150', plantsize: 'Medium', plantpreviousprice: '1,250', planttypecolor: Color(0xffCB4F4F),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/monstera.png', planttype: 'Outdoor plant', plantname: 'Seinsivica', plantrating: '4.5',plantrate: '450', plantsize: 'Small', plantpreviousprice: '500', planttypecolor: Color(0xffCB4F4F)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Desk Plants',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/sansivena.png', planttype: 'Outdoor plant', plantname: 'Monstera', plantrating: '4.5', plantrate: '1150', plantsize: 'Medium', plantpreviousprice: '1,250', planttypecolor: Color(0xffCB4F4F),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Indoortile(indoorimage: 'assets/images/monstera.png', planttype: 'Outdoor plant', plantname: 'Seinsivica', plantrating: '4.5',plantrate: '450', plantsize: 'Small', plantpreviousprice: '500', planttypecolor: Color(0xffCB4F4F)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
