import 'package:flutter/material.dart';

import 'package:bnf/core/go_route_named.dart';
import 'package:bnf/core/widgets/dashboard_screen_shell.dart';

final homeRoute = GoRouteNamed(
  path: '/dashboard/home',
  name: 'home',
  builder: (context, state) => const HomeScreen(),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const DashboardScreenShell(
      child: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
