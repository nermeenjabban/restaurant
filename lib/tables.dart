import 'package:flutter/material.dart';
import 'category.dart';

class Tables extends StatefulWidget {
  @override
  _TablesState createState() => _TablesState();
}

 class _TablesState extends State<Tables> {
  var arr_Table=[{"id":"1","statues":"busy","name":"مشغولة"},
                 {"id":"2","statues":"available","name":"متاحة"},
                 {"id":"3","statues":"reserved","name":"محجوزة"},
                 {"id":"4","statues":"available","name":"متاحة"},
                 {"id":"5","statues":"available","name":"متاحة"},
                 {"id":"6","statues":"reserved","name":"محجوزة"},
                 {"id":"7","statues":"busy","name":"مشغولة"},
                 {"id":"8","statues":"busy","name":"مشغولة"},];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("الطاولات",style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[100],
       // endDrawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: arr_Table.length,
              itemBuilder: (BuildContext context,int index){
               return SingleTable(
                    id:  arr_Table[index]["id"],
                    statues:  arr_Table[index]["statues"],
                     name:arr_Table[index]["name"] ,
               );
              }),
             ),
        );
  }
}

class SingleTable extends StatelessWidget {
  final String id, statues,name;
  SingleTable({this.id, this.statues,this.name});
  @override
  Widget build(BuildContext context) {
    bool result = Cheak(id,statues);
    return Row(
      children: <Widget>[
        new Expanded(
          child: InkWell(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    children: <Widget>[
                      new Icon(Icons.people, size: 80.0, color: Colors.green,),
                      new Text(name, style: TextStyle(fontSize: 18.0),)
                    ],
                  ),
                ),
            onTap: () {
             if (result==true){
                   showDialog(context: context, builder:(_) => AlertDialog(
                   title: Text("شكراً"), content:Text("لقد تم اختيار هذه الطاولة"),
                  actions: <Widget>[
                   FlatButton( child: Text("الانتقال إلى قائمة المأكولات"),onPressed: (){
                     Navigator.push(context,
                     MaterialPageRoute(
                    builder: (context) => new Category())
                  );
                  })
                  ],
                  ),
                  );
                  }
             else{
                    showDialog(context: context,
                    builder:(_) => AlertDialog(
                    title: Text("عذراً"),
                    content:Text("لايمكن حجز هذه الطاولة، الرجاء اختيار طاولة أخرى"),
                    actions: <Widget>[
                    FlatButton( child: Text("اختيار طاولة أخرى"),onPressed: (){
                    Navigator.of(context).pop();
                    })
                    ],
                    ),
    );
    }
    },
          )
        ),
      ],
    );
  }

  bool Cheak(String id, String statues) {
    if (statues == "available")
      return true;
    else {
      return false;
    }
  }
}

