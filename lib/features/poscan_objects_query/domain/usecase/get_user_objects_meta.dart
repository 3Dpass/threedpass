import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/chains/domain/entities/address.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_owned_objects_ids.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

class GetUserObjectsMeta extends UseCase<List<UploadedObject>, Address> {
  final GetOwnedObjectsIds ownedObjectsIds;
  final GetUploadedObject uploadedObject;

  const GetUserObjectsMeta({
    required this.ownedObjectsIds,
    required this.uploadedObject,
  });

  @override
  Future<List<UploadedObject>> call(final Address currentAcc) async {
    final ids = await ownedObjectsIds(currentAcc);
    return Future.wait(
      List.generate(
        ids.length,
        (final index) async {
          final id = ids[index];
          return uploadedObject(id);
        },
      ),
    );
  }
}
