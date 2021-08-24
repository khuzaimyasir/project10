// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:project_10/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // CollectionReference users = FirebaseFirestore.instance.collection('users');

//   final TransformationController _controller = TransformationController();

//   String name = "";
//   bool changebutton = false;

//   final _formkey = GlobalKey<FormState>();

//   get onPressed => null;

//   movetohome(BuildContext context) async {
//     if (_formkey.currentState.validate()) {
//       setState(() {
//         changebutton = true;
//       });
//       await Future.delayed(Duration(seconds: 1));
//       await Navigator.pushNamed(context, Myroutes.homeRoute);
//       setState(() {
//         changebutton = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blueGrey.shade50,
//         body: SafeArea(
//           child: SingleChildScrollView(
//               child: Form(
//             key: _formkey,
//             child: Column(children: [
//               InteractiveViewer(
//                 minScale: 0.3,
//                 maxScale: 10.0,
//                 transformationController: _controller,
//                 onInteractionEnd: (details) {
//                   _controller.value = Matrix4.identity();
//                 },
//                 boundaryMargin: EdgeInsets.all(5.0),
//                 child: Image.asset(
//                   "assets/4.jpeg",
//                   fit: BoxFit.cover,
//                   height: 450,
//                 ),
//               ),
//               Text(
//                 "Welcome $name",
//                 style: TextStyle(
//                   color: Colors.red,
//                   letterSpacing: .2,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(17.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                         decoration: InputDecoration(
//                           hintText: "Enter username",
//                           labelText: "username",
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "username cannot be empty ";
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {
//                           name = value;
//                           setState(() {});
//                         }),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: "enter password",
//                         labelText: "password",
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "address cannot be empty ";
//                         } else if (value.length < 6) {
//                           return "password length should be atleast 6";
//                         }

//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Material(
//                       color: context.theme.buttonColor,
//                       borderRadius:
//                           BorderRadius.circular(changebutton ? 50 : 8),
//                       child: InkWell(
//           //               onTap:  () async{
//           //                 await users.add({
//           //   'name': name,// John Doe
//           //   'age': 17, // Stokes and Sons
//           //   'notes': 'company',// 42
//           // })
//           // .then((value) => print("User Added"))
//           // .catchError((error) => print("Failed to add user: $error"));
  
//           //               } ,
//                         onTap: () => movetohome(context),
//                         child: AnimatedContainer(
//                           duration: Duration(seconds: 2),
//                           width: changebutton ? 60 : 150,
//                           height: 50,
//                           alignment: Alignment.center,
//                           child: changebutton
//                               ? Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                 )
//                               : Text(
//                                   "Login",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           )),
//         ));
//   }
// }
