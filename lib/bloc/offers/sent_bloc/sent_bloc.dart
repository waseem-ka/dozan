// sent_offers_bloc.dart
import 'package:dozan/bloc/offers/sent_bloc/sent_event.dart';
import 'package:dozan/bloc/offers/sent_bloc/sent_state.dart';
import 'package:dozan/services/dummy_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/Utils/paths.dart';
import 'package:dozan/model/offer_model.dart';

// Bloc
class SentOffersBloc extends Bloc<SentOffersEvent, SentOffersState> {
  SentOffersBloc() : super(SentOffersInitial()) {
    on<LoadSentOffers>((event, emit) async {
      emit(SentOffersLoading());

      try {
        final offersModels =
            DummyData().sentOffers.map((e) => OfferModel.fromMap(e)).toList();

        emit(SentOffersLoaded(offersModels));
      } catch (e) {
        emit(SentOffersError("Failed to load sent offers"));
      }
    });
  }
}
