import "package:flutter/material.dart";

class RoundedBottomBorder extends RoundedRectangleBorder {
  RoundedBottomBorder(double radius)
      : super(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius)));
}
