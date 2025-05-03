import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utils/extensions.dart';
import 'app_sheet.dart';
import 'custom_image.dart';

class PickImage extends StatefulWidget {
  final String title;
  final Function(XFile)? onImagePicked;
  const PickImage({
    super.key,
    required this.title,
    this.onImagePicked,
  });

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        SizedBox(height: 32.h),
        Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pick(ImageSource.camera).then((value) {
                      if (value != null) {
                        widget.onImagePicked?.call(value);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: CustomImage(
                      "assets/icons/camera.svg",
                      color: context.hintColor,
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "camera",
                  style: context.regularText.copyWith(
                    fontSize: 14,
                    color: context.hintColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ).withPadding(end: 30.w),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pick(ImageSource.gallery).then((value) {
                      if (value != null) {
                        widget.onImagePicked?.call(value);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: CustomImage(
                      "assets/icons/gallery.svg",
                      color: context.hintColor,
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "gallery",
                  style: context.regularText
                      .copyWith(fontSize: 14, color: context.hintColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
        SafeArea(child: SizedBox(height: 20.w)),
      ],
    );
  }

  Future<XFile?> pick(ImageSource type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: type);
    return file;
  }
}

class PickVideo extends StatefulWidget {
  final String title;
  final Function(XFile)? onVideoPicked;

  const PickVideo({
    super.key,
    required this.title,
    this.onVideoPicked,
  });

  @override
  State<PickVideo> createState() => _PickVideoState();
}

class _PickVideoState extends State<PickVideo> {
  @override
  Widget build(BuildContext context) {
    return CustomAppSheet(
      title: widget.title,
      children: [
        SizedBox(height: 32.h),
        Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pick(ImageSource.camera).then((value) {
                      if (value != null) {
                        widget.onVideoPicked?.call(value);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: CustomImage(
                      "assets/icons/camera.svg",
                      color: context.hintColor,
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "camera",
                  style: context.regularText
                      .copyWith(fontSize: 14, color: context.hintColor),
                  textAlign: TextAlign.center,
                )
              ],
            ).withPadding(end: 30.w),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pick(ImageSource.gallery).then((value) {
                      if (value != null) {
                        widget.onVideoPicked?.call(value);
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.hoverColor),
                    ),
                    child: CustomImage(
                      "assets/icons/gallery.svg",
                      color: context.hintColor,
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "gallery",
                  style: context.regularText
                      .copyWith(fontSize: 14, color: context.hintColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
        SafeArea(child: SizedBox(height: 20.w)),
      ],
    );
  }

  Future<XFile?> pick(ImageSource type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickVideo(source: type);
    return file;
  }
}
