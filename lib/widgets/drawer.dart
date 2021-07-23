import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_10/utils/routes.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://lh3.googleusercontent.com/qRQPjHrhRVIs-xnfNSyiPXOH2vH97ylMacgbTKebqJtRfNH3LlYo8pN-5igsLDWUH62tGl5zNpTsl5xd8SprzGmXoCEmWFOi2-2cQVGS-r3PaRXHt62DmJHq-jrYX0UQvWZ9BA=s800-c";
    return Drawer(
      child: Container(
        color: Colors.red.shade900,
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.red.shade900),
                  accountName: Text("khuzaimyasir"),
                  accountEmail: Text("khuzaimyasir123@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ))),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "influencer",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.trendingRoute);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.news,
              color: Colors.white,
            ),
            title: Text(
              "Trending",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.trendingRoute);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.music_albums,
              color: Colors.white,
            ),
            title: Text(
              "popular",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.cartRoute);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
            ),
            title: Text(
              " for admins ",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.cartRoute);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              " home ",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.widgetHomeCategories);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "contact us",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: () {
                Navigator.pushNamed(context, Myroutes.contactRoute);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
