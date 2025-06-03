import 'package:equatable/equatable.dart';

abstract class ReceiveOffersEvent extends Equatable {
  const ReceiveOffersEvent();

  @override
  List<Object> get props => [];
}

class LoadReceiveOffers extends ReceiveOffersEvent {}
