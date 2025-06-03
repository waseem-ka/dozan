import 'package:dozan/Utils/paths.dart';
import 'package:dozan/bloc/onboarding/onboarding_bloc.dart';
import 'package:dozan/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dozan/bloc/login/login_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    final List<Widget> onboardingPages = [
      onboard(
        imagePath: Paths().onboarding1,
        title: 'All maintenance services in\none application',
        subtitle:
            'No need to search a lot, Dozan brings\ntogether all home and office maintenance\nservices in one place.',
      ),
      onboard(
        imagePath: Paths().onboarding2,
        title:
            'Take pictures of the problem\n and let the technicians \nrespond to you.',
        subtitle:
            'Just take a video of the fault and get\n quotes from nearby technicians.',
      ),
      onboard(
        imagePath: Paths().onboarding3,
        title: 'Express service, depending on \nlocation',
        subtitle:
            'Dozan connects you with technicians \nnear you, based on your location, quickly.',
      ),
    ];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 0,
        toolbarOpacity: 0.6,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -48.h,
            left: 291.w,
            child: Container(
              width: 129.w,
              height: 129.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 188, 37, 0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 120.h,
            child: SizedBox(
              height: 445.h,
              width: 390.w,
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return PageView(
                    controller: bloc.pageController,
                    onPageChanged: (index) {
                      bloc.add(PageChanged(page: index));
                    },
                    children: onboardingPages,
                  );
                },
              ),
            ),
          ),

          // Dots Indicator
          Positioned(
            bottom: 230.h,
            left: 40.w,
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return Row(
                  children: List.generate(
                    3,
                    (index) => buildDot(index, state.currentPage),
                  ),
                );
              },
            ),
          ),

          // Skip Button
          Positioned(
            top: 700.h,
            left: -39.w,
            child: GestureDetector(
              onTap: () => bloc.add(SkipOnboarding()),
              child: Container(
                width: 173.w,
                height: 173.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromRGBO(242, 188, 37, 0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ),

          // Next Button
          Positioned(
            bottom: 25.h,
            right: 53.w,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("${bloc.state.currentPage}");
                if (bloc.state.currentPage == 2) {
                  bloc.add(CompleteOnboarding());
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder:
                          (_) => BlocProvider(
                            create: (context) => LoginBloc(),
                            child: LoginScreen(),
                          ),
                    ),
                  );
                } else {
                  bloc.add(NextPage());
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(139.w, 40.h),
                backgroundColor: const Color.fromRGBO(242, 188, 37, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget onboard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Image.asset(imagePath, width: 350.w, height: 255.h),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }

  Widget buildDot(int index, int currentPage) {
    bool isActive = index == currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: isActive ? 15.h : 9.h,
      width: isActive ? 15.w : 9.w,
      decoration: BoxDecoration(
        color:
            isActive
                ? const Color.fromRGBO(242, 188, 37, 1)
                : const Color.fromRGBO(242, 188, 37, 0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
