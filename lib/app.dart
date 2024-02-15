import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/bloc/bloc_home.dart';
import 'package:flutter_state/provider/provider_home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter State Test"),),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  BlocHome()));
            }, child: Text("Bloc")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  ProviderHome()));
            }, child: Text("Provider")),
            ElevatedButton(onPressed: (){}, child: Text("GetX")),
            ElevatedButton(onPressed: (){}, child: Text("RiverPod"))
          ],
        
        ),
      )
    );
  }


}