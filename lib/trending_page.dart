import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

// import 'models/api_service.dart';

class TrendingPage extends StatefulWidget {
 

  @override
  _TrendingPageState createState() => _TrendingPageState();
}
  // late APIservice apiService;

  // @override
  // void initState() {
  //    super.initState();
  //   apiService = new APIservice();
   
  // }




class _TrendingPageState extends State<TrendingPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("help us grow and give feedback"),
        ),
        body: ListView(
          children: [
            // InteractiveViewer(
            //   minScale: 0.3,
            //   maxScale: 10.0,
            //   transformationController: _controller,
            //   onInteractionEnd: (details) {
            //     _controller.value = Matrix4.identity();
            //   },
            //   boundaryMargin: EdgeInsets.all(5.0),
            //   child: Image.asset(
            //     "assets/4.jpeg",
            //     fit: BoxFit.cover,
            //     height: 200,
            //   ),
            // ),
            horizontalProductSlider(),
          ],
          // the blue is children so widget should be inside the children
        ));
  }

  Widget horizontalProductSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trending",
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
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  Container(
                    child: Card(
                      elevation: 10,
                      child: Container(
                          height: 250.0,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                                "https://www.pakstyle.pk/img/products/l/p13686-embroidered-lawn-dress_1.jpg"),
                          )),
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
                ]);
              },
            )),
      ],
    );
  }
 // ignore: unused_element
 Widget _horizontallProductSlider(List<Category>categories) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Picked for you", style: TextStyle(color: Colors.red, fontSize: 33, )),
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
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    child: Card(
                      elevation: 10,
                       child: InkWell(
                         onTap: (){},
                         child: Container(
                           height: 250.0,
                           child : AspectRatio(aspectRatio: 1/1,
                           child: Image.network("https://www.pakstyle.pk/img/products/l/p13686-embroidered-lawn-dress_1.jpg"

                           ),)
                         ),
                       ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Chip(label :Text
                  ('-50%',style: TextStyle(
                    color: Colors.red
                  ),
                  )
                  )
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 30,
                   child: Text(
                     'RS1500',
                    style: TextStyle(
                   decoration: TextDecoration.lineThrough
                    ), )
                     ,),
               )

                ]
              );
            },
          )),
    ],
  );
}

}

