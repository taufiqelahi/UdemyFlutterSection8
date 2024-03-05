import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});
  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: meal.isNotEmpty
            ? ListView(
                children: meal
                    .map((e) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {},
                            child: Stack(
                              children: [
                                FadeInImage(
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: NetworkImage(e.imageUrl),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 36),
                                    color: Colors.black54,
                                    child: Column(
                                      children: [
                                        Text(
                                          e.title,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              )
            : const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'OH....Nothing Here',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Try to adding some catergory!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ));
  }
}
