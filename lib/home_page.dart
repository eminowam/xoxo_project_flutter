import 'package:flutter/material.dart';
import 'package:xoxo/config/color/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XOXO'),
        centerTitle: true,
        backgroundColor: AppColor.mainAppColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3
                    ),
                    itemBuilder: (BuildContext context,int index){

                    }),
              ))
        ],
      ),
    );
  }
}
