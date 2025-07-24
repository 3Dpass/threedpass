import 'package:flutter/material.dart';
import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/chains/domain/entities/resolved_account_name.dart';
import 'package:threedpass/core/chains/domain/usecases/resolve_name_by_address.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/wallet_screen/widgets/short_address.dart';
import 'package:threedpass/setup.dart';

class AccountIdentity extends StatefulWidget {
  final Address address;
  final String prefix;
  final bool colorSecondary;

  const AccountIdentity({
    required this.address,
    required this.prefix,
    required this.colorSecondary,
  });

  @override
  State<StatefulWidget> createState() => _AccountIdentityState();
}

class _AccountIdentityState extends State<AccountIdentity> {
  ResolvedAccountName? name;

  @override
  void initState() {
    super.initState();
    getIt<ResolveNameByAddress>().safeCall(
      params: widget.address,
      onError: (p0, p1) =>
          logger.e('Could not resolve name for ${widget.address}'),
      onSuccess: (p0) {
        if (mounted && p0 != null) {
          setState(() => name = p0);
        }
      },
    );
  }

  IconData resolveIcon(ResolvedNameSource source) {
    switch (source) {
      case ResolvedNameSource.onChainIdentity:
        return Icons.cloud_outlined;
      case ResolvedNameSource.accounts:
        return Icons.perm_identity;
      case ResolvedNameSource.contacts:
        return Icons.contacts;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (name != null) {
      return ShortAddress(
        prefix: widget.prefix,
        address: name!.name,
        colorSecondary: widget.colorSecondary,
        spanIcon: Icon(resolveIcon(name!.source)),
      );
    } else {
      return ShortAddress(
        prefix: widget.prefix,
        address: widget.address,
        colorSecondary: widget.colorSecondary,
      );
    }
  }
}
