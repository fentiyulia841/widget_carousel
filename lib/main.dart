import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  '<a class="vglnk" href="https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg" rel="nofollow"><span>https</span><span>://</span><span>cdn</span><span>.</span><span>pixabay</span><span>.</span><span>com</span><span>/</span><span>photo</span><span>/</span><span>2020</span><span>/</span><span>11</span><span>/</span><span>01</span><span>/</span><span>23</span><span>/</span><span>22</span><span>/</span><span>breakfast</span><span>-</span><span>5705180</span><span>_</span><span>1280</span><span>.</span><span>jpg</span></a>',
  '<a class="vglnk" href="https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg" rel="nofollow"><span>https</span><span>://</span><span>cdn</span><span>.</span><span>pixabay</span><span>.</span><span>com</span><span>/</span><span>photo</span><span>/</span><span>2016</span><span>/</span><span>11</span><span>/</span><span>18</span><span>/</span><span>19</span><span>/</span><span>00</span><span>/</span><span>breads</span><span>-</span><span>1836411</span><span>_</span><span>1280</span><span>.</span><span>jpg</span></a>',
  '<a class="vglnk" href="https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg" rel="nofollow"><span>https</span><span>://</span><span>cdn</span><span>.</span><span>pixabay</span><span>.</span><span>com</span><span>/</span><span>photo</span><span>/</span><span>2019</span><span>/</span><span>01</span><span>/</span><span>14</span><span>/</span><span>17</span><span>/</span><span>25</span><span>/</span><span>gelato</span><span>-</span><span>3932596</span><span>_</span><span>1280</span><span>.</span><span>jpg</span></a>',
  '<a class="vglnk" href="https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg" rel="nofollow"><span>https</span><span>://</span><span>cdn</span><span>.</span><span>pixabay</span><span>.</span><span>com</span><span>/</span><span>photo</span><span>/</span><span>2017</span><span>/</span><span>04</span><span>/</span><span>04</span><span>/</span><span>18</span><span>/</span><span>07</span><span>/</span><span>ice</span><span>-</span><span>cream</span><span>-</span><span>2202561</span><span>_</span><span>1280</span><span>.</span><span>jpg</span></a>',
];

final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carousel with indicator demo'),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: imagesList
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        elevation: 6.0,
                        shadowColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Center(
                                child: Text(
                                  '${titles[_currentIndex]}',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.black45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}