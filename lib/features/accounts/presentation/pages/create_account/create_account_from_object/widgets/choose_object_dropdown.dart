part of '../create_account_from_object.dart';

class _ChooseObjectDropdown extends StatelessWidget {
  const _ChooseObjectDropdown({
    required this.objectValueNotifier,
    required this.objectsToUse,
    required this.chosenHash,
  });

  final ValueNotifier<HashObject> objectValueNotifier;
  final List<HashObject> objectsToUse;
  final ValueNotifier<String> chosenHash;

  void onObjectChoose(final HashObject? hashObject) {
    if (hashObject != null) {
      objectValueNotifier.value = hashObject;
      chosenHash.value = hashObject.stableHashes.first;
    }
  }

  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: objectValueNotifier,
      builder: (final context, final _, final __) => DropdownButton<HashObject>(
        style: Theme.of(context).textTheme.bodyText1,
        value: objectValueNotifier.value,
        items: objectsToUse
            .map(
              (final e) => DropdownMenuItem<HashObject>(
                value: e,
                child: Text(
                  e.name.cutWithEllipsis(20),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
            .toList(),
        onChanged: (final modelChosen) => onObjectChoose(modelChosen),
      ),
    );
  }
}
