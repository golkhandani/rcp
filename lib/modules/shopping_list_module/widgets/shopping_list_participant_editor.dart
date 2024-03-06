import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/async_dropdown_menu.dart';

class AddParticipantCard extends StatefulWidget {
  const AddParticipantCard({
    super.key,
    required this.onUserInvited,
    required this.onEmailCheck,
    required this.isLoading,
    required this.isLoadingCandidates,
    required this.list,
  });

  final void Function(String email) onEmailCheck;
  final void Function(InvitationCandidate p) onUserInvited;
  final bool isLoading;
  final bool isLoadingCandidates;
  final List<InvitationCandidate> list;

  @override
  State<AddParticipantCard> createState() => _AddParticipantCardState();
}

class _AddParticipantCardState extends State<AddParticipantCard> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  bool _isLoadingCandidates = false;
  List<InvitationCandidate> _list = [];
  InvitationCandidate? _selected;

  @override
  void didUpdateWidget(covariant AddParticipantCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isLoading = widget.isLoading;
    _isLoadingCandidates = widget.isLoadingCandidates;
    _list = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: context.vWidth,
      child: Row(
        children: [
          Expanded(
            child: AsyncDropdownMenu<InvitationCandidate>(
              items: _list
                  .map(
                    (p) => DropdownMenuEntry(
                      label: "${p.safeName} (${p.email})",
                      value: p,
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                if (_controller.text !=
                    "${_selected?.safeName} (${_selected?.email})") {
                  setState(() {
                    _selected = null;
                  });
                  widget.onEmailCheck(val);
                }
              },
              controller: _controller,
              isLoading: _isLoadingCandidates,
              onSelected: (p) {
                _controller.text = "${p.safeName} (${p.email})";
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
                    widget.onUserInvited(_selected!);
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
    required this.isOwner,
  });

  final Participant participant;
  final void Function() onRemoved;
  final bool isLoading;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: participant.profile.fullName ??
                        participant.profile.username,
                    style: context
                        .typoraphyTheme.titleSmall.onCardBackground.textStyle,
                  ),
                  TextSpan(
                    text: '(${participant.email})',
                    style: context.typoraphyTheme.subtitleMedium
                        .onCardBackground.textStyle,
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            ignoring: isOwner,
            child: BasicElevatedButton(
              isLoading: isLoading,
              background: isOwner
                  ? context.colorTheme.primary
                  : participant.status == ParticipantStatus.invited
                      ? context.colorTheme.warning
                      : context.colorTheme.error,
              labelText: isOwner
                  ? 'Owner'
                  : participant.status == ParticipantStatus.invited
                      ? 'Cancel'
                      : 'Remove',
              onPressed: isOwner ? null : onRemoved,
            ),
          ),
        ],
      ),
    );
  }
}
