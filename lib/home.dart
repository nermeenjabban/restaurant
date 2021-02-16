import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/mydrawer.dart';
import 'package:restaurant/product_detailes.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> KeyDrawer=GlobalKey<ScaffoldState>();

  var arr_Cat=[{"cat_id":"1", "cat_name":"cat1", "cat_image":"assets/cat1.png"},
    {"cat_id":"2", "cat_name":"cat2", "cat_image":"assets/cat2.png"},
    {"cat_id":"3", "cat_name":"cat3", "cat_image":"assets/cat3.png"},
    {"cat_id":"4", "cat_name":"cat4", "cat_image":"assets/cat4.png"},
    {"cat_id":"5", "cat_name":"cat5", "cat_image":"assets/cat5.png"},
    {"cat_id":"6", "cat_name":"cat6", "cat_image":"assets/cat6.png"},
    {"cat_id":"7", "cat_name":"cat7", "cat_image":"assets/cat7.png"},
    {"cat_id":"8", "cat_name":"cat8", "cat_image":"assets/cat8.png"},
    {"cat_id":"9", "cat_name":"cat9", "cat_image":"assets/cat9.png"},
    {"cat_id":"10", "cat_name":"cat10", "cat_image":"assets/cat10.png"}

  ];

  var arr_Pro=[{"pro_id":"11","pro_name":"pro1","pro_description":"الوصف:مننمنمنمنبكمكنلامكرنلامبمنؤرمؤنرمؤرؤمخلانخبنخبنلامخنلا","pro_image":"assets/pro1.jpg"},
    {"pro_id":"12","pro_name":"pro2","pro_description":"الوصف:مننمنمنمنبكمكنلامكرنلامبمنؤرمؤنرمؤرؤمخلانخبنخبنلامخنلا","pro_image":"assets/pro2.jpg"},
    {"pro_id":"13","pro_name":"pro3","pro_description":"الوصف:مننمنمنمنبكمكنلامكرنلامبمنؤرمؤنرمؤرؤمخلانخبنخبنلامخنلا","pro_image":"assets/pro3.jpg"},
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: KeyDrawer,
        endDrawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(top:30),
                  padding: EdgeInsets.only(right:15),
                  child:Text("توصيل الطلب إلى ",style: TextStyle(color: Colors.grey,fontSize: 15),)),
              Row(
                children: [
                  Container(padding: EdgeInsets.only(right:15),
                      child:Text("طاولة الزبون ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                  IconButton(icon: Icon(Icons.arrow_drop_down,color: Colors.red,), onPressed: (){}),
                ],
              ),
              new Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        KeyDrawer.currentState.openEndDrawer();
                      },
                      child: new Icon(Icons.menu, color: Colors.red,size: 40,),
                    ),
                   Expanded(
                      child: new Container(
                        padding: EdgeInsets.only(right: 10),
                        decoration:BoxDecoration(
                          color:Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                           // new Icon(Icons.search),
                           child: new TextField(
                              decoration: InputDecoration(hintText: "بحث",
                                suffixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: ListView.builder(
                    itemCount: arr_Cat.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return SingleCategory(
                          cat_id:  arr_Cat[index]["cat_id"],
                          cat_image:  arr_Cat[index]["cat_image"],
                          cat_name:  arr_Cat[index]["cat_name"]);
                    }),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail()));

                },
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  child: ListView.builder(
                      itemCount: arr_Pro.length,
                      itemBuilder: (BuildContext context,int index){
                        return SingleProduct(
                            pro_id:  arr_Pro[index]["pro_id"],
                            pro_name:  arr_Pro[index]["pro_name"],
                            pro_description:  arr_Pro[index]["pro_description"],
                            pro_image:arr_Pro[index]["pro_image"]
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.red,
            selectedFontSize: 14,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                ),
                title: new Text("الحساب"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.restaurant_menu,
                  size: 30.0,
                ),
                title: new Text("العروض"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: 30.0,
                ),
                title: new Text("الطلب"),
              ),
            ]),
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 241, 191, 244),
            ),
            child: Image.asset(cat_image),),
          Text(cat_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget{
  final String pro_id;
  final String pro_name;
  final String pro_description;
  final String pro_image;
  SingleProduct({this.pro_id,this.pro_name,this.pro_description,this.pro_image});
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/4 ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(pro_image))
            ),
          ),
          new Text(pro_name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),),
          new Text(pro_description,style: TextStyle(color:Colors.grey,fontSize: 15 ),)
        ],
      ),
    ) ;

  }

}