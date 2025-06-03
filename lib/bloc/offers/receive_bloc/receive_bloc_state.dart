import 'package:dozan/model/offer_model.dart';
import 'package:equatable/equatable.dart';

abstract class ReceiveOffersState extends Equatable {
  const ReceiveOffersState();

  @override
  List<Object> get props => [];
}

class ReceiveOffersInitial extends ReceiveOffersState {}

class ReceiveOffersLoading extends ReceiveOffersState {}

class ReceiveOffersLoaded extends ReceiveOffersState {
  final List<OfferModel> offers;

  const ReceiveOffersLoaded(this.offers);

  @override
  List<Object> get props => [offers];
}

class ReceiveOffersError extends ReceiveOffersState {
  final String message;

  const ReceiveOffersError(this.message);

  @override
  List<Object> get props => [message];
}
