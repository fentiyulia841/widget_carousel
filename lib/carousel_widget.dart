import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class With extends StatefulWidget {
  var Fruit = [
    'apple',
    'banana',
    'orange',
    'kiwi',
    'dragon fruit',
    'mango',
    'grapes',
  ];

  final List<String> names = [
    ' Apple',
    ' Orange ',
    ' Bananana ',
    ' Kiwi ',
    'Dragon fruit',
    'Mango'
  ];

  final List<String> imgList = [
    'https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg',
    'https://thumbs.dreamstime.com/b/orange-fruit-green-leaves-isolated-white-background-clipping-path-full-depth-field-fresh-177726692.jpg',
    'http://www.macdentalcare.com/pub/photo/2014-09-apple.jpg',
    'https://s3.envato.com/files/249849777/131.jpg',
    'https://i.pinimg.com/736x/53/5b/39/535b39b71fcf75886ef16d11f41ad29c.jpg',
    'https://media.istockphoto.com/photos/three-mangos-on-a-white-background-picture-id183134675?k=20&m=183134675&s=170667a&w=0&h=vADItDDbx2x19BxrNU4sJyqKLECQRs3sCnOA9KCTihw=',
    'https://t4.ftcdn.net/jpg/03/01/98/69/360_F_301986993_SYvMrcYECPje0HK6qRQQcm6uC7d3tpVC.jpg',
  ];

  @override
  _WithState createState() => _WithState();
}

class _WithState extends State<With> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map(
          (item) => Container(
            height: 200,
            width: 100,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: 400,
                      width: 300,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        '${[_current]}',
                        style: TextStyle(
                          backgroundColor: Colors.green[100],
                          height: 10,
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset:
                                  Offset(5, 3), // changes position of shadow
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(70, 10, 100, 10),
                              Color.fromARGB(0, 0, 100, 0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'FRUITS',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              viewportFraction: 0.4,
              autoPlay: false,
              enlargeCenterPage: true,
              pageSnapping: true,
              disableCenter: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((url) {
            int index = widget.imgList.indexOf(url);
            return Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          }).toList(),
        )
      ],
    );
  }
}