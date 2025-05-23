import 'package:flutter/material.dart';

class RoundedLoadingButton extends StatefulWidget {
  final Widget? child;
  final bool? isLoading;
  final Function()? onPressed;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final Widget? loadingWidget;

  const RoundedLoadingButton({
    super.key,
    this.child,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.decoration,
    this.loadingWidget,
  });

  @override
  _RoundedLoadingButtonState createState() => _RoundedLoadingButtonState();
}

class _RoundedLoadingButtonState extends State<RoundedLoadingButton> {
  BoxDecoration? decoration;
  Widget? loadingWidget;
  Color? textDefaultColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buildDecoration();
    buildLoadingWidget();
  }

  void buildDecoration() {
    final bgColor = widget.backgroundColor ?? Theme.of(context).primaryColor;

    textDefaultColor =
        (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark)
            ? Colors.white
            : Colors.black;

    decoration = widget.decoration ??
        BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
        );
  }

  void buildLoadingWidget() {
    loadingWidget = loadingWidget ??
        SizedBox(
          width: 25,
          height: 25,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(textDefaultColor!),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    buildDecoration();
    return Material(
      child: DefaultTextStyle(
        style: TextStyle(color: textDefaultColor),
        child: InkWell(
          onTap: widget.isLoading! ? null : widget.onPressed,
          child: AnimatedContainer(
            padding: widget.isLoading!
                ? EdgeInsets.all(10)
                : EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            decoration: widget.isLoading!
                ? decoration!.copyWith(borderRadius: BorderRadius.circular(100))
                : decoration,
            child: widget.isLoading! ? loadingWidget : widget.child,
          ),
        ),
      ),
    );
  }
}
