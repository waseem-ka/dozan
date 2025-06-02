import 'package:dozan/services/dummy_data.dart';

abstract class HomeRepository {
  Future<List<Map<String, String>>> fetchSliderImages();
  Future<List<Map<String, String>>> fetchMostRequestedItems();
  Future<List<Map<String, String>>> fetchServices();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<Map<String, String>>> fetchSliderImages() async {
    // هنا ممكن تجيب من API لكن حالياً من DummyData
    await Future.delayed(Duration(seconds: 1)); // محاكاة تحميل
    return DummyData().sliderImages;
  }

  @override
  Future<List<Map<String, String>>> fetchMostRequestedItems() async {
    await Future.delayed(Duration(seconds: 1));
    return DummyData().mostRequestedItems;
  }

  @override
  Future<List<Map<String, String>>> fetchServices() async {
    await Future.delayed(Duration(seconds: 1));
    return DummyData().services;
  }
}
