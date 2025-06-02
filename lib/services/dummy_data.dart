import 'package:dozan/Utils/paths.dart';

class DummyData {
  List<String> sliderImages1 = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
  ];
  List<Map<String, String>> sliderImages = [
    {
      'image': Paths().slider1,
      'title': 'Dozan fix anything',
      'label': 'Lorem ipsum dolor sit amet consectetur.\nEgestas leo ultrices',
    },
    {
      'image': Paths().slider2,
      'title': 'hello i am here',
      'label': 'hello this is dozan app here',
    },
    {
      'image': Paths().slider3,
      'title': 'hello i am here',
      'label': 'hello this is dozan app here',
    },
  ];

  List<Map<String, String>> mostRequestedItems = [
    {'icon': Paths().service1, 'label': 'Cooling Services'},
    {'icon': Paths().service2, 'label': 'Demolition'},
    {'icon': Paths().service3, 'label': 'Diesel Generator'},
  ];

  final List<Map<String, String>> services = [
    {'icon': Paths().service1, 'label': 'Cooling Services'},
    {'icon': Paths().service2, 'label': 'Demolition'},
    {'icon': Paths().service3, 'label': 'Diesel Generator'},
    {'icon': Paths().service4, 'label': 'Blinds installation'},
    {'icon': Paths().service5, 'label': 'Furniture'},
    {'icon': Paths().service6, 'label': 'Gypsum/Wallpaper'},
    {'icon': Paths().service7, 'label': 'Handyman'},
    {'icon': Paths().service8, 'label': 'Painting'},
    {'icon': Paths().service9, 'label': 'Electric'},
    {'icon': Paths().service10, 'label': 'Heating Services'},
    {'icon': Paths().service11, 'label': 'Signage Solutions'},
    {'icon': Paths().service12, 'label': 'Solar Energy'},
    {'icon': Paths().service13, 'label': 'Appliances'},
  ];
}
