import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final void Function()? onTap;
  const MainButton({super.key,required this.label,this.buttonColor,this.textColor,required this.onTap});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
          color:widget.buttonColor?? Colors.purple,),
        child: Center(
          child: Text(
            widget.label, style: TextStyle(fontWeight: FontWeight.bold,color:widget.textColor?? Colors.white,fontSize:16)
            ,
          ),
        ),
      ),
    );
  }
}
