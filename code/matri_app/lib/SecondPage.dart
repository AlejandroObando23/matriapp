import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("Second Route"),),
   body: Center(
    child: ElevatedButton(child: Text("To home"),
    onPressed: (){
       Navigator.pop(context);
    }),
   ),
   );
}

}