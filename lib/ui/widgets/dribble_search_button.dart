import 'package:flutter/material.dart';
import 'package:multiple_animations/ui/utils/dribbble_colors.dart';

class DribbleSearchButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DribbleSearchButton(this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: DribbleColors.button,
        shadowColor: Colors.blue,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.white,
          child: Center(
              child: Container(
            constraints: BoxConstraints.tightFor(
              width: 40.0,
              height: 40.0,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
