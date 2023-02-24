import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/cut_string.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/features/compare_page/bloc/compare_cubit.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/compare_table.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

part '../widgets/orig_obj_title.dart';
part '../widgets/compare_row.dart';
part '../widgets/choose_list.dart';

class ComparePage extends StatelessWidget {
  const ComparePage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return D3pScaffold(
      appbarTitle: 'compare_page_appbar',
      body: Column(
        children: const [
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CompareRow(),
            ),
          ),
          Divider(
            height: 15,
            thickness: 3,
            color: Colors.black,
          ),
          CompareTable(),
        ],
      ),
    );
  }
}
