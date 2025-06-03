import 'package:dozan/model/offer_model.dart';
import 'package:equatable/equatable.dart';

abstract class SentOffersState extends Equatable {
  const SentOffersState();

  @override
  List<Object> get props => [];
}

class SentOffersInitial extends SentOffersState {}

class SentOffersLoading extends SentOffersState {}

class SentOffersLoaded extends SentOffersState {
  final List<OfferModel> offers;

  const SentOffersLoaded(this.offers);

  @override
  List<Object> get props => [offers];
}

class SentOffersError extends SentOffersState {
  final String message;

  const SentOffersError(this.message);

  @override
  List<Object> get props => [message];
}
