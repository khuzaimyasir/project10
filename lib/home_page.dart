import 'package:flutter/material.dart';
import 'package:project_10/utils/routes.dart';
import 'package:project_10/widgets/drawer.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
// import 'package:velocity_x/velocity_x.dart';

// import 'home_detail_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'shopping app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://officialguidance.com",
        consumerKey: "ck_48cb95b7b48caab26b53c9211eb2dd4ac1f74534",
        consumerSecret: "cs_aa2b16888cf01d202342c4b3c5f9594844a393ff");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("kys"),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: _getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // Create a list of products
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  Container(
                    child: Card(
                      elevation: 10,
                      child: InkWell(
                        onTap: ()=>Navigator.pushNamed(context, Myroutes.homeDetailsRoute),
                        child: Container(
                            height: 200.0,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.network(
                                  snapshot.data[index]["images"][0]["src"]),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 15,
                      left: 15,
                      child: Chip(
                          label: Text(
                        '-40%',
                        style: TextStyle(color: Colors.red),
                      ))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        ("Buy now for \Rs " + snapshot.data[index]["price"]),
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  )
                ]);
              },
            );
          }

          // Show a circular progress indicator while loading products
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget horizontallProductSlider() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Picked for you",
              style: TextStyle(
                color: Colors.red,
                fontSize: 33,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "view more",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: [
                Container(
                  child: Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 250.0,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                                "https://www.pakstyle.pk/img/products/l/p13686-embroidered-lawn-dress_1.jpg"),
                          )),
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    left: 15,
                    child: Chip(
                        label: Text(
                      '-50%',
                      style: TextStyle(color: Colors.red),
                    ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      'RS1500',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ),
                )
              ]);
            },
          )),
    ],
  );
}
