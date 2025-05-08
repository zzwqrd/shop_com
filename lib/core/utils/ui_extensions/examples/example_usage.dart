import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../style_extensions_mor.dart';

class StyleExtensionsDemo extends StatelessWidget {
  const StyleExtensionsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: "مثال شامل على الإكستنشنز".h3(color: Colors.white),
        backgroundColor: context.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: context.paddingMD,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Hellossss".gradientText(
              context: context,
              gradient: context.primaryGradient,
              style: context.h3,
            ),

            Text("Hello").visible(true),

            // ========== قسم الألوان ==========
            _buildColorSection(context),
            32.verticalSpace,

            // ========== قسم النصوص ==========
            _buildTextSection(context),
            32.verticalSpace,

            // ========== قسم الأحجام والمسافات ==========
            _buildSizingSection(context),
            32.verticalSpace,

            // ========== قسم البطاقات ==========
            _buildCardSection(context),
            32.verticalSpace,

            // ========== قسم الأزرار ==========
            _buildButtonSection(context),
            32.verticalSpace,

            // ========== قسم حقول الإدخال ==========
            _buildInputSection(context),
            32.verticalSpace,

            // ========== قسم التصميم المتجاوب ==========
            _buildResponsiveSection(context),
            32.verticalSpace,

            // ========== قسم الإكستنشنز المتقدمة ==========
            _buildAdvancedSection(context),
          ],
        ),
      ),
    );
  }

  // قسم الألوان
  Widget _buildColorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "🎨 الألوان".h1(color: context.textPrimary),
        16.verticalSpace,

        // الألوان الأساسية
        "الألوان الأساسية".h5(color: context.textSecondary),
        8.verticalSpace,
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            _colorBox(context, context.primaryColor, "Primary"),
            _colorBox(context, context.primaryLight, "Primary Light"),
            _colorBox(context, context.primaryDark, "Primary Dark"),
            _colorBox(context, context.secondaryColor, "Secondary"),
            _colorBox(context, context.secondaryLight, "Secondary Light"),
            _colorBox(context, context.secondaryDark, "Secondary Dark"),
          ],
        ),

        16.verticalSpace,

        // ألوان الحالة
        "ألوان الحالة".h5(color: context.textSecondary),
        8.verticalSpace,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _colorBox(context, context.successColor, "Success"),
            _colorBox(context, context.errorColor, "Error"),
            _colorBox(context, context.warningColor, "Warning"),
            _colorBox(context, context.infoColor, "Info"),
          ],
        ),

        16.verticalSpace,

        // التدرجات
        "التدرجات".h5(color: context.textSecondary),
        8.verticalSpace,
        Row(
          children: [
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                gradient: context.primaryGradient,
                borderRadius: context.radiusSM,
              ),
              child: "Primary Gradient".caption(color: Colors.white).centered(),
            ),
            16.horizontalSpace,
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                gradient: context.secondaryGradient,
                borderRadius: context.radiusSM,
              ),
              child:
                  "Secondary Gradient".caption(color: Colors.white).centered(),
            ),
          ],
        ),
      ],
    );
  }

  // قسم النصوص
  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "📝 أنماط النصوص".h2(color: context.textPrimary),
        16.verticalSpace,

        // العناوين
        "العناوين".h5(color: context.textSecondary),
        8.verticalSpace,

        "هذا عنوان H1".h1(color: context.textPrimary),
        "هذا عنوان H2".h2(color: context.textPrimary),
        "هذا عنوان H3".h3(color: context.textPrimary),
        "هذا عنوان H4".h4(color: context.textPrimary),
        "هذا عنوان H5".h5(color: context.textPrimary),
        "هذا عنوان H6".h6(color: context.textPrimary),

        16.verticalSpace,

        // نصوص الجسم
        "نصوص الجسم".h5(color: context.textSecondary),
        8.verticalSpace,
        "هذا نص كبير (Body Large) يستخدم للمحتوى المهم"
            .bodyLarge(color: context.textPrimary),
        4.verticalSpace,
        "هذا نص متوسط (Body Medium) يستخدم للمحتوى العادي"
            .bodyMedium(color: context.textSecondary),
        4.verticalSpace,
        "هذا نص صغير (Body Small) يستخدم للتفاصيل"
            .bodySmall(color: context.textHint),
        4.verticalSpace,
        "هذه تسمية توضيحية (Caption)".caption(color: context.textHint),

        16.verticalSpace,

        // نصوص مع أنماط مخصصة
        "نصوص مع أنماط مخصصة".h5(color: context.textSecondary),
        8.verticalSpace,
        "نص مائل وملون".h4(
          color: context.primaryColor,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
        ),
        "نص بخط عريض وحروف متباعدة".h5(
          color: context.secondaryColor,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }

  // قسم الأحجام والمسافات
  Widget _buildSizingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "📏 الأحجام والمسافات".h2(color: context.textPrimary),
        16.verticalSpace,

        // معلومات الشاشة
        "معلومات الشاشة".h5(color: context.textSecondary),
        8.verticalSpace,
        "عرض الشاشة: ${context.screenWidth.toInt()}px".bodyMedium(),
        "ارتفاع الشاشة: ${context.screenHeight.toInt()}px".bodyMedium(),
        "نوع الجهاز: ${context.isMobile ? 'موبايل' : context.isTablet ? 'تابلت' : 'ديسكتوب'}"
            .bodyMedium(),

        16.verticalSpace,

        // المسافات
        "المسافات المعيارية".h5(color: context.textSecondary),
        8.verticalSpace,
        Row(
          children: [
            Container(
              width: context.xs * 4,
              height: 20,
              color: context.primaryColor,
              child: "XS".caption(color: Colors.white).centered(),
            ),
            8.horizontalSpace,
            Container(
              width: context.sm * 4,
              height: 20,
              color: context.primaryColor,
              child: "SM".caption(color: Colors.white).centered(),
            ),
            8.horizontalSpace,
            Container(
              width: context.md,
              height: 20,
              color: context.primaryColor,
              child: "MD".caption(color: Colors.white).centered(),
            ),
            8.horizontalSpace,
            Container(
              width: context.lg,
              height: 20,
              color: context.primaryColor,
              child: "LG".caption(color: Colors.white).centered(),
            ),
          ],
        ),

        16.verticalSpace,

        // أحجام الأيقونات
        "أحجام الأيقونات".h5(color: context.textSecondary),
        8.verticalSpace,
        Row(
          children: [
            Icon(Icons.star, size: context.iconXS, color: context.warningColor),
            4.horizontalSpace,
            Icon(Icons.star, size: context.iconSM, color: context.warningColor),
            4.horizontalSpace,
            Icon(Icons.star, size: context.iconMD, color: context.warningColor),
            4.horizontalSpace,
            Icon(Icons.star, size: context.iconLG, color: context.warningColor),
            4.horizontalSpace,
            Icon(Icons.star, size: context.iconXL, color: context.warningColor),
          ],
        ),
      ],
    );
  }

  // قسم البطاقات
  Widget _buildCardSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "🃏 البطاقات".h2(color: context.textPrimary),
        16.verticalSpace,

        // بطاقة عادية
        Container(
          decoration: context.cardDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "بطاقة عادية".h4(color: context.textPrimary),
              8.verticalSpace,
              "هذه بطاقة بتصميم عادي مع ظل خفيف"
                  .bodyMedium(color: context.textSecondary),
              12.verticalSpace,
              Row(
                children: [
                  Icon(Icons.favorite,
                      color: context.errorColor, size: context.iconSM),
                  4.horizontalSpace,
                  "أعجبني".caption(color: context.textHint),
                  16.horizontalSpace,
                  Icon(Icons.share,
                      color: context.infoColor, size: context.iconSM),
                  4.horizontalSpace,
                  "مشاركة".caption(color: context.textHint),
                ],
              ),
            ],
          ).paddingAll(context.md),
        ),

        16.verticalSpace,

        // بطاقة مرتفعة
        Container(
          decoration: context.elevatedCardDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "بطاقة مرتفعة".h4(color: context.textPrimary),
              8.verticalSpace,
              "هذه بطاقة بتصميم مرتفع مع ظل أقوى"
                  .bodyMedium(color: context.textSecondary),
              12.verticalSpace,
              Container(
                padding:
                    context.paddingVerticalXS.add(context.paddingHorizontalSM),
                decoration: BoxDecoration(
                  color: context.successColor,
                  borderRadius: context.radiusXS,
                ),
                child: "نشط".caption(color: Colors.white),
              ),
            ],
          ).paddingAll(context.md),
        ),
      ],
    );
  }

  // قسم الأزرار
  Widget _buildButtonSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "🔘 الأزرار".h2(color: context.textPrimary),
        16.verticalSpace,

        // زر أساسي
        Container(
          decoration: context.primaryButtonDecoration,
          child: "زر أساسي"
              .text(color: Colors.white)
              .paddingSymmetric(horizontal: 24, vertical: 12)
              .centered(),
        ).onTap(() => print("تم الضغط على الزر الأساسي")),

        12.verticalSpace,

        // زر ثانوي
        Container(
          decoration: context.secondaryButtonDecoration,
          child: "زر ثانوي"
              .text(color: context.primaryColor)
              .paddingSymmetric(horizontal: 24, vertical: 12)
              .centered(),
        ).onTap(() => print("تم الضغط على الزر الثانوي")),

        12.verticalSpace,

        // أزرار ملونة
        Row(
          children: [
            Container(
              padding:
                  context.paddingVerticalSM.add(context.paddingHorizontalMD),
              decoration: BoxDecoration(
                color: context.successColor,
                borderRadius: context.radiusSM,
              ),
              child: "نجح".text(color: Colors.white),
            ).onTap(() => print("نجح")),
            8.horizontalSpace,
            Container(
              padding:
                  context.paddingVerticalSM.add(context.paddingHorizontalMD),
              decoration: BoxDecoration(
                color: context.errorColor,
                borderRadius: context.radiusSM,
              ),
              child: "خطأ".text(color: Colors.white),
            ).onTap(() => print("خطأ")),
            8.horizontalSpace,
            Container(
              padding:
                  context.paddingVerticalSM.add(context.paddingHorizontalMD),
              decoration: BoxDecoration(
                color: context.warningColor,
                borderRadius: context.radiusSM,
              ),
              child: "تحذير".text(color: Colors.white),
            ).onTap(() => print("تحذير")),
          ],
        ),
      ],
    );
  }

  // قسم حقول الإدخال
  Widget _buildInputSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "✏️ حقول الإدخال".h2(color: context.textPrimary),
        16.verticalSpace,
        TextField(
          decoration: context.inputDecoration.copyWith(
            hintText: "أدخل اسمك",
            prefixIcon: Icon(Icons.person, color: context.textHint),
          ),
        ),
        12.verticalSpace,
        TextField(
          decoration: context.inputDecoration.copyWith(
            hintText: "أدخل بريدك الإلكتروني",
            prefixIcon: Icon(Icons.email, color: context.textHint),
          ),
        ),
        12.verticalSpace,
        TextField(
          obscureText: true,
          decoration: context.inputDecoration.copyWith(
            hintText: "أدخل كلمة المرور",
            prefixIcon: Icon(Icons.lock, color: context.textHint),
            suffixIcon: Icon(Icons.visibility_off, color: context.textHint),
          ),
        ),
      ],
    );
  }

  // قسم التصميم المتجاوب
  Widget _buildResponsiveSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "📱 التصميم المتجاوب".h2(color: context.textPrimary),
        16.verticalSpace,
        Container(
          padding: context.paddingMD,
          decoration: BoxDecoration(
            color: context.isMobile
                ? context.infoColor
                : context.isTablet
                    ? context.warningColor
                    : context.successColor,
            borderRadius: context.radiusMD,
          ),
          child: Column(
            children: [
              Icon(
                context.isMobile
                    ? Icons.phone_android
                    : context.isTablet
                        ? Icons.tablet
                        : Icons.desktop_windows,
                color: Colors.white,
                size: context.iconLG,
              ),
              8.verticalSpace,
              (context.isMobile
                      ? "تصميم الموبايل"
                      : context.isTablet
                          ? "تصميم التابلت"
                          : "تصميم الديسكتوب")
                  .h5(color: Colors.white),
              4.verticalSpace,
              "العرض: ${context.screenWidth.toInt()}px"
                  .bodySmall(color: Colors.white70),
            ],
          ),
        ),
      ],
    );
  }

  // قسم الإكستنشنز المتقدمة
  Widget _buildAdvancedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "🚀 الإكستنشنز المتقدمة".h2(color: context.textPrimary),
        16.verticalSpace,

        // استخدام الإكستنشنز على الأرقام
        "إكستنشنز الأرقام".h5(color: context.textSecondary),
        8.verticalSpace,

        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: 25.borderRadius, // استخدام إكستنشن الرقم
              ),
              child: "25".bodyMedium(color: Colors.white).centered(),
            ),
            16.horizontalSpace, // استخدام إكستنشن الرقم
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: context.secondaryColor,
                borderRadius: 10.borderRadius,
              ),
              child: "10".bodyMedium(color: Colors.white).centered(),
            ),
          ],
        ),

        16.verticalSpace,

        // استخدام الإكستنشنز على الويدجت
        "إكستنشنز الويدجت".h5(color: context.textSecondary),
        8.verticalSpace,

        "هذا النص محاط بحشو وهامش"
            .bodyMedium(color: context.textPrimary)
            .paddingAll(12)
            .decorated(BoxDecoration(
              color: context.backgroundColor,
              borderRadius: context.radiusSM,
              border: Border.all(color: context.primaryColor.withOpacity(0.3)),
            ))
            .marginAll(8),

        16.verticalSpace,

        // استخدام الـ Flexible والـ Expanded
        "التوزيع المرن".h5(color: context.textSecondary),
        8.verticalSpace,

        Row(
          children: [
            Container(
              height: 40,
              color: context.primaryColor.withOpacity(0.3),
              child: "مرن 1".bodySmall().centered(),
            ).flexible(1),
            4.horizontalSpace,
            Container(
              height: 40,
              color: context.secondaryColor.withOpacity(0.3),
              child: "موسع 2".bodySmall().centered(),
            ).expanded(2),
            4.horizontalSpace,
            Container(
              height: 40,
              color: context.successColor.withOpacity(0.3),
              child: "مرن 1".bodySmall().centered(),
            ).flexible(1),
          ],
        ),

        16.verticalSpace,

        // استخدام الإيماءات
        "الإيماءات التفاعلية".h5(color: context.textSecondary),
        8.verticalSpace,

        Container(
          padding: context.paddingMD,
          decoration: BoxDecoration(
            color: context.infoColor.withOpacity(0.1),
            borderRadius: context.radiusMD,
            border: Border.all(color: context.infoColor.withOpacity(0.3)),
          ),
          child: "اضغط لفترة طويلة أو اضغط عادي"
              .bodyMedium(color: context.infoColor)
              .centered(),
        )
            .onTap(() => print("تم الضغط العادي"))
            .onLongPress(() => print("تم الضغط الطويل")),

        32.verticalSpace,

        // خلاصة
        Container(
          padding: context.paddingLG,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.primaryColor.withOpacity(0.1),
                context.secondaryColor.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: context.radiusLG,
          ),
          child: Column(
            children: [
              "🎉 تهانينا!".h3(color: context.primaryColor),
              8.verticalSpace,
              "لقد تعلمت جميع إكستنشنز Flutter للتصميم"
                  .bodyLarge(color: context.textPrimary),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle,
                      color: context.successColor, size: context.iconSM),
                  4.horizontalSpace,
                  "جاهز للاستخدام".bodyMedium(color: context.successColor),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // مساعد لإنشاء مربع لون
  Widget _colorBox(BuildContext context, Color color, String label) {
    return Container(
      width: 80,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: context.radiusSM,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: label.caption(color: Colors.white).centered(),
    );
  }
}

/// =======================
/// 📋 Fake Data Example
/// =======================

class FakeDataPaginationExample extends StatefulWidget {
  const FakeDataPaginationExample({super.key});

  @override
  State<FakeDataPaginationExample> createState() =>
      _FakeDataPaginationExampleState();
}

class _FakeDataPaginationExampleState extends State<FakeDataPaginationExample> {
  final ScrollController _scrollController = ScrollController();

  /// داتا وهمية
  final List<String> allData = List.generate(100, (i) => "Fake Item ${i + 1}");

  List<String> displayedData = [];
  int currentPage = 1;
  final int pageSize = 20;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadPage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        _loadPage();
      }
    });
  }

  Future<void> _loadPage() async {
    setState(() => isLoading = true);

    // simulate delay (كأنها API أو DB)
    await Future.delayed(const Duration(seconds: 1));

    final result = allData.toPageResult(page: currentPage, pageSize: pageSize);

    setState(() {
      displayedData = displayedData.appendPage(result.items);
      hasMore = result.hasMore;
      currentPage++;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fake Data Pagination")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: displayedData.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < displayedData.length) {
            return ListTile(
              title: Text(displayedData[index]),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}

/// =======================
/// 🌐 API Pagination Example
/// =======================

class ApiPaginationExample extends StatefulWidget {
  const ApiPaginationExample({super.key});

  @override
  State<ApiPaginationExample> createState() => _ApiPaginationExampleState();
}

class _ApiPaginationExampleState extends State<ApiPaginationExample> {
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> displayedData = [];
  int currentPage = 1;
  final int pageSize = 10;
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadPage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        _loadPage();
      }
    });
  }

  Future<void> _loadPage() async {
    setState(() => isLoading = true);

    final result = await fetchPosts(currentPage, pageSize);

    setState(() {
      displayedData = displayedData.appendPage(result.items);
      hasMore = result.hasMore;
      currentPage++;
      isLoading = false;
    });
  }

  /// 🟢 Fetch Data from API
  Future<PageResult<Map<String, dynamic>>> fetchPosts(
      int page, int pageSize) async {
    final response = await http.get(
      Uri.parse(
          "https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$pageSize"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return PageResult<Map<String, dynamic>>(
        items: List<Map<String, dynamic>>.from(data),
        hasMore: data.length == pageSize,
        currentPage: page,
      );
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Pagination Example")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: displayedData.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < displayedData.length) {
            final item = displayedData[index];
            return ListTile(
              leading: CircleAvatar(child: Text(item["id"].toString())),
              title: Text(item["title"]),
              subtitle: Text(item["body"]),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
