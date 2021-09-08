import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final Function onClick;
  final Widget childWidget;
  final Color color;
  const LoadingButton({required this.onClick,required this.childWidget,required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick(),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 55,
        child: childWidget,
      ),
    );
  }
}
