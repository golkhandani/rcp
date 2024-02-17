import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/scaffold_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/modules/app_bloc/group_tenancy_state.dart';
import 'package:bnf/modules/dashboard_module/dashboard_router.dart';
import 'package:bnf/modules/group_module/bloc/group_cubit.dart';
import 'package:bnf/modules/group_module/bloc/group_state.dart';

final createGroupRoute = GoRoute(
  path: '/create_group',
  name: 'create_group',
  builder: (context, state) => const CreateGroupScreen(),
);

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final GroupCubit _groupCubit = locator.get();

  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();
  final List<String> _members = [];
  String? _path;

  void _save() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _groupCubit.createNewGroup(
      name: _nameController.text,
      imagePath: _path,
      groupMembers: _members,
    );
  }

  void _goToDashboard() {
    context.goNamed(dashboardRoute.name!);
  }

  void _removeGroupMember(String memeber) {
    _members.removeWhere((item) => item == memeber);
    setState(() {});
  }

  void _addGroupMember() {
    _members.add(_memberController.text);
    _memberController.text = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
        safeareaColor: context.colorTheme.primary,
        bodyColor: context.colorTheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 32),
          child: BlocConsumer<GroupCubit, GroupState>(
            bloc: _groupCubit,
            listener: (context, state) {
              if (state.groupId != null) {
                context
                    .read<AppTenancyBloc>()
                    .setCurrentGroup(state.groupId!, _goToDashboard);
              }
            },
            builder: (context, state) => FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleBar(
                    foregroundColor: context.colorTheme.onPrimary,
                    backgroundColor: Colors.transparent,
                    title: 'Create New Group!',
                  ),
                  const Gap(32),
                  Text(
                    'Group Name:',
                    style: context.textTheme.subtitleMedium.onBackground.style,
                  ),
                  const Gap(4),
                  FormBuilderTextField(
                    name: 'name_field',
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    controller: _nameController,
                    style: context.textTheme.onPrimary.style,
                    cursorColor: context.colorTheme.onPrimary,
                    decoration: context.onPrimaryBackgroundInputDecoration(),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.minLength(4),
                  ),
                  const Gap(16),
                  Text(
                    'Group Image:',
                    style: context.textTheme.subtitleMedium.onBackground.style,
                  ),
                  const Gap(4),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width / 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        foregroundColor: context.colorTheme.onPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        side: BorderSide(
                          width: 2.0,
                          color: context.colorTheme.onPrimary,
                        ),
                      ).copyWith(
                        overlayColor: const MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () async {
                        debugPrint('Received click');
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.image,
                        );
                        if (result != null) {
                          File file = File(result.files.single.path!);
                          setState(() {
                            _path = file.path;
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Stack(
                        children: [
                          if (_path != null)
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                clipBehavior: Clip.hardEdge,
                                child: ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white70,
                                    BlendMode.dstIn,
                                  ),
                                  child: Image.file(
                                    File(_path!),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.photo_camera),
                                const SizedBox(width: 12),
                                Text(_path != null
                                    ? 'Update Image'
                                    : 'Pick Image'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'Add Group Member:',
                    style: context.textTheme.subtitleMedium.onBackground.style,
                  ),
                  const Gap(16),
                  Text(
                    'Email:',
                    style: context.textTheme.subtitleMedium.onBackground.style,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'member_email_field',
                          onTapOutside: (_) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          controller: _memberController,
                          style: context.textTheme.onPrimary.style,
                          cursorColor: context.colorTheme.onPrimary,
                          decoration:
                              context.onPrimaryBackgroundInputDecoration(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const Gap(4),
                      AppThemeElevatedButton(
                        background: context.colorTheme.onPrimary,
                        padding: EdgeInsets.zero,
                        height: 48,
                        onPressed: () {
                          _addGroupMember();
                        },
                        child: Text(
                          'Add',
                          style: context.textTheme.subtitleMedium.primary.style,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _members.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = _members[index];
                          return Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.only(left: 8),
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Expanded(child: Text(item)),
                                AppThemeElevatedButton(
                                  background: context.colorTheme.error,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    _removeGroupMember(item);
                                  },
                                  child: Text(
                                    'Remove',
                                    style: context
                                        .textTheme.subtitleMedium.onError.style,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const Gap(32),
                  AppThemeElevatedButton(
                    isLoading: state.isLoading,
                    background: context.colorTheme.onPrimary,
                    foreground: context.colorTheme.primary,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      _save();
                    },
                    child: Text(
                      'Save and Continue!',
                      style: context.textTheme.subtitleMedium.primary.style,
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ),
        ));
  }
}
