part of '../create_account_from_object.dart';

class _CreateAccountStateful extends StatefulWidget {
  const _CreateAccountStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<_CreateAccountStateful> {
  late final ValueNotifier<HashObject> objectValueNotifier;
  late final ValueNotifier<Snapshot> snapshotToUse;
  late final List<HashObject> objectsToUse;

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
    snapshotToUse = ValueNotifier(objectValueNotifier.value.snapshots.first);
    objectsToUse = realObjects;
    super.initState();
  }

  void onObjectChoose(HashObject? hashObject) {
    if (hashObject != null) {
      objectValueNotifier.value = hashObject;
      snapshotToUse.value = hashObject.snapshots.first;
    }
  }

  void onSnapshotChoose(Snapshot? snapshot) {
    if (snapshot != null) {
      snapshotToUse.value = snapshot;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Choose object'),
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
        ValueListenableBuilder(
          valueListenable: objectValueNotifier,
          builder: (context, _, __) => Column(
            children: [
              Text('Choose snapshot'),
              DropdownButton<Snapshot>(
                style: Theme.of(context).textTheme.bodyText1,
                value: snapshotToUse.value,
                items: objectValueNotifier.value.snapshots
                    .map(
                      (e) => DropdownMenuItem<Snapshot>(
                        value: e,
                        child: Text(
                          e.name.cutWithEllipsis(20),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (modelChosen) => onSnapshotChoose(modelChosen),
              ),
            ],
          ),
        ),

        // Settings
        ValueListenableBuilder(
          valueListenable: snapshotToUse,
          builder: (context, _, __) => Column(
            children: [
              Text('Settings'),
              Text.rich(
                snapshotToUse.value.settingsConfig.toText(context),
              ),
            ],
          ),
        ),

        D3pElevatedButton(text: 'Create', onPressed: () {}),
      ],
    );
  }
}
