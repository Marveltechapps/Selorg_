import 'package:flutter/material.dart';

class NormalFilledButton extends StatefulWidget {
  final String text;
  final GestureTapCallback onPressed;
  final bool showLoading;

  NormalFilledButton(this.text, this.onPressed, [this.showLoading = false]);

  @override
  State<StatefulWidget> createState() => NormalFilledButtonState();
}

class NormalFilledButtonState extends State<NormalFilledButton> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.showLoading ? Container(
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: const LinearProgressIndicator()) : Container(),
        FilledButton(
        onPressed: widget.showLoading ? null : widget.onPressed,
        child: Text(
          widget.text
        ),
      ),
    ]
    );
  }

}
