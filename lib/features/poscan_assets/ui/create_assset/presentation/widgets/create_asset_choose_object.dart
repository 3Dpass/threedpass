import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/progress_indicator/progress_indicator.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/presentation/widgets/uploaded_object_dropdown_item.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';
import 'package:threedpass/features/poscan_objects_query/domain/usecase/get_user_objects_meta.dart';
import 'package:threedpass/setup.dart';

class CreateAssetChooseObject extends StatefulWidget {
  const CreateAssetChooseObject({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CreateAssetChooseObject> {
  @override
  void initState() {
    super.initState();
    loadObjects();
  }

  Future<void> loadObjects() async {
    try {
      final currentAcc =
          getIt<CurrentAccountCubit>().state.value!.nativeP3D.address;
      final userObjs = await getIt<GetUserObjectsMeta>()(currentAcc);
      final approved = userObjs.where(
        (final e) => e.status == UploadedObjectStatus.approved,
      );
      final res = approved
          .map(
            (final e) => DropdownMenuItem<UploadedObject>(
              value: e,
              child: UploadedObjectDropdownItem(e),
            ),
          )
          .toList();

      if (mounted)
        setState(() {
          items = res;
        });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to load objects. $e');
    }
  }

  List<DropdownMenuItem<UploadedObject>>? items;

  @override
  Widget build(final BuildContext context) {
    final cpac = BlocProvider.of<CreatePoscanAssetCubit>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const D3pBodyMediumText('create_asset_choose_object'),
        const H4(),
        SizedBox(
          height: 48,
          child: items != null
              ? BlocBuilder<CreatePoscanAssetCubit, CreatePoscanAssetState>(
                  builder: (final context, final state) {
                    return D3pDropdownButton<UploadedObject>(
                      items: items,
                      onChanged: cpac.setObject,
                      value: state.uploadedObject,
                    );
                  },
                )
              : const D3pProgressIndicator(size: 24),
        ),
      ],
    );
  }
}
