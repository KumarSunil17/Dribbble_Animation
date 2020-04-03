import 'package:flutter/material.dart';
import 'package:multiple_animations/models/course_model.dart';
import 'package:multiple_animations/ui/animations/dribble_animator.dart';
import 'package:multiple_animations/ui/utils/dribble_colors.dart';
import 'package:multiple_animations/ui/widgets/course_card.dart';
import 'package:multiple_animations/ui/widgets/dribble_progress.dart';
import 'package:multiple_animations/ui/widgets/dribble_search_button.dart';
import 'package:multiple_animations/ui/widgets/search_course_card.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final FocusNode _searchFocus = FocusNode();
  TextEditingController _searchController;
  AnimationController _controller;
  DribbleAnimator _animator;
  List<Course> _searchedCourses = [];
  PageController _pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animator = DribbleAnimator(_controller);
    _searchController = TextEditingController()
      ..addListener(() {
        String text = _searchController.text.toString().trim().toLowerCase();
        if (text.isNotEmpty)
          setState(() {
            _searchedCourses = courses
                .where((element) =>
                    element.category.toLowerCase().contains(text) ||
                    element.title.toLowerCase().contains(text))
                .toList();
          });
      });
    _pageController = PageController(initialPage: 0);

    _searchFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    _searchController.dispose();
    _controller.dispose();
    _pageController.dispose();

    super.dispose();
  }

  _changePage(int page) {
    setState(() {
      _page = page;
    });
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_controller.isDismissed) {
          if (_searchFocus.hasFocus) {
            _searchFocus.unfocus();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        } else {
          _searchController.clear();
          _searchFocus.unfocus();
          _controller.reverse();
          return Future.value(false);
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) => Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: DribbleColors.background,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, -2),
                      spreadRadius: 1,
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 24,
                unselectedItemColor: Colors.black87,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book), title: Text('Courses')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text('Profile')),
                ],
              ),
            ),
          ),
          body: Stack(fit: StackFit.expand, children: [
            Positioned(
              top: _animator.titleYTranslation.value,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: _animator.titleOpacity.value,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Hi, Antonio',
                      style: TextStyle(
                          fontSize: 26,
                          color: DribbleColors.title,
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: '\nWhat would like to learn\ntoday? Search below.',
                      style: TextStyle(
                          fontSize: 16, color: DribbleColors.subtitle),
                    )
                  ]),
                ),
              ),
            ),
            Positioned(
              top: _animator.searchFieldYTranslation.value + 15,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: _animator.searchTextOpacity.value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_searchController.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: DribbleColors.title,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: _animator.searchFieldYTranslation.value,
                child: Opacity(
                  opacity: _animator.searchFieldOpacity.value,
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: _searchFocus.hasFocus ? 8 : 0,
                    shadowColor: Colors.grey.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                                controller: _searchController,
                                focusNode: _searchFocus,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: DribbleColors.title,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Looking for ...',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: DribbleColors.hintColor,
                                      fontWeight: FontWeight.w600),
                                  contentPadding:
                                      const EdgeInsets.only(left: 48),
                                )),
                          ),
                          DribbleSearchButton(() {
                            String query =
                                _searchController.text.toString().trim();
                            if (query.isNotEmpty) {
                              _searchFocus.unfocus();
                              _controller.forward();
                            } else {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Enter what you want to search.'),
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                )),
            if (_searchFocus.hasFocus)
              Positioned(
                top: _animator.progressYTranslation.value,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: _animator.progressOpacity.value,
                  child: Container(
                    alignment: Alignment.center,
                    height: _animator.progressSize.value,
                    width: _animator.progressSize.value,
                    child: Center(
                        child: DribbleProgress(
                            strokeWidth: 6,
                            color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
            if (!_searchFocus.hasFocus)
              Positioned(
                top: _animator.studyingCoursesYTranslation.value,
                left: 0,
                right: 0,
                height: 400,
                child: Opacity(
                  opacity: _animator.studyingCoursesOpacity.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'STUDYING',
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.3,
                              color: DribbleColors.title,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: courses.length,
                          itemBuilder: (ctx, i) => Align(
                              alignment: Alignment.topLeft,
                              child: CourseCard(courses[i])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: _animator.tabControllerOpacity.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        shadowColor: Colors.grey.withOpacity(0.4),
                        color: Colors.white,
                        elevation: _page == 0 ? 6 : 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30))),
                        child: InkWell(
                          onTap: () {
                            _changePage(0);
                          },
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30)),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: Text('COURSES',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1,
                                        color: _page == 0
                                            ? DribbleColors.title
                                            : Colors.grey))),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.black12,
                      ),
                      Material(
                        shadowColor: Colors.grey.withOpacity(0.4),
                        color: Colors.white,
                        elevation: _page == 1 ? 6 : 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(30))),
                        child: InkWell(
                          onTap: () {
                            _changePage(1);
                          },
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30)),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: Text('PUBLIC',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1,
                                        color: _page == 1
                                            ? DribbleColors.title
                                            : Colors.grey))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: _animator.searchCoursesXTranslation.value,
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: _animator.searchCoursesListOpacity.value,
                child: PageView(controller: _pageController, children: [
                  ListView.builder(
                    itemCount: _searchedCourses.length,
                    itemBuilder: (ctx, index) =>
                        SearchedCourseCard(_searchedCourses[index]),
                  ),
                  Center(child: Text('Not implemented yet!'))
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
