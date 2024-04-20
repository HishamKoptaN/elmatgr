import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../helpers/constants.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<String> offers = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUYm266qpnjJfhRzmp1yX5pGkUerDYE2RBbj5HU3o9AQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUYm266qpnjJfhRzmp1yX5pGkUerDYE2RBbj5HU3o9AQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUYm266qpnjJfhRzmp1yX5pGkUerDYE2RBbj5HU3o9AQ&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        // ============>>>>>>>>>>>>   Catagory List End     <<<<<<<<<<<<<<========
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offers",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: context.screenHeight * 12,
          width: context.screenWidth * 95,
          decoration: BoxDecoration(
            border: Border.all(color: iconColor, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            color: Colors.transparent,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color(0xfff8f8f8),
                  blurRadius: 5,
                  spreadRadius: 10,
                  offset: Offset(5, 5)),
            ],
          ),
          child: PageView(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/elmatgr-ec97a.appspot.com/o/download.jpg?alt=media&token=7b0f7088-c1fd-4b5e-aa94-112b9b333421'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/elmatgr-ec97a.appspot.com/o/images.jpg?alt=media&token=25b85abd-b05e-4970-a238-7c8689310906'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/elmatgr-ec97a.appspot.com/o/256x256bb.jpg?alt=media&token=f875c9a1-718f-4be9-92a1-ae52a03d486c'),
                            fit: BoxFit.cover)),
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.decelerate,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
