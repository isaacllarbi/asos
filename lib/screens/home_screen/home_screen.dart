import 'package:asos/screens/home_screen/appbar.dart';
import 'package:asos/screens/home_screen/drawer.dart';
import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _controller;
  var _userGender = 'WOMEN';
  var _genders = ['WOMEN', 'MEN'];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: _buildAppBar(context),
        appBar: MyAppBar(controller: _controller, scaffoldKey: _scaffoldKey),
        drawer: HomeDrawer(),
        body: _body(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    //Menu button
    var leadingIcon = Icon(Icons.menu, color: Colors.black);
    var drawerBtn = IconButton(icon: leadingIcon, onPressed: _openDrawer);

    //Gender dropdown
    var titleTextStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16);
    var titleText = Text(_userGender, style: titleTextStyle);
    var downIcon = Icon(Icons.arrow_drop_down, color: Colors.black);

    var appbarTitle =
        Row(mainAxisSize: MainAxisSize.min, children: [titleText, downIcon]);
    var popup = PopupMenuButton(
      child: appbarTitle,
      itemBuilder: (context) {
        return _genders.map((gender) {
          bool selected = _userGender == gender;
          var style = TextStyle(
              fontSize: 12,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal);
          var popupText = Text(gender, style: style);
          return PopupMenuItem(value: gender, child: popupText);
        }).toList();
      },
      onSelected: (gender) {
        print('$gender clicked');
        setState(() {
          _userGender = gender;
        });
      },
    );

    //Appbar action icons
    var favIcon = Icon(Icons.favorite_border_outlined, color: Colors.black);
    var searchIcon = Icon(Icons.search, color: Colors.black);
    var fav = IconButton(onPressed: () {}, icon: favIcon);
    var search = IconButton(onPressed: () {}, icon: searchIcon);

    var tabTextStyle = TextStyle(color: Colors.black);
    var homeTab = Tab(child: Text('HOME', style: tabTextStyle));
    var catTab = Tab(child: Text('CATEGORIES', style: tabTextStyle));
    var newTab = Tab(child: Text('NEW IN', style: tabTextStyle));
    var tabBar =
        TabBar(controller: _controller, tabs: [homeTab, catTab, newTab]);

    return AppBar(
      leading: drawerBtn,
      title: popup,
      actions: [fav, search],
      backgroundColor: Colors.white,
      bottom: tabBar,
    );
  }

  _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  _body() {
    return TabBarView(
      controller: _controller,
      children: [
        Center(child: Text('HOME')),
        Center(child: Text('CATEGORIES')),
        Center(child: Text('NEW IN')),
      ],
    );
  }
}
