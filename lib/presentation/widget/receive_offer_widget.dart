import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_bloc.dart';
import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_state.dart';
import 'package:dozan/presentation/widget/offer_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiveOffersPage extends StatelessWidget {
  const ReceiveOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveOffersBloc, ReceiveOffersState>(
      builder: (context, state) {
        if (state is ReceiveOffersLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ReceiveOffersLoaded) {
          final offers = state.offers;
          return ListView.builder(
            padding: EdgeInsets.all(20.w),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return OfferCard(offer: offers[index]);
            },
          );
        } else if (state is ReceiveOffersError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text("No received offers"));
        }
      },
    );
  }
}
