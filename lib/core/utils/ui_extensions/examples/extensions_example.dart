import 'package:alicom/core/utils/ui_extensions/box_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/color_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/sizing_extensions.dart';
import 'package:alicom/core/utils/ui_extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
// هنا نضع جميع الإكستنشنز من الملفات المرفقة
// [يتم إدراج جميع الإكستنشنز هنا - TextStyleExtensions, SizingExtensions, BoxExtensions, ColorExtensions]

class ExtensionsDemo extends StatefulWidget {
  const ExtensionsDemo({super.key});

  @override
  State<ExtensionsDemo> createState() => _ExtensionsDemoState();
}

class _ExtensionsDemoState extends State<ExtensionsDemo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TextStylesDemo(),
    const SizingDemo(),
    const BoxStylesDemo(),
    const ColorsDemo(),
  ];

  final List<String> _titles = [
    'Text Styles',
    'Sizing & Spacing',
    'Box Styles',
    'Colors',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: context.primary,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: context.primary,
        unselectedItemColor: context.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten),
            label: 'Sizing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            label: 'Boxes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: 'Colors',
          ),
        ],
      ),
    );
  }
}

// صفحة عرض أنماط النصوص
class TextStylesDemo extends StatelessWidget {
  const TextStylesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'whfuewugfug'.styled(context.displayMedium).gradient(
                LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

          Text(
            "data",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          _buildSection(
            'Material Design Typography',
            [
              // Text("data").styled(context.debugDoingBuild),
              'Display Large'.styled(context.displayLarge),
              'Display Medium'.styled(context.displayMedium),
              'Display Small'.styled(context.displaySmall),
              'Headline Large'.styled(context.headlineLarge),
              'Headline Medium'.styled(context.headlineMedium),
              'Headline Small'.styled(context.headlineSmall),
              'Title Large'.styled(context.titleLarge),
              'Title Medium'.styled(context.titleMedium),
              'Title Small'.styled(context.titleSmall),
              'Body Large'.styled(context.bodyLarge),
              'Body Medium'.styled(context.bodyMedium),
              'Body Small'.styled(context.bodySmall),
              'Label Large'.styled(context.labelLarge),
              'Label Medium'.styled(context.labelMedium),
              'Label Small'.styled(context.labelSmall),
            ],
          ),

          // Font Weights
          _buildSection(
            'Font Weights',
            [
              'Thin Text'.styled(AppTextStyles.headlineSmall.thin),
              'Light Text'.styled(AppTextStyles.headlineSmall.light),
              'Normal Text'.styled(AppTextStyles.headlineSmall.normal),
              'Medium Text'.styled(AppTextStyles.headlineSmall.medium),
              'Semi Bold Text'.styled(AppTextStyles.headlineSmall.semiBold),
              'Bold Text'.styled(AppTextStyles.headlineSmall.bold),
              'Extra Bold Text'.styled(AppTextStyles.headlineSmall.extraBold),
              'Black Text'.styled(AppTextStyles.headlineSmall.black),
            ],
          ),

          // Font Sizes
          _buildSection(
            'Font Sizes',
            [
              'Extra Small'.styled(AppTextStyles.headlineSmall.xs),
              'Small'.styled(AppTextStyles.headlineSmall.sm),
              'Base'.styled(AppTextStyles.headlineSmall.base),
              'Large'.styled(AppTextStyles.headlineSmall.lg),
              'Extra Large'.styled(AppTextStyles.headlineSmall.xl),
              '2X Large'.styled(AppTextStyles.headlineSmall.xl2),
              '3X Large'.styled(AppTextStyles.headlineSmall.xl3),
              '4X Large'.styled(AppTextStyles.headlineSmall.xl4),
            ],
          ),

          // Text Decorations
          _buildSection(
            'Text Decorations',
            [
              'Underlined Text'.styled(AppTextStyles.displayLarge.underline),
              'Line Through Text'
                  .styled(AppTextStyles.displayMedium.lineThrough),
              'Overline Text'.styled(AppTextStyles.displaySmall.overline),
              'Italic Text'.styled(AppTextStyles.displaySmall.italic),
            ],
          ),

          // Arabic Text Support
          _buildSection(
            'Arabic Text Support',
            [
              'نص عربي بخط القاهرة'.styled(AppTextStyles.arabicDisplay),
              'نص عربي بخط تجوال'.styled(AppTextStyles.arabicBody),
              'نص عربي محسن للقراءة'
                  .styled(AppTextStyles.displaySmall.arabicOptimized),
            ],
          ),

          // Text with Shadows and Effects
          _buildSection(
            'Text Effects',
            [
              'Text with Shadow'.styled(
                AppTextStyles.headlineSmall.withShadow(
                  color: Colors.black54,
                  blurRadius: 4.0,
                  offset: const Offset(2, 2),
                ),
              ),
              'Glowing Text'.styled(
                AppTextStyles.headlineSmall.withGlow(
                  color: context.primary,
                  blurRadius: 8.0,
                ),
              ),
              'Colored Text'.styled(
                AppTextStyles.headlineSmall.withColor(context.primary),
              ),
            ],
          ),

          // String Extensions
          _buildSection(
            'String Extensions',
            [
              'Heading 1'.h1,
              'Heading 2'.h2,
              'Heading 3'.h3,
              'Body Text'.body,
              'Caption Text'.caption,
              'Bold Text'.bold(),
              'Italic Text'.italic(),
              'Underlined Text'.underline(),
              'Red Text'.color(Colors.red),
              'Large Text'.size(24),
            ],
          ),
        ],
      ).p4,
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.h6.pb6,
        ...children.map((child) => child.pb4),
        16.h, // Spacer
      ],
    );
  }
}

// صفحة عرض الأحجام والمسافات
class SizingDemo extends StatelessWidget {
  const SizingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Device Information
          _buildInfoCard(
            'Device Information',
            [
              'Screen Width: ${context.screenWidth.toStringAsFixed(0)}',
              'Screen Height: ${context.screenHeight.toStringAsFixed(0)}',
              'Device Type: ${_getDeviceType(context)}',
              'Orientation: ${context.isPortrait ? 'Portrait' : 'Landscape'}',
              'Safe Area Top: ${context.safeAreaTop.toStringAsFixed(0)}',
              'Keyboard Visible: ${context.isKeyboardVisible}',
            ],
          ),

          // Spacing System
          _buildSpacingDemo(context),

          // Responsive Values
          _buildResponsiveDemo(context),

          // Size Presets
          _buildSizePresetsDemo(context),

          // Border Radius Examples
          _buildBorderRadiusDemo(context),
        ],
      ).p4,
    );
  }

  Widget _buildInfoCard(String title, List<String> info) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.h4.pb2,
          ...info.map((text) => text.h6.pb1),
        ],
      ).p4,
    ).mb4;
  }

  Widget _buildSpacingDemo(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Spacing System'.styled(AppTextStyles.headlineSmall.bold).pb2,
          Row(
            children: [
              Container(width: context.space1, height: 20, color: Colors.red),
              4.w,
              'space1 (4px)'.text,
            ],
          ).pb1,
          Row(
            children: [
              Container(width: context.space4, height: 20, color: Colors.blue),
              4.w,
              'space4 (16px)'.text,
            ],
          ).pb1,
          Row(
            children: [
              Container(width: context.space8, height: 20, color: Colors.green),
              4.w,
              'space8 (32px)'.text,
            ],
          ).pb1,
          Row(
            children: [
              Container(
                  width: context.space12, height: 20, color: Colors.orange),
              4.w,
              'space12 (48px)'.text,
            ],
          ),
        ],
      ).p4,
    ).mb4;
  }

  Widget _buildResponsiveDemo(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Responsive Values'.styled(AppTextStyles.headlineSmall.bold).pb2,
          Container(
            width: context.responsiveValue(
              mobile: 100,
              tablet: 150,
              desktop: 200,
            ),
            height: 50,
            color: context.primary,
            child: 'Responsive Width'
                .styled(
                  context.headlineMedium.withColor(context.onPrimary),
                )
                .center,
          ).mb2,
          "qw".h1,
          Text(
            'Width: ${context.responsiveValue(mobile: 100, tablet: 150, desktop: 200)}px',
          ),
        ],
      ).p4,
    ).mb4;
  }

  Widget _buildSizePresetsDemo(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Size Presets'.styled(AppTextStyles.headlineSmall.bold).pb2,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSizeBox('XS', context.iconXS),
              _buildSizeBox('SM', context.iconSM),
              _buildSizeBox('MD', context.iconMD),
              _buildSizeBox('LG', context.iconLG),
              _buildSizeBox('XL', context.iconXL),
              _buildSizeBox('XXL', context.iconXXL),
            ],
          ),
        ],
      ).p4,
    ).mb4;
  }

  Widget _buildSizeBox(String label, double size) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          color: Colors.blue,
        ),
        2.h,
        Text(label),
      ],
    );
  }

  Widget _buildBorderRadiusDemo(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Border Radius'.styled(AppTextStyles.headlineSmall.bold).pb2,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildRadiusBox('None', context.radiusNone),
              _buildRadiusBox('SM', context.radiusSM),
              _buildRadiusBox('MD', context.radiusMD),
              _buildRadiusBox('LG', context.radiusLG),
              _buildRadiusBox('XL', context.radiusXL),
              _buildRadiusBox('Full', context.radiusFull),
            ],
          ),
        ],
      ).p4,
    ).mb4;
  }

  Widget _buildRadiusBox(String label, BorderRadius radius) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: radius,
          ),
        ),
        2.h,
        Text(label),
      ],
    );
  }

  String _getDeviceType(BuildContext context) {
    if (context.isPhone) return 'Phone';
    if (context.isTablet) return 'Tablet';
    if (context.isDesktop) return 'Desktop';
    return 'Unknown';
  }
}

// صفحة عرض أنماط الصناديق
class BoxStylesDemo extends StatelessWidget {
  const BoxStylesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding Examples
          _buildSection(
            'Padding Examples',
            [
              'Padding All'
                  .text
                  .p4
                  .backgroundColor(Colors.blue.withOpacity(0.2)),
              'Padding Horizontal'
                  .text
                  .px4
                  .backgroundColor(Colors.green.withOpacity(0.2)),
              'Padding Vertical'
                  .text
                  .py4
                  .backgroundColor(Colors.red.withOpacity(0.2)),
              'Padding Top'
                  .text
                  .pt4
                  .backgroundColor(Colors.orange.withOpacity(0.2)),
            ],
          ),

          // Margin Examples
          _buildSection(
            'Margin Examples',
            [
              'Margin All'
                  .text
                  .m4
                  .backgroundColor(Colors.purple.withOpacity(0.2)),
              'Margin Horizontal'
                  .text
                  .mx4
                  .backgroundColor(Colors.teal.withOpacity(0.2)),
              'Margin Vertical'
                  .text
                  .my4
                  .backgroundColor(Colors.indigo.withOpacity(0.2)),
            ],
          ),

          // Background Colors
          _buildSection(
            'Background Colors',
            [
              'Red Background'.text.p2.bgRed.rounded,
              'Blue Background'.text.p2.bgBlue.rounded,
              'Green Background'.text.p2.bgGreen.rounded,
              'Purple Background'.text.p2.bgPurple.rounded,
            ],
          ),

          // Border Radius
          _buildSection(
            'Border Radius',
            [
              'Rounded Small'.text.p2.bgBlue.roundedSM,
              'Rounded Medium'.text.p2.bgGreen.roundedMD,
              'Rounded Large'.text.p2.bgRed.roundedLG,
              'Rounded Full'.text.p2.bgPurple.roundedFull,
            ],
          ),

          // Borders
          _buildSection(
            'Borders',
            [
              'Border 1px'.text.p2.border1,
              'Border 2px'.text.p2.border2,
              'Red Border'.text.p2.borderRed,
              'Blue Border'.text.p2.borderBlue,
            ],
          ),

          // Shadows
          _buildSection(
            'Shadows',
            [
              'Shadow Small'.text.p4.shadowSM.backgroundColor(Colors.white),
              'Shadow Medium'.text.p4.shadowMD.backgroundColor(Colors.white),
              'Shadow Large'.text.p4.shadowLG.backgroundColor(Colors.white),
              'Shadow XL'.text.p4.shadowXL.backgroundColor(Colors.white),
            ],
          ),

          // Gradients
          _buildSection(
            'Gradients',
            [
              'Linear Gradient'.text.p4.linearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              'Radial Gradient'.text.p4.radialGradient(
                colors: [Colors.red, Colors.orange],
              ),
            ],
          ),

          // Opacity
          _buildSection(
            'Opacity',
            [
              'Opacity 100%'.text.p2.bgBlue.opacity100,
              'Opacity 75%'.text.p2.bgBlue.opacity75,
              'Opacity 50%'.text.p2.bgBlue.opacity50,
              'Opacity 25%'.text.p2.bgBlue.opacity25,
            ],
          ),

          // Transforms
          _buildSection(
            'Transforms',
            [
              'Scale 75%'.text.p2.bgGreen.scale75,
              'Scale 125%'.text.p2.bgRed.scale125,
              'Rotate 45°'.text.p2.bgBlue.rotate45,
            ],
          ),
        ],
      ).p4,
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).pb2,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
        16.h,
      ],
    );
  }
}

// صفحة عرض الألوان
class ColorsDemo extends StatelessWidget {
  const ColorsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Material Design 3 Colors
          _buildColorSection(
            'Material Design 3 Colors',
            [
              _buildColorTile('Primary', context.primary),
              _buildColorTile('Secondary', context.secondary),
              _buildColorTile('Tertiary', context.tertiary),
              _buildColorTile('Error', context.error),
              _buildColorTile('Surface', context.surface),
              _buildColorTile('Outline', context.outline),
            ],
          ),

          // Semantic Colors
          _buildColorSection(
            'Semantic Colors',
            [
              _buildColorTile('Success', context.success),
              _buildColorTile('Warning', context.warning),
              _buildColorTile('Info', context.info),
              _buildColorTile('Error', context.error),
            ],
          ),

          // Brand Colors
          _buildColorSection(
            'Brand Colors',
            [
              _buildColorTile('Brand Primary', AppColors.brandPrimary),
              _buildColorTile('Brand Secondary', AppColors.brandSecondary),
              _buildColorTile('Brand Accent', AppColors.brandAccent),
            ],
          ),

          // Social Media Colors
          _buildColorSection(
            'Social Media Colors',
            [
              _buildColorTile('Facebook', AppColors.facebook),
              _buildColorTile('Twitter', AppColors.twitter),
              _buildColorTile('Instagram', AppColors.instagram),
              _buildColorTile('LinkedIn', AppColors.linkedin),
              _buildColorTile('YouTube', AppColors.youtube),
              _buildColorTile('WhatsApp', AppColors.whatsapp),
            ],
          ),

          // Color Variations
          _buildColorVariationsDemo(context),

          // Color Palettes
          _buildColorPaletteDemo(context),
        ],
      ).p4,
    );
  }

  Widget _buildColorSection(String title, List<Widget> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).pb2,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: colors,
        ),
        16.h,
      ],
    );
  }

  Widget _buildColorTile(String name, Color color) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name).center,
          2.h,
          Text(color.hex).center,
        ],
      ),
    );
  }

  Widget _buildColorVariationsDemo(BuildContext context) {
    final baseColor = context.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Color Variations'.styled(AppTextStyles.headlineSmall.bold).pb2,
        Row(
          children: [
            _buildColorTile('Original', baseColor),
            8.w,
            _buildColorTile('Lighten', baseColor.lighten(0.2)),
            8.w,
            _buildColorTile('Darken', baseColor.darken(0.2)),
            8.w,
            _buildColorTile('Complement', baseColor.complement),
          ],
        ),
        16.h,
      ],
    );
  }

  Widget _buildColorPaletteDemo(BuildContext context) {
    final baseColor = context.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Monochromatic Palette'.styled(AppTextStyles.headlineSmall.bold).pb2,
        Row(
          children: baseColor.monochromatic
              .map((color) => Expanded(
                    child: Container(
                      height: 60,
                      color: color,
                      child: Text(color.hex).center,
                    ),
                  ))
              .toList(),
        ),
        16.h,
        'Triadic Colors'.styled(AppTextStyles.headlineSmall.bold).pb2,
        Row(
          children: baseColor.triadic
              .map((color) => Expanded(
                    child: Container(
                      height: 60,
                      color: color,
                      child: Text(color.hex).center,
                    ),
                  ))
              .toList(),
        ),
        16.h,
      ],
    );
  }
}

// إضافة جميع الإكستنشنز والكلاسات من الملفات المرفقة هنا
// [TextStyleExtensions, SizingExtensions, BoxExtensions, ColorExtensions, AppTextStyles, AppSizes, AppColors, etc.]
