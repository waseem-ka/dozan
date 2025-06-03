part of 'offers_bloc.dart';

abstract class OffersEvent {}

class ChangeOfferPage extends OffersEvent {
  final int pageIndex;

  ChangeOfferPage(this.pageIndex);
}
