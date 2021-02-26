import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/product.dart';

class Category extends StatefulWidget{
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var arr_Cat=[{"cat_id":"1", "cat_name":"مأكولات بحرية", "cat_image":"assets/cat1.png"},
    {"cat_id":"2", "cat_name":"دجاج مشوي ", "cat_image":"assets/cat2.png"},
    {"cat_id":"3", "cat_name":"دجاج مقلي","cat_image":"assets/cat3.png"},
    {"cat_id":"4", "cat_name":"مقبلات", "cat_image":"assets/cat4.png"},
    {"cat_id":"5", "cat_name":"العصائر", "cat_image":"assets/cat5.png"},
    {"cat_id":"6", "cat_name":"الحلويات", "cat_image":"assets/cat6.png"},
    {"cat_id":"7", "cat_name":"مشاوي", "cat_image":"assets/cat7.png"},
    {"cat_id":"8", "cat_name":"cat8", "cat_image":"assets/cat8.png"},
    {"cat_id":"9", "cat_name":"cat9", "cat_image":"assets/cat9.png"},
    {"cat_id":"10", "cat_name":"cat10", "cat_image":"assets/cat10.png"}

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قائمة المأكولات",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: InkWell(
         /* child: Icon(
            Icons.arrow_back_ios,color: Colors.black,),*/
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top:10),
        child: ListView.builder(
            itemCount: arr_Cat.length,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int index){
              return SingleCategory(
                  cat_id:  arr_Cat[index]["cat_id"],
                  cat_image:  arr_Cat[index]["cat_image"],
                  cat_name:  arr_Cat[index]["cat_name"]);
            }),
      ),
    );
  }
}


class SingleCategory extends StatelessWidget{
  final String cat_id;
  final String cat_name;
  final String cat_image;
  SingleCategory({this.cat_id, this.cat_name, this.cat_image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
         InkWell(
           onTap: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => new Product(Cat_id: cat_id,Cat_name: cat_name,))
             );
           },
            child: ListTile(
                leading:Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 241, 191, 244),
                  ),
                  child: Image.asset(cat_image),),
               title: Text(cat_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}