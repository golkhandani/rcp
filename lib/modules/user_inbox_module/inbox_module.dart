import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/models/notification/user_notification_model.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';

final inboxRoute = GoRouteNamed(
  path: '/dashboard/inbox',
  name: 'inbox',
  builder: (context, state) => const InboxScreen(),
);

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(icon: Icon(Icons.notifications)),
    Tab(icon: Icon(Icons.chat)),
  ];
  late final TabController tabController = TabController(
    length: tabs.length,
    vsync: this,
  );

  String _title = 'Notifications';
  void _updateTitle() {
    setState(() {
      _title = tabController.index == 0 ? 'Notifications' : 'Chats';
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
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomScrollView(
                    slivers: [
                      const SliverGap(16),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final notification = fakeNotifications[index];
                            return Card(
                              elevation: 2.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16.0),
                                title: Text(
                                  notification.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 8.0),
                                    Text(notification.message),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      '${notification.timestamp}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Handle onTap action here
                                },
                              ),
                            );
                          },
                          childCount: fakeNotifications
                              .length, // Total number of list items
                        ),
                      ),
                      const SliverGap(16),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomScrollView(
                    slivers: [
                      const SliverGap(16),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final notification = fakeNotifications[index];
                            return Card(
                              elevation: 2.0,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(16.0),
                                title: Text(
                                  notification.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 8.0),
                                    Text(notification.message),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      '${notification.timestamp}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Handle onTap action here
                                },
                              ),
                            );
                          },
                          childCount: fakeNotifications
                              .length, // Total number of list items
                        ),
                      ),
                      const SliverGap(16),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
