class HomeService {
  Future<List<String>> fetchSliderImages() async {
    // بدل هالـ dummy data بالـ API لاحقًا
    return [
      'https://yourapi.com/images/slider1.jpg',
      'https://yourapi.com/images/slider2.jpg',
      'https://yourapi.com/images/slider3.jpg',
    ];
  }

  Future<List<Map<String, String>>> fetchMostRequestedItems() async {
    return [
      {'icon': 'assets/icons/wash.svg', 'label': 'Laundry'},
      {'icon': 'assets/icons/clean.svg', 'label': 'Cleaning'},
    ];
  }

  Future<List<Map<String, String>>> fetchServices() async {
    return [
      {'icon': 'assets/icons/plumbing.svg', 'label': 'Plumbing'},
      {'icon': 'assets/icons/electric.svg', 'label': 'Electric'},
    ];
  }
}
