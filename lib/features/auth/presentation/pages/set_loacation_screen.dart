import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';
import 'package:task_for_uicgroup/core/constants/app_textstyles.dart';
import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';
import 'package:task_for_uicgroup/core/extensions/widget_extensions.dart';
import 'package:task_for_uicgroup/core/routes/route_names.dart';
import 'package:task_for_uicgroup/core/utils/global_user.dart';
import 'package:task_for_uicgroup/core/widgets/w_container_with_shadow.dart';
import 'package:task_for_uicgroup/core/widgets/w_gradient_container.dart';
import 'package:task_for_uicgroup/core/widgets/w_scale_animation.dart';
import 'package:task_for_uicgroup/features/auth/presentation/widgets/widget_for_set_button.dart';
import 'package:task_for_uicgroup/features/profile/data/model/user_model.dart';
import 'package:task_for_uicgroup/features/profile/data/repository/user_local_repository.dart';
import 'package:task_for_uicgroup/features/profile/presentation/bloc/user_bloc.dart';
import 'package:task_for_uicgroup/features/profile/presentation/bloc/user_event.dart';
import '../../../../core/widgets/widget_arrow_back_button.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  final userLocalRepo = UserLocalRepository();
  GoogleMapController? mapController;
  LatLng? currentPosition;
  LatLng? selectedPosition;
  String selectedAddress = "Joylashuvni tanlang";
  bool isLoading = true;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Joriy joylashuvni olish
  Future<void> _getCurrentLocation() async {
    try {
      // Ruxsat so'rash
      final permission = await Permission.location.request();
      if (permission.isDenied) {
        _showPermissionDialog();
        return;
      }

      // Joylashuv xizmatlarini tekshirish
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showLocationServiceDialog();
        return;
      }

      // Joriy pozitsiyani olish
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        selectedPosition = currentPosition;
        isLoading = false;
      });

      // Marker qo'shish
      _addMarker(currentPosition!);

      // Manzilni olish
      _getAddressFromLatLng(currentPosition!);

      // Xaritani joriy joylashuvga yo'naltirish
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPosition!, zoom: 15.0),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorDialog("Joylashuvni olishda xatolik: $e");
    }
  }

  void _addMarker(LatLng position) {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          infoWindow: const InfoWindow(title: 'Tanlangan joylashuv'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address = '';

        if (place.street != null && place.street!.isNotEmpty) {
          address += place.street!;
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          address +=
              address.isEmpty ? place.subLocality! : ', ${place.subLocality!}';
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          address += address.isEmpty ? place.locality! : ', ${place.locality!}';
        }

        setState(() {
          selectedAddress = address.isEmpty ? 'Noma\'lum manzil' : address;
        });
      }
    } catch (e) {
      setState(() {
        selectedAddress = 'Manzilni aniqlab bo\'lmadi';
      });
    }
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      selectedPosition = position;
    });
    _addMarker(position);
    _getAddressFromLatLng(position);
  }

  void _goToCurrentLocation() {
    if (currentPosition != null && mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosition!, zoom: 15.0),
        ),
      );
      setState(() {
        selectedPosition = currentPosition;
      });
      _addMarker(currentPosition!);
      _getAddressFromLatLng(currentPosition!);
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Joylashuv ruxsati'),
            content: const Text(
              'Ilovaga joylashuv ma\'lumotlariga ruxsat bering.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Bekor qilish'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('Sozlamalar'),
              ),
            ],
          ),
    );
  }

  void _showLocationServiceDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Joylashuv xizmati'),
            content: const Text('Joylashuv xizmatini yoqing.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Xatolik'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _saveLocation() async {
    if (selectedPosition != null) {
      await userLocalRepo.saveProfileCompleted(true);
      context.goNamed(AppRoutesNames.home);
    } else {
      _showErrorDialog("Iltimos, joylashuvni tanlang");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: 24.h),
          const WidgetArrowBackButton(text: "Set your location"),
          SizedBox(height: 24.h),
          Text(
            "This data will be displayed in your account profile for security",
            style: AppTextStyles.s18w400,
          ),
          SizedBox(height: 24.h),
          WScaleAnimation(
            onTap: _goToCurrentLocation,
            child: const WidgetForSetButton(
              text: 'Joriy joylashuvga o\'tish',
              icons: Icons.my_location,
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: WContainerWithShadow(
              width: double.infinity,
              color: AppColors.background,
              border: Border.all(color: AppColors.primary, width: 2),
              child:
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : currentPosition == null
                      ? const Center(
                        child: Text("Joylashuvni aniqlab bo'lmadi"),
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target:
                                currentPosition ??
                                const LatLng(41.2995, 69.2401), // Toshkent
                            zoom: 15.0,
                          ),
                          markers: markers,
                          onTap: _onMapTapped,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: true,
                          mapToolbarEnabled: false,
                        ),
                      ),
            ),
          ),
          SizedBox(height: 24.h),
          WContainerWithShadow(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary, width: 2),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary100,
                  ),
                  child: const Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                      Text(
                        selectedAddress,
                        style: AppTextStyles.s16w700,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFF7E9B), Color(0xFFFF1843)],
                    ),
                  ),
                  child: Icon(Icons.edit, color: AppColors.white, size: 16.w),
                ),
              ],
            ),
          ),
          const Spacer(),
          WScaleAnimation(
            onTap: () {
              
              updateGlobalUser(
                location: Locationn(
                  lat: selectedPosition!.latitude,
                  lng: selectedPosition!.longitude,
                ),
                adress: selectedAddress,
              );
              final data = getGlobalUser();
              context.read<UserBloc>().add(AddUserEvent(data!));
              context.goNamed(AppRoutesNames.home);
              _saveLocation();
            },

            child: WGradientContainer(
              child: Text(
                "Set Location",
                style: AppTextStyles.s18w600.copyWith(color: AppColors.white),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ).paddingAll(24.w),
    );
  }
}
