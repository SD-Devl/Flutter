import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyShop(),
  ));
}

class MyShop extends StatefulWidget {
  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    MyShopHome(selectedIndex: 1),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyShopHome(selectedIndex: index),
          ),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HeadphonePage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LaptopPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}

class MyShopHome extends StatefulWidget {
  final int selectedIndex;

  MyShopHome({required this.selectedIndex});

  @override
  _MyShopHomeState createState() => _MyShopHomeState();
}

class _MyShopHomeState extends State<MyShopHome> {
  TextEditingController _searchController = TextEditingController();


  List<Map<String, String>> cardData = [
    {
      'imageUrl':
      'https://tse2.mm.bing.net/th?id=OIP.JAtSunZUUhEvFa4x4mAUjAHaHa&pid=Api&P=0&h=180',
      'cardTitle': 'Iphone 15',
      'cardDescription':
      'iPhone is a line of smartphones designed and marketed by Apple Inc., known for their sleek design, advanced technology, and user-friendly interface.',
    },
    {
      'imageUrl':
      'https://tse3.mm.bing.net/th?id=OIP.YdY9sCGr0GiZAQwRxzfneAHaFj&pid=Api&P=0&h=180',
      'cardTitle': 'Ipod',
      'cardDescription':
      'The iPod is a portable media player developed by Apple Inc., renowned for its sleek design and user-friendly interface.',
    },
    {
      'imageUrl':
      'https://tse1.mm.bing.net/th?id=OIP.-RlU5xHFuQb_mCCHMJaJpgHaHa&pid=Api&P=0&h=180',
      'cardTitle': 'Mi phone',
      'cardDescription':
      'Mi phones, produced by Xiaomi, are known for their cutting-edge technology, sleek designs, and affordability. ',
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Enter a search term',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: PageView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://tse2.mm.bing.net/th?id=OIP.5ttQMQMU-UueJtiJflsZNAHaEb&pid=Api&P=0&h=180',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://tse3.mm.bing.net/th?id=OIP.A2NJ6JKYdOALtd3VzsUcXQHaFc&pid=Api&P=0&h=180',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              DefaultTabController(
                length: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  if (index == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SmartphonePage()),
                                    );
                                  } else if (index == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HeadphonePage()),
                                    );
                                  } else if (index == 3) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LaptopPage()),
                                    );
                                  } else {
                                    // Handle other tabs as needed
                                  }
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: widget.selectedIndex == index
                                      ? Colors.teal
                                      : Colors.white,
                                  primary: widget.selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  side: BorderSide(color: Colors.teal),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  index == 0
                                      ? 'All'
                                      : index == 1
                                      ? 'Smartphone'
                                      : index == 2
                                      ? 'Headphone'
                                      : 'Laptop',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var data in cardData)
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: CardView(
                          imageUrl: data['imageUrl']!,
                          cardTitle: data['cardTitle']!,
                          cardDescription: data['cardDescription']!,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class SmartphonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smartphone Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'This is the Smartphone Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class HeadphonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Headphone Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'This is the Headphone Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class LaptopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'This is the Laptop Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final String imageUrl;
  final String cardTitle;
  final String cardDescription;

  CardView({
    required this.imageUrl,
    required this.cardTitle,
    required this.cardDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    cardDescription,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your Cart Page Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
