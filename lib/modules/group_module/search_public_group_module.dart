import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';

final searchPublicGroupRoute = GoRoute(
  path: '/search_public_group',
  name: 'search_public_group',
  builder: (context, state) => const SearchPublicGroupScreen(),
);

class SearchPublicGroupScreen extends StatefulWidget {
  const SearchPublicGroupScreen({super.key});

  @override
  State<SearchPublicGroupScreen> createState() =>
      _SearchPublicGroupScreenState();
}

class _SearchPublicGroupScreenState extends State<SearchPublicGroupScreen> {
  final List<String> _publicList = [
    'Bahar Friends',
    '918 Neighbors',
    'Home',
    'Mona and Bahar',
  ];
  final TextEditingController _nameController = TextEditingController();
  final List<String> _joinedList = [];

  void _saveAndGoToDashboard() {
    context.goNamed(dashboardRoute.name!);
  }

  void _joinGroup(String group) {
    _joinedList.add(group);
    setState(() {});
  }

  void _unjoinGroup(String group) {
    _joinedList.removeWhere((item) => item == group);
    setState(() {});
  }

  void _searchGroupManually() {}

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
        safeareaColor: context.colorTheme.secondary,
        bodyColor: context.colorTheme.secondary,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleBar(
                  foregroundColor: context.colorTheme.onSecondary,
                  backgroundColor: Colors.transparent,
                  title: 'Search Public Groups!',
                ),
                const Gap(32),
                Text(
                  'Search for more groups:',
                  style: context.textTheme.subtitleMedium.onSecondary.style,
                ),
                const Gap(4),
                TextFormField(
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: _nameController,
                  style: context.textTheme.onSecondary.style,
                  cursorColor: context.colorTheme.onSecondary,
                  decoration: context.onSecondaryBackgroundInputDecoration(
                    suffix: AppThemeElevatedButton(
                      background: context.colorTheme.onSecondary,
                      padding: EdgeInsets.zero,
                      height: 48,
                      onPressed: () {
                        _searchGroupManually();
                      },
                      child: Icon(
                        Icons.search,
                        color: context.colorTheme.secondary,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(16),
                Expanded(
                  child: ListView.builder(
                      itemCount: _publicList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = _publicList[index];
                        final isJoined = _joinedList.contains(item);
                        return Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isJoined
                                  ? context.colorTheme.success
                                  : context.colorTheme.onSecondary,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.only(left: 8),
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  style: context.textTheme.subtitleMedium
                                      .onSecondary.style,
                                ),
                              ),
                              AppThemeElevatedButton(
                                background: isJoined
                                    ? context.colorTheme.success
                                    : context.colorTheme.onSecondary,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (isJoined) {
                                    _unjoinGroup(item);
                                  } else {
                                    _joinGroup(item);
                                  }
                                },
                                child: Text(
                                  isJoined ? 'Unjoin' : 'Join',
                                  style: context
                                      .textTheme.subtitleMedium.onPrimary.style,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const Gap(32),
                AppThemeElevatedButton(
                  background: context.colorTheme.onSecondary,
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _saveAndGoToDashboard();
                  },
                  child: Text(
                    'Save and Continue!',
                    style: context.textTheme.subtitleMedium.secondary.style,
                  ),
                ),
                const Gap(32),
              ],
            ),
          ),
        ));
  }
}
