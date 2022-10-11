part of '../create_account_from_object.dart';

class _CreateAccountStateful extends StatefulWidget {
  const _CreateAccountStateful({final Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<_CreateAccountStateful> {
  late final ValueNotifier<HashObject> objectValueNotifier;
  late final List<HashObject> objectsToUse;
  final ValueNotifier<String> chosenHash = ValueNotifier<String>('');

  @override
  void initState() {
    // Get objects with snapshots
    final hashObjects = BlocProvider.of<HashesListBloc>(context).state;

    assert(
      hashObjects is HashesListLoaded,
      'Hashes list has to be loaded to create preview',
    );
    hashObjects as HashesListLoaded;

    // Find objects with stable hashes
    final realObjects = hashObjects.objects
        .where((final obj) => obj.stableHashes.isNotEmpty)
        .toList();

    if (realObjects.isEmpty) {
      context.router.pop();
      Fluttertoast.showToast(
        msg: 'create_from_object_error_no_stable_hashes'.tr(),
      );
    }

    objectValueNotifier = ValueNotifier(realObjects.first);
    // snapshotToUse = ValueNotifier(objectValueNotifier.value.snapshots.first);
    objectsToUse = realObjects;
    chosenHash.value = realObjects.first.stableHashes.first;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ChooseObjectTitle(),
            const SizedBox8(),
            _ChooseObjectDropdown(
              objectValueNotifier: objectValueNotifier,
              objectsToUse: objectsToUse,
              chosenHash: chosenHash,
            ),
            const SizedBox24(),
            const _ChooseHashTitle(),
            const SizedBox8(),
            _ChooseHashDropdown(
              chosenHash: chosenHash,
              objectValueNotifier: objectValueNotifier,
            ),
            const SizedBox36(),
            ...const _ObjectAccountInfo().warnInfo(),
            const SizedBox24(),
          ],
        ),
        _SubmitButton(chosenHash),
      ],
    );
  }
}
