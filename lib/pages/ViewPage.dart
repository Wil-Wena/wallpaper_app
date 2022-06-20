import 'package:flutter/material.dart';
import 'package:wallpaper_app/api_stuff/Global.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  PageController pageController = PageController(initialPage: Global.Index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: Global.photos.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage("${Global.photos[index].src!.large2x}"),
            fit: BoxFit.cover,
          )),
          //child: Text('Welcome')
        ),
      ),
    );
  }
}
