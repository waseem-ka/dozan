import 'package:equatable/equatable.dart';

abstract class SentOffersEvent extends Equatable {
  const SentOffersEvent();

  @override
  List<Object> get props => [];
}

class LoadSentOffers extends SentOffersEvent {}
