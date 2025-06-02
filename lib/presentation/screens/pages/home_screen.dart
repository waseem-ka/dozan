import 'package:dozan/bloc/home_bloc/home_event.dart';
import 'package:dozan/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dozan/bloc/home_bloc/home_bloc.dart';
import 'package:dozan/presentation/screens/pages/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(LoadHomeData()),
      child: HomeView(),
    );
  }
}
