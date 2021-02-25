import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/product_detailes.dart';

class Product extends StatefulWidget{
  final String Cat_id;
  final String Cat_name;
  Product({this.Cat_id,this.Cat_name});
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var arr_SubCat=[{"subcat_id":"1", "subcat_name":"سمك مشوي", "subcat_image":"assets/cat1.png","Cat_name":"مأكولات بحرية"},
    {"subcat_id":"2", "subcat_name":"غالمبري ", "subcat_image":"assets/cat2.png","Cat_name":"مأكولات بحرية"},
    {"subcat_id":"3", "subcat_name":"سمك فيليه","subcat_image":"assets/cat3.png","Cat_name":"مأكولات بحرية"},
    {"subcat_id":"4", "subcat_name":"سمك مشوي", "subcat_image":"assets/cat4.png","Cat_name":""},
    {"subcat_id":"5", "subcat_name":"سمك", "subcat_image":"assets/cat5.png","Cat_name":""},
    {"subcat_id":"6", "subcat_name":"سمك", "subcat_image":"assets/cat6.png","Cat_name":""},
    {"subcat_id":"7", "subcat_name":"سمك", "subcat_image":"assets/cat7.png","Cat_name":""},
    {"subcat_id":"8", "subcat_name":"سمك", "subcat_image":"assets/cat8.png","Cat_name":""},
    {"subcat_id":"9", "subcat_name":"سمك", "subcat_image":"assets/cat9.png","Cat_name":""},
    {"subcat_id":"10", "subcat_name":"سمك", "subcat_image":"assets/cat10.png","Cat_name":""}

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Cat_name,
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top:10),
        child: ListView.builder(
            itemCount: arr_SubCat.length,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int index){
            //  if(widget.Cat_name==arr_SubCat[index]["category"]){
             return SingleProduct(
                  subsubcat_id:  arr_SubCat[index]["subcat_id"],
                  subsubcat_image:  arr_SubCat[index]["subcat_image"],
                  subsubcat_name:  arr_SubCat[index]["subcat_name"],
                ctegory: arr_SubCat[index]["category"],

                );
   // }
            }),
      ),
    );
  }
}


class SingleProduct extends StatelessWidget{
  final String subsubcat_id;
  final String subsubcat_name;
  final String subsubcat_image;
  final String ctegory;

  SingleProduct({this.subsubcat_id, this.subsubcat_name, this.subsubcat_image,this.ctegory});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: (){
             /*  Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => new ProductDetail()));*/
            },
            child: ListTile(
              leading:Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
                child: Image.asset(subsubcat_image),),
              title: Text(subsubcat_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}