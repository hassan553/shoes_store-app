import 'package:flutter/material.dart';
import 'package:shoes_app/features/home/presentation/views/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const HomeView(),
    );
  }
}