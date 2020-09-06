import 'package:flutter/material.dart';

class AsosHomeScreen extends StatefulWidget {
  @override
  _AsosHomeScreenState createState() => _AsosHomeScreenState();
}

class _AsosHomeScreenState extends State<AsosHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _darkModeEnabled = false;

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  _handleSignIn() {
    print('Sign in button clicked');
  }

  _toggleDarkMode(bool) {
    //Implement toggle darkmode
    print('Toggle darkmode');
    setState(() {
      _darkModeEnabled = !_darkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(),
        drawer: _buildDrawer(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      
      leading: IconButton(icon: Icon(Icons.menu), onPressed: _openDrawer),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildItem(icon: Icons.home, text: 'HOME'),
            buildItem(icon: Icons.shopping_bag_outlined, text: 'BAG'),
            buildItem(icon: Icons.favorite_border, text: 'SAVED ITEMS'),
            buildItem(
                icon: Icons.person_add_alt_1_outlined, text: 'MY ACCOUNT'),
            buildItem(icon: Icons.settings, text: 'APP SETTINGS'),
            buildItem(icon: Icons.info_outline, text: 'HELP & FAQS'),
            buildDivider(),
            buildItem(
              icon: Icons.wb_sunny_outlined,
              text: 'DARK MODE',
              trailing:
                  Switch(value: _darkModeEnabled, onChanged: _toggleDarkMode),
            ),
            buildDivider(),
            buildTitle(text: 'MORE ASOS'),
            buildSubtext(text: 'Gift Vouchers'),
            buildSubtext(text: 'Marketplace'),
            buildDivider(),
            buildTitle(text: 'TELL US WHAT YOU THINK'),
            buildSubtext(text: 'Help improve the app'),
            buildSubtext(text: 'Rate the app'),
            buildDivider(),
            buildAppVersion(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    Widget logoText = Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'asos',
        style: TextStyle(
          color: Colors.white,
          fontSize: 43,
          letterSpacing: -5,
          fontWeight: FontWeight.w800,
        ),
      ),
    );

    Widget infoText = Text(
      'Save, shop and view orders',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );

    Widget signinButton = FlatButton(
      onPressed: _handleSignIn,
      child: Text(
        'Sign in >',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );

    return Container(
      width: double.infinity,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Colors.black54),
        child: Column(
          children: [logoText, infoText, signinButton],
        ),
      ),
    );
  }

  buildItem({IconData icon, String text, Widget trailing}) {
    var style = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(text, style: style),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Divider(),
      ),
      dense: false,
      trailing: trailing,
    );
  }

  buildDivider() {
    return Container(height: 10, color: Colors.grey.withOpacity(0.3));
  }

  buildTitle({String text}) {
    var textStyle = TextStyle(
      color: Colors.grey.withOpacity(0.8),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      child: Text(text, style: textStyle, textAlign: TextAlign.left),
    );
  }

  buildSubtext({String text}) {
    var textStyle = TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontSize: 14,
    );

    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      child: Text(text, style: textStyle, textAlign: TextAlign.left),
    );
  }

  buildAppVersion() {
    var textStyle = TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 14,
    );
    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      child: Text('App Version 4.33.0 (9090)',
          style: textStyle, textAlign: TextAlign.left),
    );
  }
}
