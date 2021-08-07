// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_10/models/api_service.dart';
import 'package:project_10/models/category.dart';
import 'package:project_10/utils/routes.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  _WidgetCategoriesState createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  final TransformationController _controller = TransformationController();

  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  get onPressed => null;

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

   late APIservice apiService;

  @override
  void initState() {
    super.initState();
    apiService = new APIservice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     title: Text("Categories and offers") ,
     backgroundColor: Colors.transparent,
     shadowColor: Colors.yellow.shade800
      ),
        backgroundColor: Colors.blueGrey.shade50,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                InteractiveViewer(
                  minScale: 0.3,
                  maxScale: 10.0,
                  transformationController: _controller,
                  onInteractionEnd: (details) {
                    _controller.value = Matrix4.identity();
                  },
                  boundaryMargin: EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/4.jpeg",
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
                _categoriesList()
              ],
            ),
          ),
        )));
  }

  Widget _categoriesList() {
    return new FutureBuilder(
      future: apiService.getCategories(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Category>> model,
      ) {
        if (model.hasData) {
          return _buildCategoryList(model.data!);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget _buildCategoryList(List<Category> categories) {
  return Container(
    height: 300,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        var data = categories[index];

        return Column(
          children: [
            Card(
              color: Colors.grey.shade300,
              shape: CircleBorder(),
              shadowColor: Colors.yellow.shade800,
              elevation: 10,
              child: Container(
              margin:EdgeInsets.all(10),
              height:80,
              width:80,
              alignment: Alignment.center,
              child: Image.network(
                data.image,
             fit: BoxFit.contain,
              height:70,),
               ),
            ) ,

             Row(children: [
               Text(data.categoryName.toString())
             ],)
             ],
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
