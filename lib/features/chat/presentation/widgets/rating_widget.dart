import 'package:flutter/material.dart';
import 'package:task_for_uicgroup/core/constants/app_colors.dart';



class StarRating extends StatelessWidget {
  final int rating;
  final double size;
  
  const StarRating({
    Key? key,
    required this.rating,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? AppColors.primary : AppColors.primary,
          size: size,
        );
      }),
    );
  }
}

// Ishlatish misoli:
class StarRatingExample extends StatefulWidget {
  @override
  _StarRatingExampleState createState() => _StarRatingExampleState();
}

class _StarRatingExampleState extends State<StarRatingExample> {
  int currentRating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Rating Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rating: $currentRating/5',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            StarRating(
              rating: currentRating,
              size: 32.0,
            ),
            SizedBox(height: 30),
            Text('Ratingni o\'zgartiring:'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentRating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 18,
                        color: currentRating == index + 1 
                            ? AppColors.primary 
                            : Colors.grey,
                        fontWeight: currentRating == index + 1 
                            ? FontWeight.bold 
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}