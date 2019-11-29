import 'package:first_test/hotel_booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final sectionTitleStyle = TextStyle(
  color: APP_BLACK_COLOR.withOpacity(0.9),
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

final descriptionStyle = TextStyle(
  fontSize: 9.0,
  color: APP_GREY_COLOR,
);

class HotelBookingMainPage extends StatefulWidget {
  @override
  _HotelBookingMainPageState createState() => _HotelBookingMainPageState();
}

class _HotelBookingMainPageState extends State<HotelBookingMainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: screenSize.height * (0.25),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Hello Touhid',
                                  style: TextStyle(
                                      color: APP_GREY_COLOR,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 4),
                              Text('Find your hotel',
                                  style: TextStyle(
                                      color: APP_BLACK_COLOR,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://avatars2.githubusercontent.com/u/25598340?s=460&v=4'),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: APP_GREY_COLOR.withOpacity(0.9),
                        ),
                        hintText: 'Search for hotels',
                        hintStyle: TextStyle(
                          color: APP_GREY_COLOR.withOpacity(0.9),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                height: screenSize.height * (0.32),
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Popular hotels',
                        style: sectionTitleStyle,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: ListView(
                        // shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          PopularItem(),
                          PopularItem(),
                          PopularItem(),
                          PopularItem(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenSize.height * (0.43) -
                    kBottomNavigationBarHeight -
                    24,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Hot packages',
                            style: sectionTitleStyle,
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: APP_GREEN_COLOR,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView(
                        children: <Widget>[
                          HotPackageItem(),
                          HotPackageItem(),
                          HotPackageItem(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: APP_GREEN_COLOR,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HotPackageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            // child: Image.network(
            //   'https://www.mylibertyfurniture.com/globalassets/home-page/mobile/liberty-mobile-images652-br.jpg',
            //   fit: BoxFit.fill,
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.mylibertyfurniture.com/globalassets/home-page/mobile/liberty-mobile-images652-br.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
                left: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'The westin dhaka',
                          style: TextStyle(
                            color: APP_BLACK_COLOR,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.0,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: APP_GREY_COLOR,
                              size: 10,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Kengtaon palace',
                              style: descriptionStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          r'$180/night',
                          style: TextStyle(
                            color: APP_BLUE_COLOR,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.card_giftcard,
                                color: APP_GREEN_COLOR,
                                size: 16,
                              ),
                              Icon(
                                Icons.face,
                                color: APP_GREEN_COLOR,
                                size: 16,
                              ),
                              Icon(
                                Icons.edit,
                                color: APP_GREEN_COLOR,
                                size: 16,
                              ),
                              Icon(
                                Icons.pages,
                                color: APP_GREEN_COLOR,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 48,
                    padding: const EdgeInsets.only(left: 14.0),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: APP_GREEN_COLOR,
                    ),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width / (3.3),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                image: DecorationImage(
                  // TODO : Placeholder image while loading
                  image: NetworkImage(
                    'https://s3.amazonaws.com/furniture.retailcatalog.us/products/390528092/large/kate-grey.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sultans dine',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: APP_BLACK_COLOR,
                    ),
                  ),
                  Text(
                    'Kingdorn Tower, Brazil',
                    style: descriptionStyle,
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: <Widget>[
                      Text(
                        r"$180/night",
                        style: TextStyle(
                          fontSize: 9.0,
                          color: APP_BLUE_COLOR,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: APP_GREEN_COLOR,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: APP_GREEN_COLOR,
                        size: 10.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
