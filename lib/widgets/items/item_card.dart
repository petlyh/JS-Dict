import "package:flutter/material.dart";

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.child,
    required this.onTap,
    required this.onLongPress,
  });

  final Widget child;
  final void Function() onTap;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
