import 'package:flutter/animation.dart';

class DribbleAnimator {
  final AnimationController controller;
  final Animation<double> titleYTranslation;
  final Animation<double> titleOpacity;
  final Animation<double> searchFieldYTranslation;
  final Animation<double> searchFieldOpacity;
  final Animation<double> searchTextOpacity;
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

        ///Title, subtitle X translation
        this.titleYTranslation = Tween(begin: 100.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.700,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),

        ///Title, subtitle opacity
        this.titleOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Search field Y translation
        this.searchFieldYTranslation =
            Tween(begin: 220.0, end: 50.0).animate(CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.000,
                  0.400,
                  curve: Curves.fastOutSlowIn,
                ))),

        ///Search field opacity
        this.searchFieldOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Search text opacity
        this.searchTextOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Studying courses list Y translation to down
        this.studyingCoursesYTranslation =
            Tween(begin: 340.0, end: 550.0).animate(CurvedAnimation(
                parent: controller,
                curve: Interval(
                  0.000,
                  0.500,
                  curve: Curves.fastOutSlowIn,
                ))),

        ///Studying courses opacity
        this.studyingCoursesOpacity = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.400,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Progress widget Y translation
        this.progressYTranslation = Tween(begin: 450.0, end: 370.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.400,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),

        ///Progress widget opacity
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

        ///Progress widget opacity
        this.progressSize = Tween(begin: 60.0, end: 5.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),

        ///after search tab controller opacity
        this.tabControllerOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.700,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Enter opacity animation of searched list
        this.searchCoursesListOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.100,
              0.400,
              curve: Curves.ease,
            ),
          ),
        ),

        ///Enter X translation of searched list
        this.searchCoursesXTranslation =
            Tween(begin: 700.0, end: 180.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.100,
              0.700,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );
}
