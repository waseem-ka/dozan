import 'package:dozan/Utils/paths.dart';
import 'package:dozan/Utils/strings.dart';
import 'package:dozan/bloc/home_bloc/home_bloc.dart';
import 'package:dozan/bloc/home_bloc/home_event.dart';
import 'package:dozan/presentation/screens/pages/home_screen.dart';
import 'package:dozan/presentation/screens/pages/notifications_page.dart';
import 'package:dozan/presentation/screens/pages/orders_page.dart';
import 'package:dozan/presentation/screens/pages/profile.dart';
import 'package:dozan/services/HomeRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dozan/bloc/navigation_bar/navigation_bloc.dart';
import 'package:dozan/bloc/navigation_bar/navigation_event.dart';
import 'package:dozan/bloc/navigation_bar/navigation_state.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({super.key});

  List<Widget> getPages(context) {
    return [
      BlocProvider<HomeBloc>(
        create:
            (_) =>
                HomeBloc(homeRepository: context.read<HomeRepository>())
                  ..add(LoadHomeData()),
        child: const HomeScreen(),
      ),
      const OrdersPage(),
      const NotificationsPage(),
      const Profile(),
    ];
  }

  final List<Map<String, String>> navItems = [
    {'icon': Paths().home, 'label': 'Home'},
    {'icon': Paths().gift, 'label': 'Offers'},
    {'icon': Paths().notification, 'label': 'Notification'},
    {'icon': Paths().profile, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          final pages = getPages(context);
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(index: state.currentIndex, children: pages),
            ),
            bottomNavigationBar: Container(
              height: 90.h,
              width: 393.w,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(navItems.length, (index) {
                  final item = navItems[index];
                  final selected = index == state.currentIndex;

                  return GestureDetector(
                    onTap: () {
                      context.read<NavigationBloc>().add(ChangeTab(index));
                    },
                    child: AnimatedContainer(
                      width: 92.25.w,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selected
                                ? CustomColor.darkYallow
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            item['icon']!,
                            color: selected ? CustomColor.yallow : Colors.black,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(height: 4),
                          AnimatedSlide(
                            offset: selected ? Offset(0, 0) : Offset(0, 1),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: AnimatedOpacity(
                              opacity: selected ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                item['label']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
