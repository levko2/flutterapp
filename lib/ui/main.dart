import 'package:flutter/material.dart';
import 'package:flutterapp/ui/home.dart';
import 'package:flutterapp/ui/news.dart';
import 'package:flutterapp/ui/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  final List<Widget> _children = [HomeScreen(), NewsScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallpaper), title: Text("News")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile"))
        ],
        onTap: onTabSelect,
        currentIndex: _selectedTab,
      ),
    );
  }

  onTabSelect(int tab) {
    setState(() {
      this._selectedTab = tab;
    });
  }
}
