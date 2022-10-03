import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_text.dart';

part './widgets/create_account_stateful.dart';

class CreateAccountFromObject extends StatelessWidget {
  const CreateAccountFromObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AccountPageTemplate.create(
      children: [
        _CreateAccountStateful(),
      ],
      disableBottomButton: true,
    );
  }
}
