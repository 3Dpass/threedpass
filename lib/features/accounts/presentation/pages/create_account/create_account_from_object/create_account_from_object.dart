import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/header_info.dart';
import 'package:threedpass/features/accounts/presentation/widgets/text_info.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/router/router.gr.dart';

part './widgets/create_account_stateful.dart';
part './widgets/submit_button.dart';
part './widgets/object_account_info.dart';
part './widgets/choose_hash_title.dart';
part './widgets/choose_hash_dropdown.dart';
part './widgets/choose_object_title.dart';
part './widgets/choose_object_dropdown.dart';

@RoutePage()
class CreateAccountFromObjectPage extends StatelessWidget {
  const CreateAccountFromObjectPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      appbarTitle: AccountAppbarTitle.import,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 36),
          child: _CreateAccountStateful(),
        ),
      ),
    );
  }
}
