
import 'package:flutter/material.dart';
import 'package:project_10/trending_page.dart';
import 'package:project_10/utils/routes.dart';
import 'package:project_10/widgets/widget_home_categories.dart';
import 'package:velocity_x/velocity_x.dart';


import 'contact_page.dart';
import 'core/store.dart';
import 'home_detail_page.dart';
import 'home_page.dart';
import 'login_page.dart';

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.homeRoute,
      routes: {
        Myroutes.homeRoute: (context) => MyHomePage(title: '',),
        "/": (context) => LoginPage(),
        Myroutes.loginRoute: (context) => LoginPage(),
        // Myroutes.cartRoute: (context) => CartPage(),
        // Myroutes.carouselExampleRoute: (context) => CarouselExample(),
        Myroutes.contactRoute: (context) => ContactPage(),
         Myroutes.homeDetailsRoute: (context) => HomeDetailPage(),
       Myroutes.trendingRoute: (context) => TrendingPage(),
        Myroutes.widgetHomeCategories: (context) => WidgetCategories(),
      },
    );
  }
}
