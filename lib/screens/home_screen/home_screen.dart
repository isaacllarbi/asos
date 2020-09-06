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
  var _genderList = ['MEN', 'WOMEN'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(context),
        drawer: HomeDrawer(),
      ),
    );
  }

  _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  AppBar _buildAppBar(BuildContext context) {
    var titleTextStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16);
    var titleText = Text(_userGender, style: titleTextStyle);
    var downIcon = Icon(Icons.arrow_drop_down, color: Colors.black);
    var leadingIcon = Icon(Icons.menu, color: Colors.black);

    var appbarTitle =
        Row(mainAxisSize: MainAxisSize.min, children: [titleText, downIcon]);
    return AppBar(
      leading: IconButton(icon: leadingIcon, onPressed: _openDrawer),
      title: PopupMenuButton(
        child: appbarTitle,
        itemBuilder: (BuildContext context) {
          return _genderList.map((gender) => buildPopupItem(gender)).toList();
        },
        onSelected: (gender) {},
      ),
      actions: buildActions(context),
      backgroundColor: Colors.white,
    );
  }

  PopupMenuItem buildPopupItem(String text) {
    var popupText = Text(text, style: TextStyle(fontSize: 12));
    return PopupMenuItem(value: 'text', child: popupText);
  }

  List<Widget> buildActions(BuildContext context) {
    var favIcon = Icon(Icons.favorite_border_outlined, color: Colors.black);
    var searchIcon = Icon(Icons.search, color: Colors.black);
    return [
      IconButton(onPressed: () {}, icon: favIcon),
      IconButton(onPressed: () {}, icon: searchIcon),
    ];
  }
}
