import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/tenancy_title_bar.dart';

final requestAroundRoute = GoRoute(
  path: '/dashboard/request_around',
  name: 'request_around',
  builder: (context, state) => const RequestAroundScreen(),
);

class RequestAroundScreen extends StatefulWidget {
  const RequestAroundScreen({super.key});

  @override
  State<RequestAroundScreen> createState() => _RequestAroundScreenState();
}

class _RequestAroundScreenState extends State<RequestAroundScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: CustomScrollView(
        slivers: [
          const UserSliverTitleBar(),
          // Add more slivers or content here
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50, // Example item count
            ),
          ),
        ],
      ),
    );
  }
}
