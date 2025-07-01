import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_for_uicgroup/core/constants/assets.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/utils/global_user.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_rich_text.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/core/widgets/w_text_field.dart';
import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/widgets/w_gradient_container.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';

class VerifiyBioScreen extends StatefulWidget {
  const VerifiyBioScreen({super.key});

  @override
  State<VerifiyBioScreen> createState() => _VerifiyBioScreenState();
}

class _VerifiyBioScreenState extends State<VerifiyBioScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _selectedGender;
  DateTime? _selectedDate;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = getGlobalUser();
    if (user != null) {
      _fullNameController.text = user.name ?? '';
      _nickNameController.text = user.userName ?? '';
      _phoneNumberController.text = user.phoneNumber ?? '';
      _addressController.text = user.adress ?? '';
    }
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 2) {
      return 'Full name must be at least 2 characters';
    }
    return null;
  }

  String? _validateNickName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nick name is required';
    }
    if (value.length < 2) {
      return 'Nick name must be at least 2 characters';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+998[0-9]{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter valid phone number (+998XXXXXXXXX)';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    if (value.length < 5) {
      return 'Address must be at least 5 characters';
    }
    return null;
  }

  // User mavjudligini tekshirish funksiyasi
  Future<bool> _checkIfUserExists(String phoneNumber, String userName) async {
    try {
      // Bu yerda siz o'zingizning user storage sistemingizni ishlatishingiz kerak
      // Masalan: database query, API call, shared preferences va h.k.
      
      // Hozircha misol uchun - bu qismni o'z tizimingizga moslashtiring
      // Masalan, agar sizda userlar ro'yxati bo'lsa:
      // List<User> allUsers = await getAllUsersFromDatabase();
      // return allUsers.any((user) => 
      //   user.phoneNumber == phoneNumber || 
      //   user.userName == userName
      // );
      
      // Hozircha false qaytarish - bu yerda o'z logikangizni yozing
      return false;
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }

  void _showGenderPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Gender', style: AppTextStyles.s18w600),
              20.height,
              ..._genderOptions.map(
                (gender) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(gender, style: AppTextStyles.s16w400),
                  onTap: () {
                    setState(() {
                      _selectedGender = gender;
                    });
                    Navigator.pop(context);
                  },
                  trailing:
                      _selectedGender == gender
                          ? Icon(Icons.check, color: AppColors.primary)
                          : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(Duration(days: 365 * 16)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  bool _validateForm() {
    bool isValid = _formKey.currentState!.validate();

    if (_selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select gender'),
          backgroundColor: Colors.red,
        ),
      );
      isValid = false;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select date of birth'),
          backgroundColor: Colors.red,
        ),
      );
      isValid = false;
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            WidgetArrowBackButton(text: "Fill in your bio"),
            24.height,
            Text(
              "This data will be displayed in your account profile for security",
              style: AppTextStyles.s16w400,
            ),
            35.height,

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WRichText(
                    text1: "Full Name",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    validator: _validateFullName,
                    controller: _fullNameController,
                    hintText: "Enter your full name",
                    keyBoardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                  ),
                  20.height,

                  WRichText(
                    text1: "Nick Name",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    validator: _validateNickName,
                    controller: _nickNameController,
                    hintText: "Enter your nickname",
                    keyBoardType: TextInputType.name,
                  ),
                  20.height,

                  WRichText(
                    text1: "Phone Number",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    validator: _validatePhoneNumber,
                    controller: _phoneNumberController,
                    hintText: "+998XXXXXXXXX",
                    keyBoardType: TextInputType.phone,
                  ),
                  20.height,

                  WRichText(
                    text1: "Gender",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WScaleAnimation(
                    onTap: _showGenderPicker,
                    child: WContainerWithShadow(
                      borderRadius: BorderRadius.circular(32.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.w,
                      ),
                      color: AppColors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedGender ?? "Select Gender",
                            style:
                                _selectedGender != null
                                    ? AppTextStyles.s14w600
                                    : AppTextStyles.s14w400.copyWith(
                                      color: AppColors.green,
                                    ),
                          ),
                          SvgPicture.asset(Assets.dropDownIcon),
                        ],
                      ),
                    ),
                  ),
                  20.height,

                  WRichText(
                    text1: "Date of Birth",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WScaleAnimation(
                    onTap: _showDatePicker,
                    child: WContainerWithShadow(
                      borderRadius: BorderRadius.circular(32.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.w,
                      ),
                      color: AppColors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate != null
                                ? _formatDate(_selectedDate!)
                                : "Select Date",
                            style:
                                _selectedDate != null
                                    ? AppTextStyles.s14w600
                                    : AppTextStyles.s14w400.copyWith(
                                      color: AppColors.gray,
                                    ),
                          ),
                          SvgPicture.asset(Assets.calendarIcon),
                        ],
                      ),
                    ),
                  ),
                  20.height,

                  WRichText(
                    text1: "Address",
                    text2: "*",
                  ).paddingOnly(left: 24.w),
                  8.height,
                  WTextField(
                    validator: _validateAddress,
                    controller: _addressController,
                    hintText: "Enter your address",
                    keyBoardType: TextInputType.streetAddress,
                    textCapitalization: TextCapitalization.words,
                  ),
                ],
              ),
            ),
            40.height,

            WScaleAnimation(
              onTap: () async {
                if (!_validateForm()) {
                  return;
                }

                try {
                  final phoneNumber = _phoneNumberController.text.trim();
                  final userName = _nickNameController.text.trim();

                  final userExists = await _checkIfUserExists(phoneNumber, userName);
                  
                  if (userExists) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Bu foydalanuvchi allaqachon mavjud!',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  final currentUser = getGlobalUser();

                  updateGlobalUser(
                    userName: userName,
                    name: _fullNameController.text.trim(),
                    adress: _addressController.text.trim(),
                    phoneNumber: phoneNumber,
                    location:
                        currentUser?.location ??
                        Locationn(lat: 11.1, lng: 11.1),
                    savedRestaurants:
                        currentUser?.savedRestaurants ?? {"rest_001": true},
                    likedMeals:
                        currentUser?.likedMeals ??
                        {"meal_001": true, "meal_005": true},
                    photoUrl: currentUser?.photoUrl ?? '',
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Foydalanuvchi muvaffaqiyatli saqlandi!',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );

                  context.push(AppRoutesNames.uploadImage);

                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Xato yuz berdi: ${e.toString()}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: WGradientContainer(
                child: Text(
                  "Next",
                  style: AppTextStyles.s18w600.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            24.height,
          ],
        ).paddingAll(24.w),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}