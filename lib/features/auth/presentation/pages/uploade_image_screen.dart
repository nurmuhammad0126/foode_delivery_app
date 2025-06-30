import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';
import 'package:task_for_uicgroup/features/auth/presentation/widgets/widget_for_set_button.dart';
import 'package:task_for_uicgroup/core/utils/global_user.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  String? base64Image;
  bool isProcessing = false;
  final ImagePicker _picker = ImagePicker();

  Future<bool> _checkPermission(ImageSource source) async {
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      return status.isGranted;
    } else {
      final status = await Permission.photos.request();
      return status.isGranted;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final hasPermission = await _checkPermission(source);
      if (!hasPermission) {
        _showSnackBar(
          source == ImageSource.camera
              ? 'Kamera uchun ruxsat kerak'
              : 'Galereya uchun ruxsat kerak',
          isError: true,
        );
        return;
      }

      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        if (await file.exists()) {
          setState(() {
            image = file;
          });

          await _convertToBase64(file);
        } else {
          _showSnackBar('Fayl topilmadi', isError: true);
        }
      }
    } on Exception catch (e) {
      String errorMessage = 'Rasm tanlashda xatolik';

      if (e.toString().contains('permission')) {
        errorMessage = 'Kamera yoki galereya uchun ruxsat kerak';
      } else if (e.toString().contains('camera')) {
        errorMessage = 'Kamera ishlamayapti';
      } else if (e.toString().contains('gallery')) {
        errorMessage = 'Galereya ochilmadi';
      }

      _showSnackBar(errorMessage, isError: true);
      print('Image picker error: $e');
    }
  }

  Future<void> _convertToBase64(File imageFile) async {
    try {
      setState(() => isProcessing = true);

      final Uint8List imageBytes = await imageFile.readAsBytes();

      final String base64String = base64Encode(imageBytes);

      setState(() {
        base64Image = base64String;
        isProcessing = false;
      });

      _showSnackBar('Rasm muvaffaqiyatli yuklandi!');
    } catch (e) {
      setState(() => isProcessing = false);
      _showSnackBar(
        'Rasm qayta ishlashda xatolik: ${e.toString()}',
        isError: true,
      );
    }
  }

  // String _getMimeType(String filePath) {
  //   String extension = filePath.split('.').last.toLowerCase();
  //   switch (extension) {
  //     case 'jpg':
  //     case 'jpeg':
  //       return 'image/jpeg';
  //     case 'png':
  //       return 'image/png';
  //     case 'gif':
  //       return 'image/gif';
  //     case 'webp':
  //       return 'image/webp';
  //     case 'bmp':
  //       return 'image/bmp';
  //     default:
  //       return 'image/jpeg';
  //   }
  // }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOption(
                  icon: Icons.camera_alt,
                  title: 'Kameradan olish',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                _buildOption(
                  icon: Icons.photo_library,
                  title: 'Galereyadan tanlash',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                if (image != null)
                  _buildOption(
                    icon: Icons.delete,
                    title: 'Rasmni olib tashlash',
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        image = null;
                        base64Image = null;
                      });
                    },
                    isDestructive: true,
                  ),
              ],
            ),
          ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : null),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : null),
      ),
      onTap: onTap,
    );
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : AppColors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.height,
            WidgetArrowBackButton(text: "Upload your photo"),
            24.height,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "This data will be displayed in your account profile for security",
                style: AppTextStyles.s16w500,
                textAlign: TextAlign.center,
              ),
            ),
            40.height,

            _buildImageSection(),

            Spacer(),

            _buildNextButton(),
            24.height,
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    if (image == null) {
      return Column(
        children: [
          WScaleAnimation(
            onTap: () => _pickImage(ImageSource.camera),
            child: WidgetForSetButton(
              text: "Take photo",
              icons: Icons.camera_alt_rounded,
            ),
          ),
          24.height,
          WScaleAnimation(
            onTap: () => _pickImage(ImageSource.gallery),
            child: WidgetForSetButton(
              text: "From gallery",
              icons: Icons.photo_library,
            ),
          ),
        ],
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 250.w,
          height: 250.h,
          decoration: BoxDecoration(
            color: AppColors.gray100,
            shape: BoxShape.circle,
            image: DecorationImage(image: FileImage(image!), fit: BoxFit.cover),
          ),
        ),

        Positioned(
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onTap: _showImagePickerOptions,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.edit, color: AppColors.white, size: 20),
            ),
          ),
        ),

        if (isProcessing)
          Container(
            width: 250.w,
            height: 250.h,
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 3,
                ),
                16.height,
                Text(
                  'Qayta ishlanmoqda...',
                  style: AppTextStyles.s14w400.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: WScaleAnimation(
        onTap: () {
          updateGlobalUser(photoUrl: base64Image!);
          context.go(AppRoutesNames.setLocation);
        },
        child: WGradientContainer(
          colors:
              isProcessing
                  ? [Colors.grey.shade400, Colors.grey.shade500]
                  : [Color(0xFFFF7E95), Color(0xFFFF1843)],
          child: Center(
            child: Text(
              isProcessing ? "Qayta ishlanmoqda..." : "Next",
              style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
