import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/models/invitation_model.dart';
import 'package:rcp/core/widgets/constants.dart';
import 'package:rcp/core/widgets/headers/sliver_title_bar.dart';
import 'package:rcp/core/widgets/layouts/dashboard_screen_shell.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/home_module/bloc/home_bloc.dart';
import 'package:rcp/modules/home_module/refreshable_nested_scroll_view.dart';
import 'package:rcp/modules/user_inbox_module/bloc/invitation_bloc_state.dart';

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
  late final HomeBloc _homeBloc = context.read();
  late final InvitationBloc _invitationBloc = context.read();

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
              viewportFraction: .99,
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                InboxInvitationTab(
                  invitationBloc: _invitationBloc,
                  homeBloc: _homeBloc,
                ),
                InboxLogTab(
                  invitationBloc: _invitationBloc,
                  homeBloc: _homeBloc,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EmptyIsList extends StatelessWidget {
  const EmptyIsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height / 2,
                  ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: Assets.images.listIsEmpty.provider(),
                  fit: BoxFit.contain,
                  scale: .2,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate(delay: 200.ms).fade().scale();
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title!,
                  style:
                      context.typoraphyTheme.titleLarge.onBackground.textStyle,
                ),
              ),
            FittedBox(
              fit: BoxFit.cover,
              child: Container(
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: Assets.images.commingSoon.provider(),
                    fit: BoxFit.contain,
                    scale: .2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fade().scale();
  }
}

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    ).animate().fade().scale();
  }
}

class InboxInvitationTab extends StatelessWidget {
  const InboxInvitationTab({
    super.key,
    required InvitationBloc invitationBloc,
    required HomeBloc homeBloc,
  })  : _invitationBloc = invitationBloc,
        _homeBloc = homeBloc;

  final InvitationBloc _invitationBloc;
  final HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    return RefreshableNestedScrollView(
      header: null,
      onRefreshRequested: (rs) => _invitationBloc
          .reloadInvitations()
          .then((value) => rs.onRefreshDone()),
      onMoreRequested: (rs) => _invitationBloc.loadInvitations(),
      builder: (context, handler) =>
          BlocBuilder<InvitationBloc, InvitationBlocState>(
        builder: (context, state) {
          return SliverMainAxisGroup(
            slivers: [
              const SliverGap(kMediumGap),
              if (state.isLoading && state.invitations.isEmpty) ...[
                const SliverToBoxAdapter(
                  child: LoadingCircle(),
                ),
                const SliverGap(kMediumGap),
              ],
              if (!state.isLoading && state.invitations.isEmpty) ...[
                const SliverToBoxAdapter(child: EmptyIsList()),
                const SliverGap(kMediumGap),
              ],
              SliverList.builder(
                itemCount: state.invitations.length,
                itemBuilder: (context, index) => InvitationCard(
                  item: state.invitations[index],
                  invitationBloc: _invitationBloc,
                  homeBloc: _homeBloc,
                  isUpdating:
                      state.isUpdating[state.invitations[index].id] ?? false,
                ),
              ),
              if (state.isLoading && state.invitations.isNotEmpty)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class InvitationCard extends StatelessWidget {
  const InvitationCard({
    super.key,
    required this.item,
    required InvitationBloc invitationBloc,
    required HomeBloc homeBloc,
    required this.isUpdating,
  })  : _invitationBloc = invitationBloc,
        _homeBloc = homeBloc;

  final Invitation item;
  final InvitationBloc _invitationBloc;
  final HomeBloc _homeBloc;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: context.colorTheme.cardBackground,
      margin: const EdgeInsets.only(bottom: kMediumGap),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.shoppingList.name,
              style: context.typoraphyTheme.titleMedium.textStyle,
            ),
            const SizedBox(height: 8.0),
            Text(
              item.shoppingList.description ?? '',
              style: context
                  .typoraphyTheme.subtitleMedium.onCardBackground.textStyle,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Invited at ${DateFormat.yMMMd().format(item.invitedAt)} by ${item.invitedBy.safeName}',
                    style: context.typoraphyTheme.subtitleMedium
                        .onCardBackground.textStyle,
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: Row(
                    children: [
                      BasicElevatedButton(
                          background: context.colorTheme.error,
                          foreground: context.colorTheme.onError,
                          labelText: 'Reject',
                          onPressed: () {
                            _invitationBloc.rejectInvitaton(
                              invitation: item,
                            );
                            _homeBloc.getAcceptedShoppingList(
                                shoppingListId: item.shoppingList.id);
                          }),
                      const Gap(16),
                      BasicElevatedButton(
                        width: 88,
                        background: context.colorTheme.success,
                        foreground: context.colorTheme.onSuccess,
                        labelText: 'Accept',
                        onPressed: () {
                          _invitationBloc.acceptInvitaton(
                            invitation: item,
                          );
                          _homeBloc.getAcceptedShoppingList(
                              shoppingListId: item.shoppingList.id);
                        },
                      ),
                    ],
                  ),
                  secondChild: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  crossFadeState: (isUpdating)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: 100.milliseconds,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InboxLogTab extends StatelessWidget {
  const InboxLogTab({
    super.key,
    required InvitationBloc invitationBloc,
    required HomeBloc homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvitationBloc, InvitationBlocState>(
      listenWhen: (previous, current) =>
          previous.invitations.isNotEmpty &&
          previous.invitations.length != current.invitations.length,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return CustomScrollView(
          slivers: [
            const SliverGap(16),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: 120 + context.bottomSafePadding,
                top: 0,
              ),
              sliver: MultiSliver(
                children: const [
                  ComingSoon(),
                ],
              ),
            ),
            const SliverGap(16),
          ],
        );
      },
    );
  }
}
