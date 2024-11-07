import "package:flutter/material.dart";

class RoundedBottomBorder extends RoundedRectangleBorder {
  RoundedBottomBorder({double radius = 8})
      : super(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
        );
}
