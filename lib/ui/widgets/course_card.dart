import 'package:flutter/material.dart';
import 'package:multiple_animations/models/course_model.dart';

import 'course_progress.dart';

const Size cardSize = Size(300, 300);

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: cardSize,
      child: Card(
        shadowColor: Colors.grey.shade100.withOpacity(0.5),
        elevation: 8,
        margin: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: course.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Text(
                      course.category!,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(
                        width: cardSize.width / 2,
                        child: Center(
                          child: Text(
                            course.title!,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${course.completedLessons} of ${course.totalEpisodes} lessons',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Spacer(),
                        LinearPercentIndicator(
                          width: 50,
                          lineHeight: 8,
                          backgroundColor: Colors.black12,
                          percent:
                              course.completedLessons! / course.totalEpisodes!,
                          progressColor: Colors.greenAccent,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
