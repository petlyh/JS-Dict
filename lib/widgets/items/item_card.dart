import "package:flutter/material.dart";

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key, required this.child, this.onTap, this.onLongPress});

  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap ?? () => {},
        onLongPress: onLongPress ?? () => {},
        child: child,
      ),
    );
  }
}
