// import 'package:flutter/material.dart';
// import 'package:task_for_uicgroup/core/extensions/num_extensions.dart';

// import 'w_scale_animation.dart';

// class WButton extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final String text;
//   final Color? buttonColor;
//   final Color? color;
//   final Color? textColor;
//   final TextStyle? textStyle;
//   final EdgeInsets? margin;
//   final EdgeInsets? padding;
//   final GestureTapCallback onTap;
//   final Widget? child;
//   final BoxBorder? border;
//   final bool loading;
//   final bool disabled;
//   final double? borderRadius;
//   final Color disabledColor;

//   const WButton({
//     required this.onTap,
//     this.buttonColor,
//     this.width,
//     this.borderRadius,
//     this.height,
//     this.text = '',
//     this.color,
//     this.textColor,
//     this.textStyle,
//     this.margin,
//     this.padding,
//     this.border,
//     this.loading = false,
//     this.disabled = false,
//     this.disabledColor = Colors.black,
//     super.key,
//     this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: margin ?? EdgeInsets.zero,
//       child: WScaleAnimation(
//         onTap: () {
//           if (!(loading || disabled)) {
//             onTap();
//           }
//         },
//         isDisabled: disabled,
//         child: Container(
//           padding: padding ?? const EdgeInsets.symmetric(vertical: 13),
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: disabled ? disabledColor : color ?? Colors.white,
//             borderRadius:
//                 borderRadius != null
//                     ? BorderRadius.circular(borderRadius!)
//                     : BorderRadius.only(
//                       bottomRight: Radius.circular(60.o),
//                       bottomLeft: Radius.circular(30.o),
//                       topLeft: Radius.circular(60.o),
//                       topRight: Radius.circular(30.o),
//                     ),
//             border: border,
//           ),
//           child:
//               loading
//                   ? const Center(
//                     child: CircularProgressIndicator(strokeCap: StrokeCap.butt),
//                   )
//                   : Align(
//                     alignment: Alignment.center,
//                     child:
//                         child ??
//                         Text(
//                           text,
//                           style:
//                               textStyle ??
//                               TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w700,
//                                 color: textColor ?? Colors.white,
//                                 fontFamily: "MontserretMediumItalic",
//                               ),
//                         ),
//                   ),
//         ),
//       ),
//     );
//   }
// }