

import 'package:flutter/material.dart';
import 'package:project_10/models/api_service.dart';
import 'package:project_10/models/category.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({ Key? key }) : super(key: key);

  @override
  _WidgetCategoriesState createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
 
     late APIservice apiService;

  @override
  void initState() {
     super.initState();
    apiService = new APIservice();
   
  }



  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white,
      child: Column(
      children: [
        Row(
          children: [
            Padding(padding:EdgeInsets.only(left: 15 , top:10),
            child: Text("all categories"),)
            
          ],
        ),
        _categoriesList()
      ],
   
    ),
      
      
    );
  }
Widget _categoriesList(){
return new FutureBuilder(
 future: apiService.getCategories(),
 builder:(
   BuildContext context,
   AsyncSnapshot<List<Category>> model,
 ) {
   if(model.hasData){
     return _buildCategoryList(model.data!);
   }
   return Center(child: CircularProgressIndicator(),
   );
   },
);
 }
}


Widget _buildCategoryList(List<Category>categories){
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
            itemCount: categories.length,
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



