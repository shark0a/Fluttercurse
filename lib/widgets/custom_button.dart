import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ontap,
    this.width = 280,
    required this.color,
    required this.label,
  });
  final void Function()? ontap;
  final double width;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(width, 20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
}
