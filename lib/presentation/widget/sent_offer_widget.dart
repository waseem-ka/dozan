import 'package:dozan/bloc/offers/sent_bloc/sent_bloc.dart';
import 'package:dozan/bloc/offers/sent_bloc/sent_state.dart';
import 'package:dozan/presentation/widget/offer_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentOffersPage extends StatelessWidget {
  const SentOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentOffersBloc, SentOffersState>(
      builder: (context, state) {
        if (state is SentOffersLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SentOffersLoaded) {
          final offers = state.offers;
          return ListView.builder(
            padding: EdgeInsets.all(20.w),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return OfferCard(offer: offers[index]);
            },
          );
        } else if (state is SentOffersError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text("No sent offers"));
        }
      },
    );
  }
}
