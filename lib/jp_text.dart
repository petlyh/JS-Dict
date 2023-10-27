import "package:flutter/material.dart";

const _jpLocale = Locale("ja");

class JpText extends Text {
  const JpText(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale = _jpLocale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  });
}

const jpTextStyle = TextStyle(locale: _jpLocale);

extension JpTextStyle on TextStyle {
  TextStyle jp() => copyWith(locale: _jpLocale);
}
