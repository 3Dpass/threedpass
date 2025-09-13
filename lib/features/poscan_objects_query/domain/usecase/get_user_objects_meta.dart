import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_owned_objects_ids.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_uploaded_object.dart';

// TODO get objects for given account and accept the account as parameter
class GetCurrentUserObjectsMeta extends UseCase<List<UploadedObject>, void> {
  final GetOwnedObjectsIds ownedObjectsIds;
  final GetUploadedObject uploadedObject;
  final CurrentAccountCubit currentAccountCubit;

  const GetCurrentUserObjectsMeta({
    required this.ownedObjectsIds,
    required this.uploadedObject,
    required this.currentAccountCubit,
  });

  @override
  Future<List<UploadedObject>> call(final void _) async {
    final currentAcc = currentAccountCubit.state.value!.nativeP3D.address;
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
