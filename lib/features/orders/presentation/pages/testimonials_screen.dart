import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/widgets/widget_arrow_back_button.dart';

import '../../../../core/constants/assets.dart';
import '../widgets/widget_info_user_container.dart';

class TestimonialsScreen extends StatefulWidget {
  const TestimonialsScreen({super.key});

  @override
  State<TestimonialsScreen> createState() => _TestimonialsScreenState();
}

class _TestimonialsScreenState extends State<TestimonialsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          WidgetArrowBackButton(text: "Testimonials"),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder:
                (context, index) => WidgetInfoUserContainer(
                  mediaQueryHeight: mediaQueryHeight,
                  mediaQueryWidth: mediaQueryWidth,
                  image: Assets.person,
                  title1: "Jenny Wilson",
                  title2: "December 20, 2021",
                  title3:
                      "The food is very delicious and the service is satisfying! Love it!",
                ),
          ),
        ],
      ),
    );
  }
}
