import 'package:alicom/core/utils/ui_extensions/box_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/color_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/sizing_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';

// مثال شامل لاستخدام جميع الـ Extensions

class ComprehensiveExtensionsExample extends StatelessWidget {
  const ComprehensiveExtensionsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comprehensive Extensions Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Comprehensive Extensions Example'),
          elevation: 2,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Box Extensions Examples
              _buildBoxExtensionsSection(),
              SizedBox(height: 20),

              // Color Extensions Examples
              _buildColorExtensionsSection(),
              SizedBox(height: 20),

              // Sizing Extensions Examples
              _buildSizingExtensionsSection(context),
              SizedBox(height: 20),

              // TextStyle Extensions Examples
              _buildTextStyleExtensionsSection(context),
              SizedBox(height: 20),

              // Number Extensions Examples
              _buildNumberExtensionsSection(),
              SizedBox(height: 20),

              // String Extensions Examples
              _buildStringExtensionsSection(),
              SizedBox(height: 20),

              // Complex Combined Example
              _buildComplexCombinedExample(context),
              // الأقسام الجديدة المضافة
              _buildInteractiveExamplesSection(context),
              SizedBox(height: 20),

              _buildAdvancedBoxExtensionsSection(),
              SizedBox(height: 20),

              _buildAdvancedColorExtensionsSection(),
              SizedBox(height: 20),

              _buildAdvancedSizingExtensionsSection(context),
              SizedBox(height: 20),

              _buildAdvancedTextStyleExtensionsSection(context),
              SizedBox(height: 20),

              _buildContextColorExtensionsSection(context),
              SizedBox(height: 20),

              _buildComplexCombinedExample(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoxExtensionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Box Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Padding Examples
        Row(
          children: [
            Text('p2').p2.bgRed.m1.flex1.center,
            Text('p4').p4.bgBlue.m1.flex1.center,
            Text('p6').p6.bgGreen.m1.flex1.center,
          ],
        ),

        // Margin Examples
        Row(
          children: [
            Text('m1').p2.bgPurple.m1.flex1.center,
            Text('m2').p2.bgOrange.m2.flex1.center,
            Text('m3').p2.bgTeal.m3.flex1.center,
          ],
        ),

        // Background Colors
        Row(
          children: [
            Text('Red').p2.bgRed.m1.flex1.center,
            Text('Blue').p2.bgBlue.m1.flex1.center,
            Text('Green').p2.bgGreen.m1.flex1.center,
          ],
        ),

        // Border Radius
        Row(
          children: [
            Text('rounded').p2.bgRed.rounded.m1.flex1.center,
            Text('roundedLG').p2.bgBlue.roundedLG.m1.flex1.center,
            Text('roundedFull').p2.bgGreen.roundedFull.m1.flex1.center,
          ],
        ),

        // Borders
        Row(
          children: [
            Text('border1').p2.bgWhite.border1.m1.flex1.center,
            Text('border2').p2.bgWhite.border2.m1.flex1.center,
            Text('borderRed').p2.bgWhite.borderRed.m1.flex1.center,
          ],
        ),

        // Shadows
        Row(
          children: [
            Text('shadowSM').p3.bgWhite.shadowSM.m2.flex1.center,
            Text('shadowMD').p3.bgWhite.shadowMD.m2.flex1.center,
            Text('shadowLG').p3.bgWhite.shadowLG.m2.flex1.center,
          ],
        ),

        // Elevation
        Row(
          children: [
            Text('elevation2').p2.elevation2.m1.flex1.center,
            Text('elevation4').p2.elevation4.m1.flex1.center,
            Text('elevation8').p2.elevation8.m1.flex1.center,
          ],
        ),

        // Gradients
        'Gradient'
            .h5
            .py6
            .px6
            .linearGradient(colors: [Colors.red, Colors.blue])
            .rounded
            .m2
            .center,

        // Opacity
        Row(
          children: [
            Text('opacity50').p2.bgBlack.opacity100.m1.flex1.center,
            Text('opacity75').p2.bgBlack.opacity75.m1.flex1.center,
          ],
        ),

        // Transforms
        Row(
          children: [
            Text('rotate45').p2.bgOrange.rotate45.m2.flex1.center,
            Text('scale110').p2.bgPurple.scale200.m2.flex1.center,
          ],
        ),

        // Flex
        Row(
          children: [
            Text('flex1').p2.bgRed.flex4,
            Text('flex2').p2.bgBlue.flex2,
            Text('flex3').p2.bgGreen.flex3,
          ],
        ),

        // Alignment
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Text('TL').p1.bgRed.topLeft,
              Text('C').p1.bgBlue.center,
              Text('BR').p1.bgGreen.bottomRight,
            ],
          ),
        ).border1.borderRed.m2,

        // Card Styles
        Text('Card').p3.card().m2.center,
      ],
    );
  }

  Widget _buildColorExtensionsSection() {
    final baseColor = Colors.blue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Color Variations
        Row(
          children: [
            Text('Original').p2.backgroundColor(baseColor).flex1.center,
            Text('Lighten')
                .p2
                .backgroundColor(baseColor.lighten())
                .flex1
                .center,
            Text('Darken').p2.backgroundColor(baseColor.darken()).flex1.center,
          ],
        ).m1,

        // Opacity Levels
        Row(
          children: [
            Text('transparent')
                .p2
                .backgroundColor(baseColor.transparent)
                .border1
                .flex2
                .center,
            Text('semiTransparent')
                .p2
                .backgroundColor(baseColor.semiTransparent)
                .flex2
                .center,
            Text('high').p2.backgroundColor(baseColor.high).flex2.center,
          ],
        ).m1,

        // Complementary Colors
        Row(
          children: [
            Text('Original').p2.backgroundColor(baseColor).flex1.center,
            Text('Complement')
                .p2
                .backgroundColor(baseColor.complement)
                .flex1
                .center,
          ],
        ).m1,

        // Color Palettes
        Text('Monochromatic').p2.bgGrey.center.m1,
        Row(
          children: baseColor.monochromatic
              .map(
                  (color) => Container(height: 30).backgroundColor(color).flex1)
              .toList(),
        ).m1,

        // Hex Colors
        Text('Hex: ${baseColor.hex}').p2.backgroundColor(baseColor).center.m1,
      ],
    );
  }

  Widget _buildSizingExtensionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sizing Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Screen Dimensions
        Text('Screen: ${context.screenWidth.toInt()}x${context.screenHeight.toInt()}')
            .p2
            .bgBlue
            .center
            .m1,

        // Device Type
        Text('Device: ${context.isPhone ? 'Phone' : context.isTablet ? 'Tablet' : 'Desktop'}')
            .p2
            .bgOrange
            .center
            .m1,

        // Spacing System
        Row(
          children: [
            Text('space4').p1.bgRed.center.width(context.space4).flex1,
            Text('space8').p1.bgBlue.center.width(context.space8).flex1,
            Text('space12').p1.bgGreen.center.width(context.space12).flex1,
          ],
        ).m1,

        // Percentage Sizes
        Text('50% Width').p2.bgCyan.center.width(context.widthPercent(50)).m1,

        // Icon Sizes
        Row(
          children: [
            Text('iconSM')
                .p1
                .bgYellow
                .center
                .sized(width: context.iconSM, height: context.iconSM)
                .m1,
            Text('iconMD')
                .p1
                .bgAmber
                .center
                .sized(width: context.iconMD, height: context.iconMD)
                .m1,
            Text('iconLG')
                .p1
                .bgOrange
                .center
                .sized(width: context.iconLG, height: context.iconLG)
                .m1,
          ],
        ),
      ],
    );
  }

  Widget _buildTextStyleExtensionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TextStyle Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Font Weights
        Column(
          children: [
            'Thin Text'.styled(TextStyle().thin).p1,
            'Bold Text'.styled(TextStyle().bold).p1,
            'Black Text'.styled(TextStyle().black).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Font Sizes
        Column(
          children: [
            'XS Text'.styled(TextStyle().xs).p1,
            'Base Text'.styled(TextStyle().base).p1,
            'XL Text'.styled(TextStyle().xl).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Text Decorations
        Column(
          children: [
            'Underline Text'.styled(TextStyle().underline).p1,
            'Line Through'.styled(TextStyle().lineThrough).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Color Variations
        Column(
          children: [
            'Red Text'.styled(TextStyle().withColor(Colors.red)).p1,
            'Blue Text'.styled(TextStyle().withColor(Colors.blue)).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Context-based Typography
        Column(
          children: [
            'Body Large'.styled(context.bodyLarge).p1,
            'Title Medium'.styled(context.titleMedium).p1,
            'Label Small'.styled(context.labelSmall).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Semantic Styles
        Column(
          children: [
            'Error Text'.styled(context.errorText).p1,
            'Success Text'.styled(context.successText).p1,
            'Link Text'.styled(context.linkText).p1,
          ],
        ).bgWhite.p2.rounded.m2,
      ],
    );
  }

  Widget _buildNumberExtensionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Number Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // SizedBox Extensions
        Row(
          children: [
            Container(child: Text('20.h'))
                .backgroundColor(Colors.red)
                .sized(height: 20)
                .m1
                .flex1,
            Container(child: Text('100.w'))
                .backgroundColor(Colors.blue)
                .sized(width: 100)
                .m1
                .flex1,
            Container(child: Text('50.square'))
                .backgroundColor(Colors.green)
                .sized(width: 50, height: 50)
                .m1
                .flex1,
          ],
        ),

        // EdgeInsets Extensions
        Row(
          children: [
            Text('16.p').paddingAll(16).bgRed.m1.flex1.center,
            Text('20.px')
                .paddingSymmetric(horizontal: 20)
                .bgBlue
                .m1
                .flex1
                .center,
            Text('10.py')
                .paddingSymmetric(vertical: 10)
                .bgGreen
                .m1
                .flex1
                .center,
          ],
        ),

        // BorderRadius Extensions
        Row(
          children: [
            Text('8.r').p2.bgRed.borderRadius(8.r).m1.flex1.center,
            Text('12.rt').p2.bgBlue.borderRadius(12.rt).m1.flex1.center,
            Text('10.rb').p2.bgGreen.borderRadius(10.rb).m1.flex1.center,
          ],
        ),

        // Duration Extensions
        Column(
          children: [
            Text('500.ms = ${500.ms}').p1.bgYellow.center.m1,
            Text('2.sec = ${2.sec}').p1.bgAmber.center.m1,
          ],
        ),
      ],
    );
  }

  Widget _buildStringExtensionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('String Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Basic Text Widgets
        Column(
          children: [
            'H1 Header'.h1.m1,
            'H2 Header'.h2.m1,
            'H3 Header'.h3.m1,
          ],
        ).bgWhite.p2.rounded.m2,

        Column(
          children: [
            'Body Text'.body.m1,
            'Caption Text'.caption.m1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Styled Text Shortcuts
        Column(
          children: [
            'Bold Text'.bold().m1,
            'Italic Text'.italic().m1,
            'Red Text'.color(Colors.red).m1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Arabic Text
        'نص عربي محسّن'.arabicText.p2.bgAmber.center.rounded.m2,
      ],
    );
  }
  ////

  Widget _buildComplexCombinedExample(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Complex Combined Example',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          constraints: BoxConstraints(
              maxWidth: context.isDesktop ? 400 : context.screenWidth),
          child: Column(
            children: [
              // Profile Header
              Row(
                children: [
                  Container()
                      .sized(width: context.avatarLG, height: context.avatarLG)
                      .backgroundColor(AppColors.brandPrimary)
                      .roundedFull
                      .clipOval(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'John Doe'.styled(context.titleMedium.bold),
                      'Flutter Developer'.styled(
                          context.bodySmall.withColor(context.textSecondary)),
                    ],
                  ).paddingOnly(left: context.space4),
                  Container()
                      .sized(width: 12, height: 12)
                      .backgroundColor(AppColors.online)
                      .roundedFull,
                ],
              ).paddingAll(context.space4),

              // Bio Section
              'Experienced Flutter developer with 5+ years of experience in mobile app development.'
                  .styled(context.bodyMedium)
                  .paddingSymmetric(
                      horizontal: context.space4, vertical: context.space2),

              // Skills
              Wrap(
                spacing: context.space2,
                runSpacing: context.space1,
                children: ['Flutter', 'Dart', 'Firebase', 'REST API']
                    .map((skill) => skill
                        .styled(context.labelSmall)
                        .paddingSymmetric(
                            horizontal: context.space2,
                            vertical: context.space1)
                        .backgroundColor(context.primaryContainer)
                        .borderRadius(context.radiusFull))
                    .toList(),
              ).paddingSymmetric(horizontal: context.space4),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      '120'.styled(
                          context.titleLarge.bold.withColor(context.primary)),
                      'Projects'.styled(
                          context.labelSmall.withColor(context.textSecondary)),
                    ],
                  ),
                  Column(
                    children: [
                      '5.2K'.styled(
                          context.titleLarge.bold.withColor(context.secondary)),
                      'Followers'.styled(
                          context.labelSmall.withColor(context.textSecondary)),
                    ],
                  ),
                ],
              ).paddingAll(context.space4),

              // Action Buttons
              Row(
                children: [
                  'Follow'
                      .styled(context.buttonText.withColor(context.onPrimary))
                      .paddingSymmetric(
                          horizontal: context.space4, vertical: context.space2)
                      .backgroundColor(context.primary)
                      .borderRadius(context.radiusMD)
                      .inkWell(onTap: () => print('Follow'))
                      .height(context.buttonMD)
                      .center
                      .flex1,
                  SizedBox(width: context.space2),
                  'Message'
                      .styled(context.buttonText.withColor(context.primary))
                      .paddingSymmetric(
                          horizontal: context.space4, vertical: context.space2)
                      .border(color: context.outline)
                      .borderRadius(context.radiusMD)
                      .inkWell(onTap: () => print('Message'))
                      .height(context.buttonMD)
                      .center
                      .flex1,
                ],
              ).paddingAll(context.space4),
            ],
          ),
        )
            .backgroundColor(context.surface)
            .borderRadius(context.radiusLG)
            .shadow(
              color: context.shadow,
              blurRadius: context.elevation4,
              offset: Offset(0, 2),
            )
            .marginAll(context.space4),
      ],
    );
  }

  Widget _buildInteractiveExamplesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interactive Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // InkWell Examples
        Row(
          children: [
            // Basic InkWell
            Text('Tap Me')
                .p3
                .bgBlue
                .rounded
                .inkWell(
                  onTap: () => print('Basic Tap'),
                  borderRadius: BorderRadius.circular(8),
                )
                .m2
                .flex1
                .center,

            // InkWell with different states
            Text('Press Me')
                .p3
                .bgGreen
                .rounded
                .inkWell(
                  onTap: () => print('Green Button Tap'),
                  onLongPress: () => print('Green Button Long Press'),
                  splashColor: Colors.greenAccent,
                  highlightColor: Colors.green.withOpacity(0.2),
                )
                .m2
                .flex1
                .center,
          ],
        ),

        // Material Examples
        Row(
          children: [
            Text('Material Card')
                .p4
                .material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                )
                .inkWell(onTap: () => print('Material Tap'))
                .m2
                .flex1
                .center,
            Text('Surface Material')
                .p4
                .material(
                  type: MaterialType.canvas,
                  elevation: 2,
                  color: Theme.of(context).colorScheme.surface,
                )
                .m2
                .flex1
                .center,
          ],
        ),

        // Card Variations
        Row(
          children: [
            Text('Flat Card')
                .p3
                .cardFlat
                .inkWell(onTap: () => print('Flat Card Tap'))
                .m2
                .flex1
                .center,
            Text('Raised Card')
                .p3
                .cardRaised
                .inkWell(onTap: () => print('Raised Card Tap'))
                .m2
                .flex1
                .center,
            Text('Custom Card')
                .p3
                .card(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue[50],
                )
                .inkWell(onTap: () => print('Custom Card Tap'))
                .m2
                .flex1
                .center,
          ],
        ),
      ],
    );
  }

  Widget _buildAdvancedBoxExtensionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Advanced Box Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Clipping Examples
        Row(
          children: [
            Text('Clip Oval')
                .p3
                .bgRed
                .clipOval()
                .sized(width: 80, height: 40)
                .m2
                .flex1
                .center,
            Text('Clip Rect')
                .p3
                .bgBlue
                .clipRect()
                .sized(width: 80, height: 40)
                .m2
                .flex1
                .center,
          ],
        ),

        // Advanced Positioning
        SizedBox(
          height: 120,
          child: Stack(
            children: [
              Text('Positioned Top').p2.bgRed.positioned(top: 10, left: 10),
              Text('Positioned Bottom')
                  .p2
                  .bgBlue
                  .positioned(bottom: 10, right: 10),
              Text('Positioned Center')
                  .p2
                  .bgGreen
                  .positioned(top: 40, left: 40, right: 40),
            ],
          ),
        ).border1.borderGrey.m2,

        // Advanced Transforms
        Row(
          children: [
            Text('Rotate\n90°').p2.bgOrange.rotate90.m2.flex1.center,
            Text('Scale\n150%').p2.bgPurple.scale150.m2.flex1.center,
            Text('Translate').p2.bgTeal.translate(x: 10, y: 5).m2.flex1.center,
          ],
        ),

        // Visibility Examples
        Row(
          children: [
            Text('Visible').p2.bgGreen.visible(true).m2.flex1.center,
            Text('Invisible').p2.bgRed.invisible.m2.flex1.center,
            Text('Hidden').p2.bgBlue.hidden.m2.flex1.center,
          ],
        ),
      ],
    );
  }

  Widget _buildAdvancedColorExtensionsSection() {
    final baseColor = Colors.blue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Advanced Color Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // State Colors
        Row(
          children: [
            Text('Hover').p2.backgroundColor(baseColor.hover).flex1.center,
            Text('Focus').p2.backgroundColor(baseColor.focus).flex1.center,
            Text('Pressed').p2.backgroundColor(baseColor.pressed).flex1.center,
          ],
        ).m1,

        // Color Temperature
        Row(
          children: [
            Text('Warm').p2.backgroundColor(baseColor.warm).flex1.center,
            Text('Cool').p2.backgroundColor(baseColor.cool).flex1.center,
          ],
        ).m1,

        // Analogous Colors
        Text('Analogous Colors').p2.bgGrey.center.m1,
        Row(
          children: baseColor.analogous
              .map(
                  (color) => Container(height: 30).backgroundColor(color).flex1)
              .toList(),
        ).m1,

        // Triadic Colors
        Text('Triadic Colors').p2.bgGrey.center.m1,
        Row(
          children: baseColor.triadic
              .map(
                  (color) => Container(height: 30).backgroundColor(color).flex1)
              .toList(),
        ).m1,

        // Gradients from Color
        Text('Linear Gradient from Color')
            .p4
            .gradient(baseColor.toLinearGradient())
            .rounded
            .m2
            .center,
      ],
    );
  }

  Widget _buildAdvancedSizingExtensionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Advanced Sizing Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Responsive Values
        Text('Responsive Value: ${context.responsiveValue(mobile: 100, tablet: 200, desktop: 300)}')
            .p2
            .bgBlue
            .center
            .m1,

        // Aspect Ratios
        Row(
          children: [
            Container(child: Text('16:9').center)
                .bgRed
                .ratio16_9()
                .width(100)
                .m1
                .flex1,
            Container(child: Text('4:3').center)
                .bgBlue
                .ratio4_3()
                .width(100)
                .m1
                .flex1,
            Container(child: Text('1:1').center)
                .bgGreen
                .ratio1_1()
                .width(100)
                .m1
                .flex1,
          ],
        ),

        // Intrinsic Dimensions
        Row(
          children: [
            Text('Intrinsic Width')
                .p2
                .bgOrange
                .intrinsicWidth()
                .m1
                .flex1
                .center,
            Text('Intrinsic Height')
                .p2
                .bgPurple
                .intrinsicHeight()
                .m1
                .flex1
                .center,
          ],
        ),

        // FittedBox
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 40,
              child: Text('Fitted Box').fitted().center,
            ).bgRed.m1.flex1,
            SizedBox(
              width: 80,
              height: 40,
              child: Text('Fit Width').fittedWidth().center,
            ).bgBlue.m1.flex1,
          ],
        ),

        // Constraints
        Text('Constrained Box')
            .p2
            .bgGreen
            .constrained(
                minWidth: 100, maxWidth: 200, minHeight: 30, maxHeight: 50)
            .center
            .m1,
      ],
    );
  }

  Widget _buildAdvancedTextStyleExtensionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Advanced TextStyle Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Letter Spacing
        Column(
          children: [
            'Tighter Text'.styled(TextStyle().tighter).p1,
            'Wide Text'.styled(TextStyle().wide).p1,
            'Widest Text'.styled(TextStyle().widest).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Line Height
        Column(
          children: [
            'Leading 5\nMulti Line Text'.styled(TextStyle().leading5).p1,
            'Leading 7\nMulti Line Text'.styled(TextStyle().leading7).p1,
            'Leading 10\nMulti Line Text'.styled(TextStyle().leading10).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Shadow Effects
        Column(
          children: [
            'Shadow Text'.styled(TextStyle().withShadow()).p1,
            'Glow Text'.styled(TextStyle().withGlow(color: Colors.blue)).p1,
          ],
        ).bgBlack.p2.rounded.m2,

        // Font Families
        Column(
          children: [
            'Roboto Font'.styled(TextStyle().roboto).p1,
            'Montserrat Font'.styled(TextStyle().montserrat).p1,
            'Arabic Cairo Font'.styled(TextStyle().cairo).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Display Styles
        Column(
          children: [
            'Display Style'.styled(TextStyle().display).p1,
            'Headline Style'.styled(TextStyle().headline).p1,
            'Title Style'.styled(TextStyle().title).p1,
          ],
        ).bgWhite.p2.rounded.m2,

        // Arabic Optimization
        'نص عربي محسّن مع تحسينات'
            .styled(TextStyle().arabicOptimized)
            .p2
            .bgAmber
            .center
            .rounded
            .m2,

        // Responsive Text
        'Responsive Text Size'
            .styled(TextStyle()
                .responsive(context, mobile: 12, tablet: 16, desktop: 18))
            .p2
            .bgBlue
            .center
            .m1,
      ],
    );
  }

  Widget _buildContextColorExtensionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Context Color Extensions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Material Design 3 Colors
        Row(
          children: [
            Text('Primary').p2.backgroundColor(context.primary).flex1.center,
            Text('On Primary')
                .p2
                .backgroundColor(context.onPrimary)
                .flex1
                .center,
            Text('Primary Container')
                .p2
                .backgroundColor(context.primaryContainer)
                .flex1
                .center,
          ],
        ).m1,

        Row(
          children: [
            Text('Surface').p2.backgroundColor(context.surface).flex1.center,
            Text('On Surface')
                .p2
                .backgroundColor(context.onSurface)
                .flex1
                .center,
            Text('Surface Variant')
                .p2
                .backgroundColor(context.surfaceVariant)
                .flex1
                .center,
          ],
        ).m1,

        // Semantic Colors
        Row(
          children: [
            Text('Success').p2.backgroundColor(context.success).flex1.center,
            Text('Warning').p2.backgroundColor(context.warning).flex1.center,
            Text('Error').p2.backgroundColor(context.error).flex1.center,
          ],
        ).m1,

        // Text Colors
        Row(
          children: [
            'Primary Text'
                .styled(TextStyle().withColor(context.textPrimary))
                .p1
                .bgWhite
                .flex1
                .center,
            'Secondary Text'
                .styled(TextStyle().withColor(context.textSecondary))
                .p1
                .bgWhite
                .flex1
                .center,
            'Disabled Text'
                .styled(TextStyle().withColor(context.textDisabled))
                .p1
                .bgWhite
                .flex1
                .center,
          ],
        ).m1,

        // Gradients from Context
        Text('Primary Gradient from Context')
            .p4
            .gradient(context.primaryGradient)
            .rounded
            .m2
            .center,
      ],
    );
  }
}

/// Predefined Color Palettes
class AppColors {
  static const Color brandPrimary = Color(0xFF1976D2);
  static const Color online = Color(0xFF4CAF50);
}
