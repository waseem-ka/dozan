import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../services/HomeRepository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());

      try {
        final sliderImages = await homeRepository.fetchSliderImages();
        final mostRequested = await homeRepository.fetchMostRequestedItems();
        final services = await homeRepository.fetchServices();

        emit(
          HomeLoaded(
            sliderImages: sliderImages,
            mostRequestedItems: mostRequested,
            services: services,
          ),
        );
      } catch (e) {
        emit(HomeError('Failed to load data'));
      }
    });
  }
}
