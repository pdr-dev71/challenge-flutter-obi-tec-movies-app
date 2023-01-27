import 'package:flutter/material.dart';
import 'package:movies_go/models/genres_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        height: 20,
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 30,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFF5FCFED),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
