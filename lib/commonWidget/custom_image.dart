import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

import '../../gen/assets/generated_assets.dart';
import '../core/utils/extensions.dart';
import 'base_shimmer.dart';

class CustomImage extends StatelessWidget {
  final double? height, width;
  final String? url;
  final bool isFile, base46;
  final BoxFit? fit;
  final BoxBorder? border;
  final Widget? child;
  final Function? onFinishLottie;

  final Color? blurColor, color, backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const CustomImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.isFile = false,
    this.borderRadius,
    this.fit,
    this.color,
    this.backgroundColor,
    this.border,
    this.child,
    this.blurColor,
    this.base46 = false,
    this.onFinishLottie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          color: backgroundColor,
          border: border),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ExtensionWidget((() {
              if (url?.isNotEmpty != true) {
                return _errorWidget(context);
              } else if (base46) {
                return Image.memory(
                  base64Decode(url!),
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.contain,
                  color: color,
                  gaplessPlayback: true,
                  errorBuilder: (context, error, stackTrace) =>
                      _errorWidget(context),
                );
              } else if (url?.startsWith("http") == true) {
                return CashNetworkImage(
                  url!,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.contain,
                  color: color,
                  borderRadius: borderRadius,
                );
              } else if (url?.split(".").last.toLowerCase() == "svg") {
                return SvgPicture.asset(
                  url!,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.contain,
                  colorFilter: color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
                );
              } else if (url?.split(".").last.toLowerCase() == "json") {
                return CustomLottie(
                  url!,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.contain,
                  onFinish: onFinishLottie,
                );
              } else if (isFile) {
                return Image.file(
                  File(url!),
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.contain,
                  color: color,
                  errorBuilder: (context, error, stackTrace) =>
                      _errorWidget(context),
                );
              } else {
                return Image.asset(
                  url!,
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.contain,
                  color: color,
                  errorBuilder: (context, error, stackTrace) =>
                      _errorWidget(context),
                );
              }
            })())
                .center,
            Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.zero,
                color: blurColor,
              ),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border ?? Border.all(color: context.hoverColor),
        ),
        height: height,
        width: width,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 30.w,
            maxHeight: 30.w,
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(Icons.broken_image, color: context.hoverColor),
          ),
        ),
      );
}

class CustomIconImage extends StatelessWidget {
  final String url;
  final double? size;
  final Color? color;

  const CustomIconImage(this.url, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(getImage(), size: size, color: color);
  }

  getImage() {
    if (url.split(".").last == "svg") {
      return svg.Svg(url);
    } else {
      return AssetImage(url);
    }
  }
}

class CustomLottie extends StatefulWidget {
  final double? height, width;
  final String? url;
  final BoxFit? fit;
  final Function? onFinish;

  const CustomLottie(this.url,
      {super.key, this.height, this.width, this.fit, this.onFinish});

  @override
  State<CustomLottie> createState() => _CustomLottieState();
}

class _CustomLottieState extends State<CustomLottie>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.url!,
      height: widget.height,
      width: widget.width,
      fit: widget.fit ?? BoxFit.contain,
      repeat: false,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward().whenComplete(
            () => Timer(1.seconds, () {
              if (widget.onFinish != null) widget.onFinish!();
            }),
          );
      },
    );
  }
}

class CashNetworkImage extends StatefulWidget {
  final String? url;
  final double? height, width;
  final BoxBorder? border;
  final BoxFit? fit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const CashNetworkImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.borderRadius,
    this.border,
  });

  @override
  State<CashNetworkImage> createState() => _CashNetworkImageState();
}

class _CashNetworkImageState extends State<CashNetworkImage> {
  final dio = Dio();
  Directory? cacheDirectory;
  bool isLoading = true, hasError = false;
  String? path;

  Future<String?> downloadImage(String? url) async {
    try {
      isLoading = true;
      hasError = false;
      if (url == null) {
        hasError = true;
        if (mounted) setState(() {});
        return null;
      }
      cacheDirectory ??= await getApplicationCacheDirectory();
      final savePath = '${cacheDirectory!.path}/${url.split('/').last}';
      final isDownloaded = await File(savePath).exists();
      if (isDownloaded) return path = savePath;
      await dio.download(url, savePath);
      return path = savePath;
    } catch (e) {
      hasError = true;
      if (mounted) setState(() {});
      return null;
    } finally {
      isLoading = false;
      if (mounted) setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    downloadImage(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    if (path != null) {
      return Image.file(
        File(path!),
        height: widget.height,
        width: widget.width,
        fit: widget.fit ?? BoxFit.contain,
        color: widget.color,
        errorBuilder: (context, error, stackTrace) {
          return _errorWidget();
        },
      );
    } else if (isLoading) {
      return loading();
    } else {
      return _errorWidget();
    }
  }

  Widget loading() => Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.zero),
        child: BaseShimmer(
            child: Center(
                child: CustomImage(Assets.icons.appLogo, height: 20.h)
                    .withPadding(horizontal: 10.w))),
      );

  Widget _errorWidget() {
    delete();
    return Container(
      margin: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(4.r),
        border: widget.border ?? Border.all(color: Colors.grey.shade200),
      ),
      height: widget.height,
      width: widget.width,
      child: Container(
        constraints: BoxConstraints(maxWidth: 30.w, maxHeight: 30.w),
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Icon(Icons.broken_image, color: Colors.grey.shade200),
        ),
      ),
    );
  }

  delete() {
    if (path != null) {
      File(path!).exists().then((value) {
        if (value) {
          File(path!).delete();
        }
      });
    }
  }
}
