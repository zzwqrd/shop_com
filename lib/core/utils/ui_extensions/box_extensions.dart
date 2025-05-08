import 'package:flutter/material.dart';

/// Comprehensive Box and Container Extensions for Flutter
extension BoxExtensions on Widget {
  // Basic Container Wrapping
  Widget container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) =>
      Container(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  // Padding Extensions
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget get p0 => paddingAll(0);
  Widget get p1 => paddingAll(4);
  Widget get p2 => paddingAll(8);
  Widget get p3 => paddingAll(12);
  Widget get p4 => paddingAll(16);
  Widget get p5 => paddingAll(20);
  Widget get p6 => paddingAll(24);
  Widget get p8 => paddingAll(32);
  Widget get p10 => paddingAll(40);
  Widget get p12 => paddingAll(48);

  Widget get px1 => paddingSymmetric(horizontal: 4);
  Widget get px2 => paddingSymmetric(horizontal: 8);
  Widget get px3 => paddingSymmetric(horizontal: 12);
  Widget get px4 => paddingSymmetric(horizontal: 16);
  Widget get px5 => paddingSymmetric(horizontal: 20);
  Widget get px6 => paddingSymmetric(horizontal: 24);
  Widget get px8 => paddingSymmetric(horizontal: 32);

  Widget get py1 => paddingSymmetric(vertical: 4);
  Widget get py2 => paddingSymmetric(vertical: 8);
  Widget get py3 => paddingSymmetric(vertical: 12);
  Widget get py4 => paddingSymmetric(vertical: 16);
  Widget get py5 => paddingSymmetric(vertical: 20);
  Widget get py6 => paddingSymmetric(vertical: 24);
  Widget get py8 => paddingSymmetric(vertical: 32);

  Widget get pt1 => paddingOnly(top: 4);
  Widget get pt2 => paddingOnly(top: 8);
  Widget get pt3 => paddingOnly(top: 12);
  Widget get pt4 => paddingOnly(top: 16);
  Widget get pt5 => paddingOnly(top: 20);
  Widget get pt6 => paddingOnly(top: 24);
  Widget get pt8 => paddingOnly(top: 32);

  Widget get pb1 => paddingOnly(bottom: 4);
  Widget get pb2 => paddingOnly(bottom: 8);
  Widget get pb3 => paddingOnly(bottom: 12);
  Widget get pb4 => paddingOnly(bottom: 16);
  Widget get pb5 => paddingOnly(bottom: 20);
  Widget get pb6 => paddingOnly(bottom: 24);
  Widget get pb8 => paddingOnly(bottom: 32);

  Widget get pl1 => paddingOnly(left: 4);
  Widget get pl2 => paddingOnly(left: 8);
  Widget get pl3 => paddingOnly(left: 12);
  Widget get pl4 => paddingOnly(left: 16);
  Widget get pl5 => paddingOnly(left: 20);
  Widget get pl6 => paddingOnly(left: 24);
  Widget get pl8 => paddingOnly(left: 32);

  Widget get pr1 => paddingOnly(right: 4);
  Widget get pr2 => paddingOnly(right: 8);
  Widget get pr3 => paddingOnly(right: 12);
  Widget get pr4 => paddingOnly(right: 16);
  Widget get pr5 => paddingOnly(right: 20);
  Widget get pr6 => paddingOnly(right: 24);
  Widget get pr8 => paddingOnly(right: 32);

  // Margin Extensions
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Container(
        margin:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  Widget get m0 => marginAll(0);
  Widget get m1 => marginAll(4);
  Widget get m2 => marginAll(8);
  Widget get m3 => marginAll(12);
  Widget get m4 => marginAll(16);
  Widget get m5 => marginAll(20);
  Widget get m6 => marginAll(24);
  Widget get m8 => marginAll(32);
  Widget get m10 => marginAll(40);
  Widget get m12 => marginAll(48);

  Widget get mx1 => marginSymmetric(horizontal: 4);
  Widget get mx2 => marginSymmetric(horizontal: 8);
  Widget get mx3 => marginSymmetric(horizontal: 12);
  Widget get mx4 => marginSymmetric(horizontal: 16);
  Widget get mx5 => marginSymmetric(horizontal: 20);
  Widget get mx6 => marginSymmetric(horizontal: 24);
  Widget get mx8 => marginSymmetric(horizontal: 32);
  Widget get mxAuto => Center(child: this);

  Widget get my1 => marginSymmetric(vertical: 4);
  Widget get my2 => marginSymmetric(vertical: 8);
  Widget get my3 => marginSymmetric(vertical: 12);
  Widget get my4 => marginSymmetric(vertical: 16);
  Widget get my5 => marginSymmetric(vertical: 20);
  Widget get my6 => marginSymmetric(vertical: 24);
  Widget get my8 => marginSymmetric(vertical: 32);

  Widget get mt1 => marginOnly(top: 4);
  Widget get mt2 => marginOnly(top: 8);
  Widget get mt3 => marginOnly(top: 12);
  Widget get mt4 => marginOnly(top: 16);
  Widget get mt5 => marginOnly(top: 20);
  Widget get mt6 => marginOnly(top: 24);
  Widget get mt8 => marginOnly(top: 32);
  Widget get mtAuto => Column(children: [const Spacer(), this]);

  Widget get mb1 => marginOnly(bottom: 4);
  Widget get mb2 => marginOnly(bottom: 8);
  Widget get mb3 => marginOnly(bottom: 12);
  Widget get mb4 => marginOnly(bottom: 16);
  Widget get mb5 => marginOnly(bottom: 20);
  Widget get mb6 => marginOnly(bottom: 24);
  Widget get mb8 => marginOnly(bottom: 32);
  Widget get mbAuto => Column(children: [this, const Spacer()]);

  Widget get ml1 => marginOnly(left: 4);
  Widget get ml2 => marginOnly(left: 8);
  Widget get ml3 => marginOnly(left: 12);
  Widget get ml4 => marginOnly(left: 16);
  Widget get ml5 => marginOnly(left: 20);
  Widget get ml6 => marginOnly(left: 24);
  Widget get ml8 => marginOnly(left: 32);
  Widget get mlAuto => Row(children: [const Spacer(), this]);

  Widget get mr1 => marginOnly(right: 4);
  Widget get mr2 => marginOnly(right: 8);
  Widget get mr3 => marginOnly(right: 12);
  Widget get mr4 => marginOnly(right: 16);
  Widget get mr5 => marginOnly(right: 20);
  Widget get mr6 => marginOnly(right: 24);
  Widget get mr8 => marginOnly(right: 32);
  Widget get mrAuto => Row(children: [this, const Spacer()]);

  // Background Colors
  Widget backgroundColor(Color color) => Container(color: color, child: this);
  Widget get bgTransparent => backgroundColor(Colors.transparent);
  Widget get bgWhite => backgroundColor(Colors.white);
  Widget get bgBlack => backgroundColor(Colors.black);
  Widget get bgGrey => backgroundColor(Colors.grey);
  Widget get bgRed => backgroundColor(Colors.red);
  Widget get bgBlue => backgroundColor(Colors.blue);
  Widget get bgGreen => backgroundColor(Colors.green);
  Widget get bgYellow => backgroundColor(Colors.yellow);
  Widget get bgOrange => backgroundColor(Colors.orange);
  Widget get bgPurple => backgroundColor(Colors.purple);
  Widget get bgPink => backgroundColor(Colors.pink);
  Widget get bgTeal => backgroundColor(Colors.teal);
  Widget get bgIndigo => backgroundColor(Colors.indigo);
  Widget get bgCyan => backgroundColor(Colors.cyan);
  Widget get bgAmber => backgroundColor(Colors.amber);
  Widget get bgLime => backgroundColor(Colors.lime);
  Widget get bgBrown => backgroundColor(Colors.brown);

  // Border Radius
  Widget borderRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  Widget get rounded => borderRadius(BorderRadius.circular(4));
  Widget get roundedSM => borderRadius(BorderRadius.circular(2));
  Widget get roundedMD => borderRadius(BorderRadius.circular(6));
  Widget get roundedLG => borderRadius(BorderRadius.circular(8));
  Widget get roundedXL => borderRadius(BorderRadius.circular(12));
  Widget get rounded2XL => borderRadius(BorderRadius.circular(16));
  Widget get rounded3XL => borderRadius(BorderRadius.circular(24));
  Widget get roundedFull => borderRadius(BorderRadius.circular(9999));

  Widget get roundedT => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: this,
      );

  Widget get roundedB => ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: this,
      );

  Widget get roundedL => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        child: this,
      );

  Widget get roundedR => ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: this,
      );

  // Borders
  Widget border({
    Color color = Colors.grey,
    double width = 1,
    BorderRadius? borderRadius,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: borderRadius,
        ),
        child: this,
      );

  Widget get border1 => border(width: 1);
  Widget get border2 => border(width: 2);
  Widget get border4 => border(width: 4);
  Widget get border8 => border(width: 8);

  Widget borderColor(Color color) => border(color: color);
  Widget get borderGrey => borderColor(Colors.grey);
  Widget get borderBlack => borderColor(Colors.black);
  Widget get borderWhite => borderColor(Colors.white);
  Widget get borderRed => borderColor(Colors.red);
  Widget get borderBlue => borderColor(Colors.blue);
  Widget get borderGreen => borderColor(Colors.green);

  Widget borderT({Color color = Colors.grey, double width = 1}) => Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  Widget borderB({Color color = Colors.grey, double width = 1}) => Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  Widget borderL({Color color = Colors.grey, double width = 1}) => Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  Widget borderR({Color color = Colors.grey, double width = 1}) => Container(
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: color, width: width)),
        ),
        child: this,
      );

  // Shadows
  Widget shadow({
    Color color = Colors.black,
    double opacity = 0.1,
    double blurRadius = 8,
    Offset offset = const Offset(0, 2),
    BorderRadius? borderRadius,
  }) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
        child: this,
      );

  Widget get shadowSM => shadow(blurRadius: 2, offset: const Offset(0, 1));
  Widget get shadowMD => shadow(blurRadius: 4, offset: const Offset(0, 2));
  Widget get shadowLG => shadow(blurRadius: 8, offset: const Offset(0, 4));
  Widget get shadowXL => shadow(blurRadius: 16, offset: const Offset(0, 8));
  Widget get shadow2XL => shadow(blurRadius: 24, offset: const Offset(0, 12));
  Widget get shadowInner => shadow(blurRadius: 4, offset: const Offset(0, -2));

  // Elevation (Material Design)
  Widget elevation(double elevation) => Material(
        elevation: elevation,
        child: this,
      );

  Widget get elevation0 => elevation(0);
  Widget get elevation1 => elevation(1);
  Widget get elevation2 => elevation(2);
  Widget get elevation3 => elevation(3);
  Widget get elevation4 => elevation(4);
  Widget get elevation6 => elevation(6);
  Widget get elevation8 => elevation(8);
  Widget get elevation12 => elevation(12);
  Widget get elevation16 => elevation(16);
  Widget get elevation24 => elevation(24);

  // Gradients
  Widget gradient(Gradient gradient) => Container(
        decoration: BoxDecoration(gradient: gradient),
        child: this,
      );

  Widget linearGradient({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    List<double>? stops,
  }) =>
      gradient(LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
        stops: stops,
      ));

  Widget radialGradient({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<double>? stops,
  }) =>
      gradient(RadialGradient(
        colors: colors,
        center: center,
        radius: radius,
        stops: stops,
      ));

  Widget sweepGradient({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = 6.28,
    List<double>? stops,
  }) =>
      gradient(SweepGradient(
        colors: colors,
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        stops: stops,
      ));

  // Opacity
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);
  Widget get opacity0 => opacity(0.0);
  Widget get opacity25 => opacity(0.25);
  Widget get opacity50 => opacity(0.5);
  Widget get opacity75 => opacity(0.75);
  Widget get opacity100 => opacity(1.0);

  // Visibility
  Widget visible(bool isVisible) => Visibility(visible: isVisible, child: this);
  Widget get invisible => visible(false);
  Widget get hidden => Visibility(child: this);

  // Clipping
  Widget clipRect() => ClipRect(child: this);
  Widget clipOval() => ClipOval(child: this);
  Widget clipPath(CustomClipper<Path> clipper) =>
      ClipPath(clipper: clipper, child: this);

  // Transforms
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);
  Widget scale(double scale) => Transform.scale(scale: scale, child: this);
  Widget translate({double x = 0, double y = 0}) => Transform.translate(
        offset: Offset(x, y),
        child: this,
      );

  Widget get rotate45 => rotate(0.785398); // 45 degrees in radians
  Widget get rotate90 => rotate(1.570796); // 90 degrees in radians
  Widget get rotate180 => rotate(3.141593); // 180 degrees in radians
  Widget get rotate270 => rotate(4.712389); // 270 degrees in radians

  Widget get scaleHalf => scale(0.5);
  Widget get scale75 => scale(0.75);
  Widget get scale110 => scale(1.1);
  Widget get scale125 => scale(1.25);
  Widget get scale150 => scale(1.5);
  Widget get scale200 => scale(2.0);

  // Flex Properties
  Widget flex([int flex = 1]) => Flexible(flex: flex, child: this);
  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);
  Widget get flexNone => this;
  Widget get flex1 => flex(1);
  Widget get flex2 => flex(2);
  Widget get flex3 => flex(3);
  Widget get flex4 => flex(4);
  Widget get flex5 => flex(5);

  // Alignment
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);
  Widget get center => Center(child: this);
  Widget get centerLeft => align(Alignment.centerLeft);
  Widget get centerRight => align(Alignment.centerRight);
  Widget get topCenter => align(Alignment.topCenter);
  Widget get topLeft => align(Alignment.topLeft);
  Widget get topRight => align(Alignment.topRight);
  Widget get bottomCenter => align(Alignment.bottomCenter);
  Widget get bottomLeft => align(Alignment.bottomLeft);
  Widget get bottomRight => align(Alignment.bottomRight);

  // Positioning
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? width,
    double? height,
  }) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  Widget get positionedFill => Positioned.fill(child: this);

  // Card Styles
  Widget card({
    Color? color,
    double? elevation,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    Clip? clipBehavior,
  }) =>
      Card(
        color: color,
        elevation: elevation ?? 2,
        margin: margin,
        clipBehavior: clipBehavior,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: this,
      );

  Widget get cardFlat => card(elevation: 0);
  Widget get cardRaised => card(elevation: 8);

  // Material Styles
  Widget material({
    MaterialType type = MaterialType.canvas,
    double elevation = 0,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    TextStyle? textStyle,
    BorderRadiusGeometry? borderRadius,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    Clip clipBehavior = Clip.none,
    Duration animationDuration = kThemeChangeDuration,
  }) =>
      Material(
        type: type,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        shape: shape,
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        animationDuration: animationDuration,
        child: this,
      );

  // Ink Effects
  Widget inkWell({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? highlightColor,
    Color? hoverColor,
    Color? focusColor,
  }) =>
      InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        borderRadius: borderRadius,
        splashColor: splashColor,
        highlightColor: highlightColor,
        hoverColor: hoverColor,
        focusColor: focusColor,
        child: this,
      );
}

/// Box Decoration Helpers
class BoxDecorations {
  static BoxDecoration card({
    Color? color,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Border? border,
  }) =>
      BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
        border: border,
      );

  static BoxDecoration roundedCard({
    Color? color,
    double radius = 12,
    double elevation = 4,
  }) =>
      BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: elevation * 2,
            offset: Offset(0, elevation / 2),
          ),
        ],
      );

  static BoxDecoration gradientBox({
    required Gradient gradient,
    BorderRadius? borderRadius,
    Border? border,
  }) =>
      BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
      );

  static BoxDecoration borderedBox({
    Color? color,
    Color borderColor = Colors.grey,
    double borderWidth = 1,
    BorderRadius? borderRadius,
  }) =>
      BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      );
}
