import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BouncingButton extends StatefulWidget {
  VoidCallback callback;
  bool? isFixedHeight;
  bool? isEnabled;
  Widget content;
  double? scale;
  bool? isLoading;
  double? minimumHeight;
  double? minimumWidth;
  bool? enableShadow;
  Color? bgColor;
  bool? enableDarken;
  bool? enableBouncing;
  double? borderWidth;
  Color? disabledColor;
  Color? borderColor;
  double? borderRadius;
  BouncingButton({
    Key? key,
    required this.callback,
    required this.content,
    this.enableDarken = true,
    this.isEnabled = true,
    this.isFixedHeight = true,
    this.minimumHeight,
    this.isLoading = false,
    this.scale = 10.0,
    this.minimumWidth,
    this.disabledColor,
    this.enableBouncing = true,
    this.borderRadius = 8.0,
    // this.borderRadius = 100.0,
    this.enableShadow = false,
    this.bgColor,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  late AnimationController _controller;
  Color? bgColor;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
      setState(() {});
    });
    bgColor = widget.bgColor ?? Colors.black54;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value / widget.scale!;
    return GestureDetector(
      onTap: (widget.isEnabled == true) ? widget.callback : null,
      onTapDown: (widget.isEnabled == true) ? _tapDown : null,
      onTapUp: (widget.isEnabled == true) ? _tapUp : null,
      onTapCancel: () {
        if (widget.isEnabled == true) {
          if (widget.enableBouncing == true) {
            _controller.reverse();
          }
          if (widget.enableDarken == true) {
            setState(() {
              bgColor = lighten(bgColor);
            });
          }
        } else {
          null;
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: (widget.isFixedHeight == false)
                ? (widget.minimumHeight ??
                MediaQuery.of(context).size.height / 50)
                : 0.0,
          ),
          height: (widget.isFixedHeight == true)
              ? (widget.minimumHeight ??
              MediaQuery.of(context).size.height / 15)
              : null,
          width: widget.minimumWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            border: Border.all(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderWidth ?? 0),
            boxShadow: [
              if (widget.enableShadow == true)
                BoxShadow(
                  color: const Color.fromARGB(61, 0, 0, 0),
                  blurRadius: 5.0.r,
                  offset: const Offset(0.0, 1.0),
                ),
            ],
            color: (widget.isEnabled == true)
                ? (bgColor ?? Colors.black54)
                : ((widget.disabledColor == null)
                ? const Color(
                0xFFEBEBEB) /*darken(bgColor ?? Colors.black54)*/
                : widget.disabledColor),
          ),
          child: (widget.isLoading!)
              ? Center(
            child: SizedBox(
              height: 18.0.h,
              width: 18.0.w,
              child: const CircularProgressIndicator(),
            ),
          )
              : Center(child: widget.content),
        ),
      ),
    );
  }

  Color darken(Color? color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color!);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color? color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color!);
    final hslLight =
    hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  void _tapDown(TapDownDetails details) {
    if (widget.enableBouncing == true) {
      _controller.forward();
    }
    if (widget.enableDarken == true) {
      setState(() {
        bgColor = darken(bgColor);
      });
    }
  }

  void _tapUp(TapUpDetails details) {
    if (widget.enableBouncing == true) {
      _controller.reverse();
    }
    setState(() {
      if (widget.enableDarken == true) {
        bgColor = lighten(bgColor);
      }
    });
  }
}
