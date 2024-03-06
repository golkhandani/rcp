import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

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
    return DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          const SliverTitleBar(
            title: 'Settings',
            elevation: 0,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16).copyWith(
              bottom: 120 + context.bottomSafePadding,
              top: 64,
            ),
            sliver: MultiSliver(
              children: const [
                ComingSoon(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
