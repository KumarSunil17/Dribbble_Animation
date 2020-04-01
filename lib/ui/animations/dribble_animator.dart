import 'package:flutter/animation.dart';

class DribbleAnimator {
  final AnimationController controller;
  final Animation<double> homeYTranslation;
  final Animation<double> searchYTranslation;
  final Animation<double> homeTitleOpacity;
  final Animation<double> searchOpacity;
  final Animation<double> searchCoursesXTranslation;
  final Animation<double> searchCoursesListOpacity;
  final Animation<double> studyingCoursesOpacity;
  final Animation<double> studyingCoursesYTranslation;
final Animation<double> progressYTranslation;
final Animation<double> progressOpacity;
final Animation<double> progressSize;
final Animation<double> tabControllerOpacity;
  DribbleAnimator(this.controller)
      :
        //Title, subtitle along with search field X translation
        this.homeYTranslation = Tween(begin: 100.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.400,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
        this.homeTitleOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        this.searchYTranslation =
            Tween(begin: 220.0, end: 50.0).animate(CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.000,
                  0.400,
                  curve: Curves.fastOutSlowIn,
                ))),
        //Search field opacity while X translation
        this.searchOpacity = Tween(begin: 0.5, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        this.studyingCoursesYTranslation =
            Tween(begin: 340.0, end: 500.0).animate(CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.000,
                  0.300,
                  curve: Curves.fastOutSlowIn,
                ))),
        //Studing couse and progress switch opacity when search field is focused
        this.studyingCoursesOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        this.progressYTranslation = Tween(begin: 470.0, end: 387.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        this.progressOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        this.progressSize = Tween(begin: 60.0, end: 20.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        this.tabControllerOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        
        //Enter opacity animation of searched list
        this.searchCoursesListOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        //Enter X tranalation of searched list
        this.searchCoursesXTranslation = Tween(begin: 700.0, end: 180.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.500,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );
}
