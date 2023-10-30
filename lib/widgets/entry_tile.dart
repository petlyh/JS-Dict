import "package:flutter/material.dart";

/// Custom ListTile
/// 
/// Adds a trailing right-arrow if [onTap] is not null.
/// Rounds the bottom corners if [isLast] is true.
class EntryTile extends ListTile {
  static const _roundedBottomBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)));

  const EntryTile({
    super.key,
    super.leading,
    super.title,
    super.subtitle,
    super.isThreeLine = false,
    super.dense,
    super.visualDensity,
    super.style,
    super.selectedColor,
    super.iconColor,
    super.textColor,
    super.titleTextStyle,
    super.subtitleTextStyle,
    super.leadingAndTrailingTextStyle,
    super.contentPadding,
    super.enabled = true,
    super.onTap,
    super.onLongPress,
    super.onFocusChange,
    super.mouseCursor,
    super.selected = false,
    super.focusColor,
    super.hoverColor,
    super.splashColor,
    super.focusNode,
    super.autofocus = false,
    super.tileColor,
    super.selectedTileColor,
    super.enableFeedback,
    super.horizontalTitleGap,
    super.minVerticalPadding,
    super.minLeadingWidth,
    super.titleAlignment,
    bool isLast = false,
  }) : super(
            trailing:
                onTap != null ? const Icon(Icons.keyboard_arrow_right) : null,
            shape: isLast ? _roundedBottomBorder : null);
}
