import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFinal extends StatefulWidget {
  const HomeFinal({Key? key}) : super(key: key);

  @override
  _HomeFinalState createState() => _HomeFinalState();
}

class _HomeFinalState extends State<HomeFinal> {
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
  // ignore: override_on_non_overriding_member
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(
      //     child: Center(
      //   child: Text("hii Iam Drawer"),
      // )),
      body: Builder(
        builder: (context) => Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.05, (size.width * 0.01), 0, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shadowColor: Colors.black,
                        elevation: 5,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!
                            .openDrawer(); // <-- Opens drawer.
                      },
                      child: Icon(
                        Icons.menu,
                        size: 40,
                      ),
                    ))
              ],
            ),
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
