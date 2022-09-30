import 'package:flutter/material.dart';

class FoodType extends StatefulWidget {
  final String typeName;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const FoodType({
    required this.typeName,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<FoodType> createState() => _FoodTypeState();
}

class _FoodTypeState extends State<FoodType> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: widget.isSelected == false ? Colors.grey : Colors.black),),
        child: Center(child: Text('${widget.emoji} ${widget.typeName}', style: TextStyle(color: widget.isSelected == false ? Colors.grey : Colors.black ),)),
      ),
    );
  }
}
