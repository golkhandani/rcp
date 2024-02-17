import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/modules/user_request_module/request_id_module.dart';

final activeRequestRoute = GoRoute(
  path: '/dashboard/active_request',
  name: 'active_request',
  builder: (context, state) => const ActiveRequestScreen(),
  routes: [requestIdRoute],
);

class ActiveRequestScreen extends StatefulWidget {
  const ActiveRequestScreen({super.key});

  @override
  State<ActiveRequestScreen> createState() => _ActiveRequestScreenState();
}

class _ActiveRequestScreenState extends State<ActiveRequestScreen>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(icon: Icon(Icons.shopping_basket)),
    Tab(icon: Icon(Icons.person_3_outlined)),
  ];
  late final TabController tabController = TabController(
    length: tabs.length,
    vsync: this,
  );

  String _title = 'Accepted Requests';
  void _updateTitle() {
    setState(() {
      _title = tabController.index == 0 ? 'Accepted Requests' : 'My Requests';
    });
  }

  @override
  void initState() {
    super.initState();
    tabController.addListener(_updateTitle);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.removeListener(_updateTitle);
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: Column(
        children: [
          TitleBar(title: _title, elevation: 0),
          TitleTabBar(
            tabs: tabs,
            tabController: tabController,
          ),
        ],
      ),
    );
  }
}
