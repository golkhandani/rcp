import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/async_dropdown_menu.dart';

class AddParticipantCard extends StatefulWidget {
  const AddParticipantCard({
    super.key,
    required this.onParticipantInvited,
    required this.isLoading,
  });

  final void Function(Participant p) onParticipantInvited;
  final bool isLoading;

  @override
  State<AddParticipantCard> createState() => _AddParticipantCardState();
}

class _AddParticipantCardState extends State<AddParticipantCard> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  List<Participant> _list = [];
  Participant? _selected;

  _searchParticipants() {
    setState(() {
      _isLoading = true;
    });
    final list = generateFakeParticipantData(10);
    setState(() {
      _isLoading = false;
      _list = list;
    });
  }

  @override
  void didUpdateWidget(covariant AddParticipantCard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _isLoading = widget.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: context.vWidth,
      child: Row(
        children: [
          Expanded(
            child: AsyncDropdownMenu<Participant>(
              items: _list
                  .map(
                    (p) => DropdownMenuEntry(
                      label: p.email,
                      value: p,
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                _searchParticipants();
              },
              controller: _controller,
              isLoading: _isLoading,
              onSelected: (p) {
                _controller.text = p.profile.fullName ?? p.profile.username;
                setState(() {
                  _selected = p;
                });
              },
              isEnabled: true,
            ),
          ),
          const Gap(8),
          BasicElevatedButton(
            isLoading: _isLoading,
            labelText: 'Add',
            onPressed: _selected == null
                ? null
                : () {
                    _controller.text = '';
                    _list = [];
                    widget.onParticipantInvited(_selected!);
                  },
          ),
        ],
      ),
    );
  }
}

class CurrentParticipantCard extends StatelessWidget {
  const CurrentParticipantCard({
    super.key,
    required this.participant,
    required this.onRemoved,
    required this.isLoading,
  });

  final Participant participant;
  final void Function() onRemoved;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Chip(
            color: MaterialStatePropertyAll(
              context.colorTheme.primary,
            ),
            labelPadding: const EdgeInsets.all(4),
            label: Text(
              participant.profile.fullName ?? participant.profile.username,
              style: context.typoraphyTheme.subtitleLarge.onPrimary.textStyle,
            ),
          ),
          const Gap(4),
          Expanded(
            child: Text(
              participant.email,
              style: context
                  .typoraphyTheme.subtitleMedium.onCardBackground.textStyle,
            ),
          ),
          BasicElevatedButton(
            isLoading: isLoading,
            background: participant.status == ParticipantStatus.invited
                ? context.colorTheme.warning
                : context.colorTheme.error,
            labelText: participant.status == ParticipantStatus.invited
                ? 'Cancel'
                : 'Remove',
            onPressed: onRemoved,
          ),
        ],
      ),
    );
  }
}
