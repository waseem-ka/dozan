import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_bloc.dart';
import 'package:dozan/bloc/offers/receive_bloc/receive_bloc_event.dart';
import 'package:dozan/bloc/offers/sent_bloc/sent_bloc.dart';
import 'package:dozan/bloc/offers/sent_bloc/sent_event.dart';
import 'package:dozan/presentation/widget/receive_offer_widget.dart';
import 'package:dozan/presentation/widget/sent_offer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/bloc/offers/offers_bloc.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OffersBloc()),
        BlocProvider(
          create: (_) => SentOffersBloc()..add(LoadSentOffers()),
        ), // حمّل البيانات المبدئية
        BlocProvider(
          create: (_) => ReceiveOffersBloc()..add(LoadReceiveOffers()),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
          child: Column(
            children: [
              BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OffersBloc>().add(ChangeOfferPage(0));
                            pageController.animateToPage(
                              0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                state.pageIndex == 0
                                    ? Colors.white
                                    : const Color(0xFFD8D8D8),
                            foregroundColor: Colors.orange,
                            side: const BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                            ),
                            minimumSize: Size(double.infinity, 50.h),
                          ),
                          child: Text(
                            "Sent",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OffersBloc>().add(ChangeOfferPage(1));
                            pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                state.pageIndex == 1
                                    ? Colors.white
                                    : const Color(0xFFD8D8D8),
                            foregroundColor: Colors.orange,
                            side: const BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                            minimumSize: Size(double.infinity, 50.h),
                          ),
                          child: Text(
                            "Received",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    context.read<OffersBloc>().add(ChangeOfferPage(index));
                  },
                  children: const [SentOffersPage(), ReceiveOffersPage()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
