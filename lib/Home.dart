//       import 'package:flutter/material.dart';
// import 'package:project/NewPage.dart';
// import 'package:project/signUp.dart';
//
//       import 'MusicList.dart';
//       import 'Song.dart';
//       import 'User.dart';
//
//       void main() {
//         runApp(MaterialApp(
//           home: TadasApp(),
//         ));
//       }
//
//       class TadasApp extends StatelessWidget {
//         const TadasApp({Key? key}) : super(key: key);
//
//
//         @override
//         Widget build(BuildContext context) {
//           return MaterialApp(
//             home: MyHomePage(),
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primarySwatch: Colors.teal,
//               hintColor:Colors.amber,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//
//             ),
//           );
//         }
//       }
//
//       class MyHomePage extends StatefulWidget {
//         @override
//         _MyHomePageState createState() => _MyHomePageState();
//       }
//
//       class _MyHomePageState extends State<MyHomePage>
//           with SingleTickerProviderStateMixin {
//
//         int _selectedIndex = 0;
//         late TabController _tabController;
//         final List<Song> songs = [
//           Song(
//             image: 'https://tse3.mm.bing.net/th?id=OIP.ri5WUbdKANXTG4xkU_o-uwHaHa&pid=Api&P=0&h=180',
//             name: 'Song 1',
//             shortDescription: 'Artist ',
//             longDescription: 'Long description of Song 1',
//             detail: 'this is song is ....'
//             ,
//             duration: '3:30',
//           ),
//           Song(
//             image: 'https://tse3.mm.bing.net/th?id=OIP.NqIG28Y5qug_sZuvZtyZCQHaHa&pid=Api&P=0&h=180',
//             name: 'Song 2',
//             shortDescription: 'Short description of Song 2',
//             longDescription: 'Long description of Song 2',
//             detail: 'This is song'
//             ,
//             duration: '4:15',
//           ),
//           // Add more songs as needed
//         ];
//         User user = User(
//           id: 1,
//           username: 'john_doe',
//           email: 'john.doe@example.com',
//           firstName: 'John',
//           lastName: 'Doe',
//           gender: 'Male',
//           image: 'https://tse3.mm.bing.net/th?id=OIP.Lpx9j83qR_cfQuaPHuvwWQHaHw&pid=Api&P=0&h=180',
//         );
//
//         @override
//         void initState() {
//           super.initState();
//           _tabController = TabController(length: 3, vsync: this);
//         }
//
//         @override
//         void dispose() {
//           _tabController.dispose();
//           super.dispose();
//         }
//
//         void _openProfileTabs(BuildContext context) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProfileTabsScreen(),
//             ),
//           );
//         }
//
//         Future<void> _showLogoutDialog(BuildContext context) async {
//           return showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Logout'),
//                 content: Text('Are you sure you want to logout?'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Close the dialog
//                     },
//                     child: Text('Cancel'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Close the dialog
//                       // Perform logout logic here
//                     },
//                     child: Text('Logout'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//
//         @override
//         Widget build(BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("Welcome"),
//               actions: [
//                 PopupMenuButton(
//                   itemBuilder: (context) {
//                     return [
//                       PopupMenuItem(
//                         child: Row(
//                           children: [
//                             Icon(Icons.person),
//                             SizedBox(width: 8),
//                             Text('Profile'),
//                           ],
//                         ),
//                         onTap: () {
//                           Navigator.pop(context);
//                           _openProfileTabs(
//                               context); // Close the PopupMenu and open the ProfileTabsScreen
//                         },
//                       ),
//                       // PopupMenuItem(
//                       //   child: Row(
//                       //     children: [
//                       //       Icon(Icons.logout),
//                       //       SizedBox(width: 8),
//                       //       Text('Logout'),
//                       //     ],
//                       //   ),
//                       //   onTap: () {
//                       //     Navigator.pop(context);
//                       //     _openProfileTabs(context);
//                       //     // Handle Logout action
//                       //   },
//                       // ),
//                       PopupMenuItem(
//                         child: Row(
//                           children: [
//                             Icon(Icons.logout),
//                             SizedBox(width: 8),
//                             Text('Logout'),
//                           ],
//                         ),
//                         onTap: () {
//                           Navigator.pop(context);
//                           _showLogoutDialog(context); // Show the logout dialog
//                         },
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             drawer: Drawer(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: <Widget>[
//                   DrawerHeader(
//                     decoration: BoxDecoration(
//                       color: Colors.teal,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Pro',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Profile'),
//                     onTap: () {
//                       Navigator.pop(context); // Close the drawer
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.settings),
//                     title: Text('Settings'),
//                     onTap: () {
//                       // Implement your settings logic here
//                       Navigator.pop(context); // Close the drawer
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.info),
//                     title: Text('About'),
//                     onTap: () {
//                       // Implement your settings logic here
//                       Navigator.pop(context); // Close the drawer
//                     },
//                   ),
//                 ],
//               ),
//             ),
//
//
//             body: _selectedIndex == 1
//                 ? Column(
//               children: [
//               ],
//             )
//
//             //     : Padding(
//             //   padding: const EdgeInsets.all(16.0),
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //       image: DecorationImage(
//             //         image: AssetImage('assets/img1.jpg'),
//             //         fit: BoxFit.cover,
//             //       ),
//             //     ),
//             //     child: Column(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       crossAxisAlignment: CrossAxisAlignment.stretch,
//             // //
//             // //       children: <Widget>[
//             // //         Expanded(
//             // //           child: ListView.builder(
//             // //             scrollDirection: Axis.vertical,
//             // //             itemCount: 5,
//             // //             itemBuilder: (BuildContext context, int index) {
//             // //               return Card(
//             // //                 elevation: 2,
//             // //                 margin: const EdgeInsets.symmetric(
//             // //                     vertical: 8, horizontal: 16),
//             // //                 child: ListTile(
//             // //                   title: Text('Vertical Item $index'),
//             // //                 ),
//             // //               );
//             // //             },
//             // //           ),
//             // //         ),
//             // //         const SizedBox(height: 50),
//             // //         Container(
//             // //           height: 100,
//             // //           child: ListView.builder(
//             // //             scrollDirection: Axis.horizontal,
//             // //             itemCount: 5,
//             // //             itemBuilder: (BuildContext context, int index) {
//             // //               return Container(
//             // //                 width: 100,
//             // //                 margin: const EdgeInsets.all(8),
//             // //                 decoration: BoxDecoration(
//             // //                   borderRadius: BorderRadius.circular(10),
//             // //                   color: Colors.teal,
//             // //                 ),
//             // //                 child: Center(
//             // //                   child: Text('Product $index',
//             // //                       style: TextStyle(color: Colors.white)),
//             // //                 ),
//             // //               );
//             // //             },
//             // //           ),
//             // //         ),
//             // //         const SizedBox(height: 50),
//             // //         const SizedBox(height: 20),
//             // //       ],
//             //       //       MusicList(songs: songs),
//             //      ),
//             //    ),
//             //  ),
//                 : MusicList(songs: songs),
//             bottomNavigationBar: BottomNavigationBar(
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//
//                 ),
//
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.assignment),
//                   label: 'Sign Up',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.search),
//                   label: 'Search',
//                 ),
//               ],
//               currentIndex: _selectedIndex,
//               selectedItemColor: Colors.teal[800],
//               unselectedItemColor: Colors.grey,
//               onTap: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                   if (_selectedIndex == 1) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             MyNewPage(user), // Provide the user object
//                       ),
//                     );
//                   }
//                   if (_selectedIndex == 2) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => signUp(),
//                       ),
//                     );
//                   }
//                 });
//               },
//             ),
//           );
//         }
//       }
//
//       class ProfileTabsScreen extends StatefulWidget {
//         @override
//         _ProfileTabsScreenState createState() => _ProfileTabsScreenState();
//       }
//
//       class _ProfileTabsScreenState extends State<ProfileTabsScreen>
//           with SingleTickerProviderStateMixin {
//         late TabController _tabController;
//
//         @override
//         void initState() {
//           super.initState();
//           _tabController = TabController(length: 3, vsync: this);
//         }
//
//         @override
//         void dispose() {
//           _tabController.dispose();
//           super.dispose();
//         }
//
//         @override
//         Widget build(BuildContext context) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Profile'),
//             ),
//             body: Column(
//               children: [
//                 TabBar(
//                   controller: _tabController,
//                   isScrollable: true,
//                   tabs: [
//                     Tab(text: 'Edit Profile'),
//                     Tab(text: 'Change Passsword'),
//                     Tab(text: 'Account Details'),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text('Content for Tab 1'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text('Content for Tab 2'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text('Content for Tab 3'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }
//             // body: _selectedIndex == 1
//             //     ? Column(
//             //   children: [
//             //
//             //   ],
//             // )
//       //           // : Padding(
//       //         padding: const EdgeInsets.all(16.0),
//       //         child: Container(
//       //           decoration: BoxDecoration(
//       //             image: DecorationImage(
//       //               image: AssetImage('assets/img1.jpg'),
//       //               fit: BoxFit.cover,
//       //             ),
//       //           ),
//       //           child: Column(
//       //             mainAxisAlignment: MainAxisAlignment.center,
//       //             crossAxisAlignment: CrossAxisAlignment.stretch,
//       //             children: <Widget>[
//       //               Expanded(
//       //                 child: ListView.builder(
//       //                   scrollDirection: Axis.vertical,
//       //                   itemCount: 5,
//       //                   itemBuilder: (BuildContext context, int index) {
//       //                     return Card(
//       //                       elevation: 2,
//       //                       margin: const EdgeInsets.symmetric(
//       //                           vertical: 8, horizontal: 16),
//       //                       child: ListTile(
//       //                         title: Text('Vertical Item $index'),
//       //                       ),
//       //                     );
//       //                   },
//       //                 ),
//       //               ),
//       //               const SizedBox(height: 50),
//       //               Container(
//       //                 height: 100,
//       //                 child: ListView.builder(
//       //                   scrollDirection: Axis.horizontal,
//       //                   itemCount: 5,
//       //                   itemBuilder: (BuildContext context, int index) {
//       //                     return Container(
//       //                       width: 100,
//       //                       margin: const EdgeInsets.all(8),
//       //                       decoration: BoxDecoration(
//       //                         borderRadius: BorderRadius.circular(10),
//       //                         color: Colors.teal,
//       //                       ),
//       //                       child: Center(
//       //                         child: Text('Product $index',
//       //                             style: TextStyle(color: Colors.white)),
//       //                       ),
//       //                     );
//       //                   },
//       //                 ),
//       //               ),
//       //               const SizedBox(height: 50),
//       //               const SizedBox(height: 20),
//       //             ],
//       //           ),
//       //         ),
//       //       ),
//       //       bottomNavigationBar: BottomNavigationBar(
//       //         items: const <BottomNavigationBarItem>[
//       //           BottomNavigationBarItem(
//       //             icon: Icon(Icons.home),
//       //             label: 'Home',
//       //           ),
//       //           BottomNavigationBarItem(
//       //             icon: Icon(Icons.person),
//       //             label: 'Profile',
//       //           ),
//       //           BottomNavigationBarItem(
//       //             icon: Icon(Icons.assignment),
//       //             label: 'Sign Up',
//       //           ),
//       //         ],
//       //         currentIndex: _selectedIndex,
//       //         selectedItemColor: Colors.amber[800],
//       //         onTap: (index) {
//       //           setState(() {
//       //             _selectedIndex = index;
//       //           });
//       //         },
//       //       ),
//       //     );
//       //   }
//       // }
//       //
//       // class ProfileTabsScreen extends StatefulWidget {
//       //   @override
//       //   _ProfileTabsScreenState createState() => _ProfileTabsScreenState();
//       // }
//       //
//       // class _ProfileTabsScreenState extends State<ProfileTabsScreen>
//       //     with SingleTickerProviderStateMixin {
//       //   late TabController _tabController;
//       //
//       //   @override
//       //   void initState() {
//       //     super.initState();
//       //     _tabController = TabController(length: 3, vsync: this);
//       //   }
//       //
//       //   @override
//       //   void dispose() {
//       //     _tabController.dispose();
//       //     super.dispose();
//       //   }
//       //
//       //   @override
//       //   Widget build(BuildContext context) {
//       //     return Scaffold(
//       //       appBar: AppBar(
//       //         title: Text('Profile'),
//       //       ),
//       //       body: Column(
//       //         children: [
//       //           TabBar(
//       //             controller: _tabController,
//       //             tabs: [
//       //               Tab(text: 'Edit Profile'),
//       //               Tab(text: 'Change Passsword'),
//       //               Tab(text: 'Account Details'),
//       //             ],
//       //           ),
//       //           Expanded(
//       //             child: TabBarView(
//       //               controller: _tabController,
//       //               children: [
//       //                 Padding(
//       //                   padding: const EdgeInsets.all(16.0),
//       //                   child: Text('Content for Tab 1'),
//       //                 ),
//       //                 Padding(
//       //                   padding: const EdgeInsets.all(16.0),
//       //                   child: Text('Content for Tab 2'),
//       //                 ),
//       //                 Padding(
//       //                   padding: const EdgeInsets.all(16.0),
//       //                   child: Text('Content for Tab 3'),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ],
//       //       ),
//       //     );
//       //   }
//       // }
