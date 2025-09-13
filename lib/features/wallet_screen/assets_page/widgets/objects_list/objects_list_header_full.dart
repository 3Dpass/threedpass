import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/disable_refresh_button.dart';
import 'package:threedpass/features/poscan_objects_query/bloc/user_objects_list_cubit.dart';

class UserObjectsListHeaderFull extends StatelessWidget {
  const UserObjectsListHeaderFull({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'objects_list_header'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        DisableRefreshButton(
          onPressed: () =>
              BlocProvider.of<UserObjectsListCubit>(context).load(),
          emptyContraints: true,
        ),
      ],
    );
  }
}
