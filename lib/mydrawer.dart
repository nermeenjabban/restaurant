import 'package:flutter/material.dart';

import 'category.dart';

class MyDrawer extends StatefulWidget{
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
   return Container(
     child:Drawer(
       child: Directionality(
         textDirection: TextDirection.rtl,
         child: ListView(
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(right: 10.0, left: 10.0),
               child: Column(
                 children: <Widget>[
                   InkWell(
                     onTap: () {},
                     child: ListTile(
                       title: Text(
                         "الصفحة الرئيسية",
                         style: TextStyle(color: Colors.black, fontSize: 20.0),
                       ),
                       leading: Icon(
                         Icons.home,
                         color: Colors.red,
                       ),
                       trailing: Icon(
                         Icons.arrow_forward_ios,
                         color: Colors.black,
                         size: 18.0,
                       ),
                     ),
                   ),
                   Divider(
                     color: Colors.grey[500],
                   ),
                 ],
               ),
             ),


             Container(
               padding: EdgeInsets.only(right: 10.0, left: 10.0),
               child: Column(
                 children: <Widget>[
                   InkWell(
                     onTap: () {
                      Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => new Category()));
                     },
                     child: ListTile(
                       title: Text(
                         "قائمة المأكولات",
                         style: TextStyle(color: Colors.black, fontSize: 20.0),
                       ),
                       leading: Icon(
                         Icons.restaurant,
                         color: Colors.red,
                       ),
                       trailing: Icon(
                         Icons.arrow_forward_ios,
                         color: Colors.black,
                         size: 18.0,
                       ),
                     ),
                   ),
                   Divider(
                     color: Colors.grey[500],
                   ),
                 ],
               ),
             ),


             Container(
               padding: EdgeInsets.only(right: 10.0, left: 10.0),
               child: Column(
                 children: <Widget>[
                   InkWell(
                     onTap: () {
                      /* Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => new Tracking()));*/
                     },
                     child: ListTile(
                       title: Text(
                         "تتبع الطلبية",
                         style: TextStyle(color: Colors.black, fontSize: 20.0),
                       ),
                       leading: Icon(
                         Icons.drive_eta,
                         color: Colors.red,
                       ),
                       trailing: Icon(
                         Icons.arrow_forward_ios,
                         color: Colors.black,
                         size: 18.0,
                       ),
                     ),
                   ),
                   Divider(
                     color: Colors.grey[500],
                   ),
                 ],
               ),
             ),

           ],
         ),
       ),
     )
   );
  }
}