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

  //Offer Sent dummy data
  final List<Map<String, dynamic>> sentOffers = [
    {
      'serviceType': 'Cooling Services',
      'apartmentSize': '100 m',
      'location': 'Mazzeh, Damascus',
      'requestedDate': '2025-06-10',
      'arrivalTime': '10:00 AM',
      'paymentMethod': 'Cash',
      'status': 'Searching',
      'image': Paths().offerImage,
    },
    {
      'serviceType': 'Painting',
      'apartmentSize': '120 m',
      'location': 'Bab Touma, Damascus',
      'requestedDate': '2025-06-12',
      'arrivalTime': '02:30 PM',
      'paymentMethod': 'Electronic',
      'status': 'Offer',
      'image': Paths().offerImage,
    },
    {
      'serviceType': 'Electric',
      'apartmentSize': '80 m',
      'location': 'Jaramana, Rural Damascus',
      'requestedDate': '2025-06-15',
      'arrivalTime': '09:00 AM',
      'paymentMethod': 'Cash',
      'status': 'On the way',
      'image': Paths().offerImage,
    },
    {
      'serviceType': 'Appliances',
      'apartmentSize': '90 m',
      'location': 'Mashrou Dummar, Damascus',
      'requestedDate': '2025-06-16',
      'arrivalTime': '11:00 AM',
      'paymentMethod': 'Electronic',
      'status': 'In progress',
      'image': Paths().offerImage,
    },
    {
      'serviceType': 'Furniture',
      'apartmentSize': '60 m',
      'location': 'Salhieh, Damascus',
      'requestedDate': '2025-06-17',
      'arrivalTime': '04:00 PM',
      'paymentMethod': 'Cash',
      'status': 'Done',
      'image': Paths().offerImage,
    },
  ];
}
