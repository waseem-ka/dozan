// receive_offers_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/Utils/paths.dart';
import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_event.dart';
import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_state.dart';
import 'package:dozan/model/offer_model.dart';

// Bloc
class ReceiveOffersBloc extends Bloc<ReceiveOffersEvent, ReceiveOffersState> {
  ReceiveOffersBloc() : super(ReceiveOffersInitial()) {
    on<LoadReceiveOffers>((event, emit) async {
      emit(ReceiveOffersLoading());

      try {
        final List<Map<String, dynamic>> receiveOffers = [
          {
            'serviceType': 'Cleaning',
            'apartmentSize': '75 sqm',
            'location': 'Old City, Damascus',
            'requestedDate': '2025-06-11',
            'arrivalTime': '09:30 AM',
            'paymentMethod': 'Cash',
            'status': 'Offer Received',
            'image': Paths().offerImage,
          },
          {
            'serviceType': 'Plumbing',
            'apartmentSize': '90 sqm',
            'location': 'Kafar Souseh, Damascus',
            'requestedDate': '2025-06-13',
            'arrivalTime': '01:00 PM',
            'paymentMethod': 'Electronic',
            'status': 'Pending',
            'image': Paths().offerImage,
          },
          // ... تكمل الداتا إذا بدك
        ];

        final offersModels =
            receiveOffers.map((e) => OfferModel.fromMap(e)).toList();

        emit(ReceiveOffersLoaded(offersModels));
      } catch (e) {
        emit(ReceiveOffersError("Failed to load receive offers"));
      }
    });
  }
}
