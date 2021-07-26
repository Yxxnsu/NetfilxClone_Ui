import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;
  const VerticalIconButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Icon(icon, color:Colors.white),
          SizedBox(height: 2,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,            
            )
          )
        ],
      ),
    );
  }
}
