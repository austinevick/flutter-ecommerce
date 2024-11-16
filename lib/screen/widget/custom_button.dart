import 'package:e_commerce_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final BorderSide? borderSide;
  final double? radius;
  final double? textSize;
  final FontWeight? fontWeight;
  final bool isLoading;
  final double padding;
  final double margin;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.textColor,
      this.text,
      this.color = AppColors.primaryColor,
      this.child,
      this.width = double.infinity,
      this.height = 50,
      this.borderSide,
      this.radius = 60,
      this.padding = 0,
      this.margin = 0,
      this.isLoading = false,
      this.textSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading ? true : false, //Disable button on loading state
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(margin),
          child: MaterialButton(
            padding: EdgeInsets.all(padding),
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            onPressed: onPressed ?? () {},
            color: isLoading ? AppColors.primaryColor.withOpacity(0.6) : color,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!),
                borderSide: borderSide ?? BorderSide.none),
            child: child ??
                Text(text ?? '',
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: textSize ?? 14,
                        fontFamily: 'GeneralSans',
                        fontWeight: fontWeight ?? FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

class ButtonLoader extends StatelessWidget {
  final bool isLoading;
  final String? text;
  final Color? textColor;
  final Color? color;
  const ButtonLoader(
      {super.key,
      required this.isLoading,
      required this.text,
      this.textColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Text(
            text!,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          )
        : Center(
            child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                    color: color ?? Colors.white, strokeWidth: 2)),
          );
  }
}
