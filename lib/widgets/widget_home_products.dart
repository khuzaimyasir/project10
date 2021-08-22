


import 'package:flutter/material.dart';
import 'package:project_10/models/api_service.dart';
import 'package:project_10/models/product.dart';
// import 'package:project_10/models/product.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.labelName, this.tagId}) : super(key: key);

  final String labelName;
  final String tagId;

  @override
  _WidgetHomeProductsState createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  APIservice apiService;

  @override
  void initState() {
    apiService = new APIservice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("offers"),
          backgroundColor: Colors.grey.shade500,
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
                    // key: _formkey,
                    child: Column(children: <Widget>[
          Row(children: [
            Padding(
                padding: EdgeInsets.only(left: 16, top: 4), child: Text("hshs"))
          ]),
//           InteractiveViewer(
//             minScale: 0.3,
//             maxScale: 10.0,
//             // transformationController: _controller,
//             onInteractionEnd: (details) {
//               // _controller.value = Matrix4.identity();
//             },
//             boundaryMargin: EdgeInsets.all(5.0),
//             child: Image.asset(
//               "assets/4.jpeg",
//               fit: BoxFit.cover,
//               height: 250,
//             ),
//           ),
// // widget
          _productsList(),
        ])))));
  }

  Widget _productsList() {
    return new FutureBuilder(
      future: apiService.getProducts(widget.tagId ),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Product>> model,
      ) {
        if(model.hasError) {
return Text("Somtnh went wrong");
}
else if(model.hasData) {
return _buildList(model.data);
}
else {
return CircularProgressIndicator();
}
      },
      // {
        
        // if (model.hasData) {
          // return Text(widget.tagId);
          // return _buildList(model.data);
        // }
        // return Center(
        //   child: Text(' not loading'),
        // );
      // },
    );
  }
}

Widget _buildList(List<Product> items) {
  return Container(
    height: 300,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var data = items[index];

        return Column(children: [
          Card(
            color: Colors.grey.shade300,
            shape: CircleBorder(),
            shadowColor: Colors.yellow.shade800,
            elevation: 10,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 80,
              width: 80,
              alignment: Alignment.center,
              child: Image.network(
                data.images[0].src,
                fit: BoxFit.contain,
                height: 70,
              ),
            ),
          ),
          Row(children: [Text('Rs${data.salePrice}')])
        ]
            // leading: CircleAvatar(
            //   child:
            //       Image.network(categories.data[index]["images"][0]["src"]),
            // ),
            // title: Text(categories.data[index]["name"]),
            // subtitle:
            //     Text(),
            );
      },
    ),
  );
}
