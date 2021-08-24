// import 'package:project_10/models/catalog.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../home_detail_page.dart';
// // import 'add_to_cart.dart';
// // import 'catalog_image.dart';

// class CatalogList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: false,
//       itemCount: CatalogModel.items.length,
//       itemBuilder: (context, index) {Badge(
//       badgeContent: Text('333333'),
//       child: Icon(Icons.settings),
//     );
//         final catalog = CatalogModel.items[index];
//         return InkWell(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeDetailPage(catalog: catalog),
              
//             ),
//           ),
//           child: CatalogItem(catalog: catalog),
//         );
    
 
//       },
      
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({Key key, @required this.catalog})
//       : assert(catalog != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Hero(
//               tag: Key(catalog.id.toString()),
//               child: CatalogImage(
//                 image: catalog.image,
//               ),
//             ),
//             Expanded(
//                 child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 catalog.name.text.lg.color(context.accentColor).bold.make(),
//                 catalog.desc.text.textStyle(context.captionStyle).make(),
//                 10.heightBox,
//                 ButtonBar(
//                   alignment: MainAxisAlignment.spaceBetween,
//                   buttonPadding: EdgeInsets.zero,
//                   children: [
//                     "\Rs${catalog.price}".text.bold.xl.make(),
//                     // _addtocart is a widget made
//                     AddToCart(catalog: catalog)
//                   ],
//                 ).pOnly(right: 8.0)
//               ],
//             ))
//           ],
//         ),
//       ),
//     ).color(context.cardColor).rounded.square(150).make().py16();
//   }
// }