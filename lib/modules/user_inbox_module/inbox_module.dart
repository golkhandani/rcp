import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/models/notification/invitation_model.dart';
import 'package:rcp/core/models/notification/user_notification_model.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';

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
    Tab(icon: Icon(Icons.add_reaction_rounded)),
    Tab(icon: Icon(Icons.receipt_long_sharp)),
  ];
  late final TabController tabController = TabController(
    length: tabs.length,
    vsync: this,
  );

  String _title = 'Invitations';
  void _updateTitle() {
    setState(() {
      _title = tabController.index == 0 ? 'Invitations' : 'Logs';
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

  late final List<Invitation> invitations = generateFakeInvitationData(20);

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
                CustomScrollView(
                  slivers: [
                    const SliverGap(16),
                    SliverPadding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16).copyWith(
                        bottom: 88 + context.bottomSafePadding,
                        top: 0,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = invitations[index];
                            return Card(
                              elevation: 2.0,
                              color: context.colorTheme.cardBackground,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item.name,
                                      style: context
                                          .typoraphyTheme.titleMedium.textStyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      item.description ?? '',
                                      style: context
                                          .typoraphyTheme
                                          .subtitleMedium
                                          .onCardBackground
                                          .textStyle,
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Invited at ${DateFormat.yMMMd().format(item.createdAt)} by ${item.invitedBy.profile.safeName}',
                                            style: context
                                                .typoraphyTheme
                                                .subtitleMedium
                                                .onCardBackground
                                                .textStyle,
                                          ),
                                        ),
                                        BasicElevatedButton(
                                          background: context.colorTheme.error,
                                          foreground:
                                              context.colorTheme.onError,
                                          labelText: 'Reject',
                                          onPressed: () {},
                                        ),
                                        const Gap(16),
                                        BasicElevatedButton(
                                          width: 88,
                                          background:
                                              context.colorTheme.success,
                                          foreground:
                                              context.colorTheme.onSuccess,
                                          labelText: 'Accept',
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: fakeNotifications
                              .length, // Total number of list items
                        ),
                      ),
                    ),
                    const SliverGap(16),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    const SliverGap(16),
                    SliverPadding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16).copyWith(
                        bottom: 88 + context.bottomSafePadding,
                        top: 0,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final notification = fakeNotifications[index];
                            return Card(
                              elevation: 2.0,
                              color: context.colorTheme.cardBackground,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      notification.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                              ),
                            );
                          },
                          childCount: fakeNotifications
                              .length, // Total number of list items
                        ),
                      ),
                    ),
                    const SliverGap(16),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
