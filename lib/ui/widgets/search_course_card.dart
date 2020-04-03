import 'package:flutter/material.dart';
import 'package:multiple_animations/models/course_model.dart';
import 'package:multiple_animations/ui/utils/dribbble_colors.dart';

class SearchedCourseCard extends StatelessWidget {
  final Course course;
  const SearchedCourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade100.withOpacity(0.5),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.fromLTRB(28, 0, 28, 28),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 140,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: course.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    course.title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18,
                        color: DribbbleColors.title,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${course.totalEpisodes} Chapters',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
