import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MY Group")),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            //ค่าที่ต้องการเพิ่ม
            context: context,
            color: Colors.white,
            blocktext: "นางแพรวพรรณ แก้วก่ำ",
            imgPath: "lib/asset/images/PH01.jpg",
            nickname: "แพรว",
          ),
          Card(
            context: context,
            color: Colors.red,
            blocktext: "นายจตุรวิธ มั่งกูล	",
            imgPath: "lib/asset/images/p03.jpg",
            nickname: "ภูผา",
          ),
          Card(
            context: context,
            color: Colors.blue,
            blocktext: "นายภัทรพล ลิมปนาคม",
            imgPath: "lib/asset/images/P02.jpg",
            nickname: "พล",
          ),
        ],
      ),
    );
  }

  Widget Card({
    required BuildContext context,
    required Color color,
    required String blocktext,
    required String imgPath,
    required String nickname,
  }) {
    return Container(
      width: 250,
      color: Colors.black12,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        name: blocktext,
                        imPath: imgPath,
                        Nickname: nickname,
                      )));
        },
        child: Column(
          children: [
            CircleAvatar(radius: 120, backgroundImage: NetworkImage(imgPath)),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                color: color,
                child: Text(blocktext)),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({
    required this.name,
    required this.Nickname,
    required this.imPath,
  });
  String name;
  String Nickname;
  String imPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10.0)),
              CircleAvatar(
                backgroundImage: NetworkImage(imPath),
                radius: 100,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(name),
              Text(Nickname),
            ],
          ),
        ));
  }
}
