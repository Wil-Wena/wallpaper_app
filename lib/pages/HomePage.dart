// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wallpaper_app/api_stuff/Global.dart';
import 'package:wallpaper_app/api_stuff/photos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=20"),
        headers: {
          "Authorization":
              "563492ad6f91700001000001c207857fd80c482da4476e4b7bff4bbb"
        }).then((response) {
      Map parsedJson = jsonDecode(response.body);
      print(parsedJson);

      Global.photos = (parsedJson["photos"] as List)
          .map((e) => Photos.fromJson(e))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: Global.photos.length,

          //ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: (() {
                  Global.Index = index;
                  Navigator.of(context).pushNamed('/view');
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${Global.photos[index].src!.tiny}"))),
                ));
          }),
    );
  }
}
