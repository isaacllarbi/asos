import 'package:asos/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState>   scaffoldKey;

  const HomeDrawer({Key key, this.scaffoldKey}) : super(key: key);
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  var _darkModeEnabled = false;
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
    return _buildDrawer();
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: drawerBgColor,
          child: Column(
            children: [
              buildHeader(),
              buildExtras([
                buildItem(icon: Icons.home, text: 'HOME'),
                buildItem(icon: Icons.shopping_bag_outlined, text: 'BAG'),
                buildItem(icon: Icons.favorite_border, text: 'SAVED ITEMS'),
                buildItem(
                    icon: Icons.person_add_alt_1_outlined, text: 'MY ACCOUNT'),
                buildItem(icon: Icons.settings, text: 'APP SETTINGS'),
                buildItem(icon: Icons.info_outline, text: 'HELP & FAQS'),
                // buildDivider(),
                buildItem(
                    icon: Icons.wb_sunny_outlined,
                    text: 'DARK MODE',
                    trailing: Switch(
                        value: _darkModeEnabled, onChanged: _toggleDarkMode)),
              ]),
              // buildDivider(),
              buildExtras([
                buildTitle(text: 'MORE ASOS'),
                buildDivider(),
                buildSubtext(text: 'Gift Vouchers'),
                buildSubtext(text: 'Marketplace'),
              ]),
              buildExtras([
                buildTitle(text: 'TELL US WHAT YOU THINK'),
                buildDivider(),
                buildSubtext(text: 'Help improve the app'),
                buildSubtext(text: 'Rate the app'),
              ]),
              buildExtras([buildAppVersion()]),
            ],
          ),
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
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.black54),
        child: Column(
          children: [logoText, infoText, signinButton],
        ),
      ),
    );
  }

  buildItem({
    IconData icon,
    String text,
    Widget trailing = const SizedBox.shrink(),
  }) {
    var style = TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);

    var leading = Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
      child: Icon(icon, color: Colors.black, size: 26),
    );

    var title = Expanded(
      child: Column(
        children: [
          Text(text, style: style),
          Divider(color: Colors.black, thickness: 0.1, height: 22)
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [leading, title, trailing],
      ),
    );
  }

  buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Divider(
        color: Colors.black26,
        thickness: 0.4,
      ),
    );
  }

  buildExtras(List<Widget> children) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  buildTitle({String text}) {
    var textStyle = TextStyle(
        color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold);
    return Container(
      padding: EdgeInsets.fromLTRB(12, 14, 12, 4),
      width: double.infinity,
      child: Text(text, style: textStyle, textAlign: TextAlign.left),
    );
  }

  buildSubtext({String text}) {
    var textStyle =
        TextStyle(color: Colors.black87.withOpacity(0.5), fontSize: 14);
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      width: double.infinity,
      child: Text(text, style: textStyle, textAlign: TextAlign.left),
    );
  }

  buildAppVersion() {
    var textStyle =
        TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 14);
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Text('App Version 4.33.0 (9090)',
          style: textStyle, textAlign: TextAlign.left),
    );
  }
}
