import 'package:carousel_slider/carousel_slider.dart';
import 'package:dozan/Utils/paths.dart';
import 'package:dozan/Utils/strings.dart';
import 'package:dozan/bloc/home_bloc/home_bloc.dart';
import 'package:dozan/bloc/home_bloc/home_state.dart';
import 'package:dozan/presentation/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CarouselSliderControllerImpl _controller =
      CarouselSliderControllerImpl();
  Widget _buildSearchBar() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 104.w,
              height: 31.h,
              child: Image.asset(Paths().logoHome),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(Paths().searchIcon, width: 24, height: 24),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Services Search",
                    hintStyle: TextStyle(
                      color: CustomColor.grey2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cairo',
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(List<Map<String, String>> sliderImages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _controller.previousPage();
          },
          child: SvgPicture.asset(Paths().arrowLeft),
        ),
        SizedBox(
          width: 321.w,
          height: 150.h,
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 180,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 3),
            ),
            items:
                sliderImages.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(item['image']!, fit: BoxFit.cover),
                            // Gradient to make text more readable
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.black.withAlpha((0.7 * 255).toInt()),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3,
                                          color: Colors.black45,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item['label'] ?? '',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3,
                                          color: Colors.black45,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
        ),
        GestureDetector(
          onTap: () {
            _controller.nextPage();
          },
          child: SvgPicture.asset(Paths().arrowRight),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(List<Map<String, dynamic>> items) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 30, bottom: 10),
          child: Row(
            children: [
              Text(
                "Choose Service",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 عناصر بالسطر
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 107 / 90, // تقريبًا (optional لتسهيل التنسيق)
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return SizedBox(
                  width: 107.w,
                  height: 90.h,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            item['icon']!,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                        Text(
                          item['label']!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMostRequested(List<Map<String, dynamic>> items) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 30, bottom: 15),
          child: Row(
            children: [
              Text(
                "Most requested",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 5,
              childAspectRatio: 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 107.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.4, // أنحف قيمة منطقية للحواف
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        item['icon']!,
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    Text(
                      item['label']!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView(
              children: [
                _buildSearchBar(),
                _buildSlider(state.sliderImages),
                _buildMostRequested(state.mostRequestedItems),
                _buildSectionTitle(state.services),
              ],
            );
          } else if (state is HomeLoading) {
            return const Center(child: SpinningImageLoader());
          } else {
            return const Center(child: Text('Failed to load data'));
          }
        },
      ),
    );
  }
}
