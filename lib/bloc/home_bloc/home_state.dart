abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Map<String, String>> sliderImages;
  final List<Map<String, String>> mostRequestedItems;
  final List<Map<String, String>> services;

  HomeLoaded({
    required this.sliderImages,
    required this.mostRequestedItems,
    required this.services,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
