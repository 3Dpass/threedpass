part of '../create_account_from_object.dart';

class _CreateAccountStateful extends StatefulWidget {
  const _CreateAccountStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<_CreateAccountStateful> {
  late final ValueNotifier<HashObject> objectValueNotifier;
  // late final ValueNotifier<Snapshot> snapshotToUse;
  late final List<HashObject> objectsToUse;
  final ValueNotifier<String> chosenHash = ValueNotifier<String>('');

  @override
  void initState() {
    // Get objects with snapshots
    final hashObjects = BlocProvider.of<HashesListBloc>(context).state;

    assert(hashObjects is HashesListLoaded);
    hashObjects as HashesListLoaded;

    // Find objects with stable hashes
    final realObjects = hashObjects.objects
        .where((obj) => obj.stableHashes.isNotEmpty)
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

  void onObjectChoose(HashObject? hashObject) {
    if (hashObject != null) {
      objectValueNotifier.value = hashObject;
      chosenHash.value = hashObject.stableHashes.first;
    }
  }

  void onHashChoose(String? value) {
    if (value != null) {
      chosenHash.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose object',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            DropdownButton<HashObject>(
              style: Theme.of(context).textTheme.bodyText1,
              value: objectValueNotifier.value,
              items: objectsToUse
                  .map(
                    (e) => DropdownMenuItem<HashObject>(
                      value: e,
                      child: Text(
                        e.name.cutWithEllipsis(20),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (modelChosen) => onObjectChoose(modelChosen),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose stable hash',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: objectValueNotifier,
              builder: (context, _, __) => DropdownButton<String>(
                isExpanded: true,
                style: Theme.of(context).textTheme.bodyText1,
                value: chosenHash.value,
                items: objectValueNotifier.value.stableHashes
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (modelChosen) => onHashChoose(modelChosen),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'create_warn5_header'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('create_warn5_text'.tr()),
            const SizedBox(height: 24),
          ],
        ),
        _SubmitButton(chosenHash),
      ],
    );
  }
}
