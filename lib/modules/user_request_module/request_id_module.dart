import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/widgets/custom_dropdowns.dart';
import 'package:bnf/core/widgets/dashboard_screen_shell.dart';
import 'package:bnf/core/widgets/sliver_title_bar.dart';
import 'package:bnf/utils/extensions/context_ui_extension.dart';

final requestIdRoute = GoRoute(
  path: 'request/:id',
  name: 'request_id',
  builder: (context, state) => const RequestIdScreen(),
);

class RequestIdScreen extends StatefulWidget {
  const RequestIdScreen({super.key});

  @override
  State<RequestIdScreen> createState() => _RequestIdScreenState();
}

class _RequestIdScreenState extends State<RequestIdScreen> {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final brandController = TextEditingController();

  final quantityController = TextEditingController();
  final locationController = TextEditingController();

  final noteController = TextEditingController();

  bool isLoadingEntries = false;
  late final testEditingController = TextEditingController();

  String? _selectedProduct;
  String? _imageUrl;

  List<DropdownMenuEntry<String>> items = [];

  Future<void> onChanged(String text) async {
    debugPrint("SEARCH");
    setState(() {
      isLoadingEntries = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      isLoadingEntries = false;
      items = text.length <= 3
          ? []
          : [
              ...List.generate(
                Random().nextInt(100),
                (index) {
                  final product = 'Product #$index';
                  return DropdownMenuEntry(value: product, label: product);
                },
              )
            ];
    });
  }

  Future<void> onSelected(String product) async {
    setState(() {
      _selectedProduct = product;
    });
  }

  Future<void> onSelectUnit(String unit) async {
    setState(() {});
  }

  Future<void> saveProduct() async {}

  @override
  Widget build(BuildContext context) {
    return DashboardScreenShell(
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const SliverTitleBar(title: 'Wish Item'),
          SliverPadding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 120),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: context.isMediumWith
                        ? context.vWidth / 2
                        : context.vWidth,
                    maxWidth: 720,
                  ),
                  child: Center(
                    child: FormBuilder(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Main Info: ',
                                textAlign: TextAlign.start,
                                style: context
                                    .textTheme.titleTiny.onBackground.style,
                              ),
                              const Gap(16),
                              Text(
                                'Select from previously entered wish: ',
                                style:
                                    context.textTheme.hint.onBackground.style,
                              ),
                              const Gap(8),
                              AsyncDropdownMenu<String>(
                                isEnabled: true,
                                onChanged: onChanged,
                                onSelected: onSelected,
                                controller: testEditingController,
                                items: items,
                                labelText: 'Wish',
                                isLoading: isLoadingEntries,
                              ),
                              const Gap(16),
                              Text(
                                'Or add new wish: ',
                                style:
                                    context.textTheme.hint.onBackground.style,
                              ),
                              const Gap(16),
                              TextFormField(
                                enabled: _selectedProduct == null,
                                controller: nameController,
                                decoration: context.inputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              const Gap(16),
                              ImageInputFormField(
                                isEnabled: _selectedProduct == null,
                                imageUrl: _imageUrl,
                                onImageSelected: (p) {},
                              ),
                              const Gap(16),
                              TextFormField(
                                enabled: _selectedProduct == null,
                                controller: categoryController,
                                decoration: context.inputDecoration(
                                  labelText: 'Category',
                                ),
                              ),
                              const Gap(16),
                              TextFormField(
                                enabled: _selectedProduct == null,
                                controller: brandController,
                                decoration: context.inputDecoration(
                                  labelText: 'Brand',
                                ),
                              ),
                              const Gap(16),
                              // SyncDropdownMenu<String>(
                              //   isEnabled: _selectedProduct == null,
                              //   labelText: 'Unit',
                              //   items: [
                              //     ...['Lb', 'Kg', 'Ltr'].map(
                              //       (item) => DropdownMenuEntry(
                              //           value: item, label: item),
                              //     )
                              //   ],
                              //   selectedItem: _selectedUnit,
                              //   onSelected: onSelectUnit,
                              // ),
                              // const Gap(16),
                            ],
                          ),
                          const Divider(),
                          const Gap(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Details: ',
                                style: context
                                    .textTheme.titleTiny.onBackground.style,
                              ),
                              const Gap(16),
                              TextFormField(
                                controller: quantityController,
                                decoration: context.inputDecoration(
                                  labelText: 'Quantity',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: locationController,
                                decoration: context.inputDecoration(
                                  labelText: 'Location',
                                ),
                              ),
                              const Gap(16),
                              TextFormField(
                                decoration: context.inputDecoration(
                                  labelText: 'Note',
                                ),
                                minLines: 6,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                              const Gap(16),
                              AppThemeElevatedButton(
                                width: MediaQuery.sizeOf(context).width,
                                background: context.colorTheme.primary,
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Text(
                                  'Submit',
                                  style: context
                                      .textTheme.subtitleMedium.onPrimary.style,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageInputFormField extends StatefulWidget {
  final bool isEnabled;
  final void Function(String) onImageSelected;
  final String? imageUrl;
  const ImageInputFormField({
    super.key,
    required this.isEnabled,
    required this.onImageSelected,
    this.imageUrl,
  });

  @override
  State<ImageInputFormField> createState() => _ImageInputFormFieldState();
}

class _ImageInputFormFieldState extends State<ImageInputFormField> {
  String? _path;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 164,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: context.colorTheme.onCardBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            side: BorderSide(
              width: 2.0,
              color: widget.isEnabled
                  ? context.colorTheme.cardBackground
                  : context.colorTheme.cardBackground
                      .darken(0.9)
                      .withOpacity(0.1),
            ),
          ).copyWith(
              overlayColor:
                  MaterialStatePropertyAll(context.colorTheme.primary)),
          onPressed: () async {
            debugPrint('Received click');
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.image,
            );
            if (result != null) {
              File file = File(result.files.single.path!);
              setState(() {
                _path = file.path;
              });
              widget.onImageSelected(file.path);
            } else {
              // User canceled the picker
            }
          },
          child: Stack(
            children: [
              if (_path != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.hardEdge,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.white54,
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
              if (widget.imageUrl != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.hardEdge,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.white54,
                        BlendMode.dstIn,
                      ),
                      child: Image.network(
                        widget.imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              Builder(builder: (context) {
                final color = widget.isEnabled
                    ? context.colorTheme.onBackground
                    : context.colorTheme.onBackground.withOpacity(.2);
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera, color: color),
                      const SizedBox(width: 12),
                      Text(
                        _path != null ? 'Update Image' : 'Pick Image',
                        style:
                            context.textTheme.titleTiny.withColor(color).style,
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
