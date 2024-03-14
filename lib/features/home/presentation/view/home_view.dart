import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Gap(40),
          //Header
          HomeHeader()
          
        ],
      ),
    );
  }
}
