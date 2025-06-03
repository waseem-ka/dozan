part of 'offers_bloc.dart';

class OffersState {
  final int pageIndex;

  OffersState({required this.pageIndex});

  OffersState copyWith({int? pageIndex}) {
    return OffersState(pageIndex: pageIndex ?? this.pageIndex);
  }
}
