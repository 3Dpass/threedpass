part of '../create_account_from_object.dart';

class _ChooseHashDropdown extends StatelessWidget {
  const _ChooseHashDropdown({
    required this.objectValueNotifier,
    required this.chosenHash,
  });

  final ValueNotifier<HashObject> objectValueNotifier;
  final ValueNotifier<HexEx> chosenHash;

  void onHashChoose(final HexEx? value) {
    if (value != null) {
      chosenHash.value = value;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: objectValueNotifier,
      builder: (final ___, final HashObject hashObject, final __) =>
          ValueListenableBuilder(
        valueListenable: chosenHash,
        builder: (final context, final _, final __) => SizedBox(
          // height: 55,
          child: _DropdownButtonString(
            // context: context,
            hashObject: hashObject,
            chosenHash: chosenHash,
            onChanged: (final HexEx? modelChosen) => onHashChoose(modelChosen),
          ),
        ),
      ),
    );
  }
}

class _DropdownButtonString extends D3pDropdownButton<HexEx> {
  _DropdownButtonString({
    required final HashObject hashObject,
    required super.onChanged,
    required final ValueNotifier<HexEx> chosenHash,
  }) : super(
          isExpanded: true,
          value: chosenHash.value,
          items: hashObject.stableHashes
              .map(
                (final e) => DropdownMenuItem<HexEx>(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      e.prefixValue,
                      maxLines: 3,
                    ),
                  ),
                ),
              )
              .toList(),
        );
}
