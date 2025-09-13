import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class DisableRefreshButton extends StatefulWidget {
  final void Function()? onPressed;
  final int coolDownSeconds;
  final bool emptyContraints;

  DisableRefreshButton({
    required this.onPressed,
    this.coolDownSeconds = 120,
    this.emptyContraints = false,
  });

  @override
  _DisableButtonState createState() => _DisableButtonState();
}

class _DisableButtonState extends State<DisableRefreshButton> {
  int _remainingSeconds = 0;
  Timer? _timer;

  void _onPressed() {
    if (_remainingSeconds > 0) {
      Fluttertoast.showToast(msg: 'Please wait ${_remainingSeconds}s');
      return;
    }

    widget.onPressed?.call();
    if (mounted)
      setState(() {
        _remainingSeconds = widget.coolDownSeconds;
      });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted)
        setState(() {
          _remainingSeconds--;
        });
      if (_remainingSeconds <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return D3pIconButton(
      onPressed: _onPressed,
      iconData: Icons.refresh,
      emptyContraints: widget.emptyContraints,
    );
  }
}
