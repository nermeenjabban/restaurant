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
  var arr_product=[{"product_id":"1", "product_name":"سمك مشوي", "product_image":"assets/cat1.png","Cat_name":"دجاج مقلي"},
    {"product_id":"2", "product_name":"غالمبري ", "product_image":"assets/cat2.png","Cat_name":"مأكولات بحرية"},
    {"product_id":"3", "product_name":"سمك فيليه","product_image":"assets/cat3.png","Cat_name":"مأكولات بحرية"},
    {"product_id":"4", "product_name":"سمك مشوي", "product_image":"assets/cat4.png","Cat_name":"مأكولات بحرية"},
    {"product_id":"5", "product_name":"شيش1", "product_image":"assets/cat5.png","Cat_name":"دجاج مشوي"},
    {"product_id":"6", "product_name":"شيش2", "product_image":"assets/cat6.png","Cat_name":"دجاج مشوي"},
    {"product_id":"7", "product_name":"سكالوب", "product_image":"assets/cat7.png","Cat_name":"دجاج مقلي"},
    {"product_id":"8", "product_name":"كريسبي", "product_image":"assets/cat8.png","Cat_name":"دجاج مقلي"},
    {"product_id":"9", "product_name":"سلطة", "product_image":"assets/cat9.png","Cat_name":"مقبلات"},
    {"product_id":"10", "product_name":"متبل", "product_image":"assets/cat10.png","Cat_name":"مقبلات"}
  ];

   GetCount(){
    int count;
    for(int i=0;i<arr_product.length;i++) {
      if (widget.Cat_name == arr_product[i]["Cat_name"]) {
        //print(widget.Cat_name);
        return SingleProduct
          (product_id: arr_product[i]["product_id"],
            product_name: arr_product[i]["product_name"],
            product_image: arr_product[i]["product_image"],
            ctegory: arr_product[i]["Cat_name"]);
      }
    }
  }


  //List<SingleProduct> target= GetByCatname();
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
        //    itemCount: arr_product.length,
         // itemCount: GetCount(),
            itemBuilder: (BuildContext context,int index){
            //GetByCatname();
          /* return SingleProduct(
                  product_id:  arr_product[index]["product_id"],
                  product_image:  arr_product[index]["product_image"],
                  product_name:  arr_product[index]["product_name"],
                  ctegory: arr_product[index]["category"],
                );*/
              return GetCount();


            }),
      ),
    );
  }
}


class SingleProduct extends StatelessWidget{
  final String product_id;
  final String product_name;
  final String product_image;
  final String ctegory;

  SingleProduct({this.product_id, this.product_name, this.product_image,this.ctegory});
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
                child: Image.asset(product_image),),
              title: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}