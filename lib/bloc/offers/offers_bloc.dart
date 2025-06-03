import 'package:flutter_bloc/flutter_bloc.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersState(pageIndex: 0)) {
    on<ChangeOfferPage>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
  }
}
