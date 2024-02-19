import 'package:flutter/material.dart';

import 'package:bnf/core/go_route_named.dart';
import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';

final settingRoute = GoRouteNamed(
  path: '/dashboard/setting',
  name: 'setting',
  builder: (context, state) => const SettingScreen(),
);

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          SliverTitleBar(
            title: 'Settings',
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
