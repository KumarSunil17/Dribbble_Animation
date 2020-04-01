class Course {
  String category;
  String title;
  int totalEpisodes;
  int completedLessons;
  String imageUrl;

  Course(
      {this.category,
      this.completedLessons,
      this.imageUrl,
      this.title,
      this.totalEpisodes});
}

final List<Course> courses = [
  Course(
      title: 'App Developent using Flutter',
      category: 'Software developement',
      imageUrl:
          'https://image.freepik.com/free-vector/app-development-concept-with-flat-design_23-2147856752.jpg',
      totalEpisodes: 7,
      completedLessons: 3),
  Course(
      title: 'Probability and Statistics',
      category: 'Mathematics',
      imageUrl:
          'https://image.freepik.com/free-vector/data-inform-illustration-concept_114360-864.jpg',
      totalEpisodes: 5,
      completedLessons: 3),
  Course(
      title: 'Database normalisation',
      category: 'Database management',
      imageUrl:
          'https://image.freepik.com/free-vector/big-data-center-server-room-rack-engineering-process-teamwork-computer-technology-cloud-storage_39422-1032.jpg',
      totalEpisodes: 5,
      completedLessons: 3),
  Course(
      title: 'Business deal management',
      category: 'Business management',
      imageUrl:
          'https://image.freepik.com/free-vector/business-deal-concept-illustration_114360-1103.jpg',
      totalEpisodes: 4,
      completedLessons: 4),
  Course(
      title: 'Things you can do at home',
      category: 'Quarantine',
      imageUrl:
          'https://image.freepik.com/free-vector/design-staying-home-infographic-with-things_23-2148481002.jpg',
      totalEpisodes: 4,
      completedLessons: 4),
  Course(
      title: 'Things you can do at home',
      category: 'Lockdown',
      imageUrl:
          'https://image.freepik.com/free-vector/stay-home-infographic-flat-design_23-2148483813.jpg',
      totalEpisodes: 4,
      completedLessons: 4),
  Course(
      title: 'Things you during lockdown',
      category: 'Lockdown',
      imageUrl:
          'https://image.freepik.com/free-vector/casual-woman-relaxing-couch-listening-music_23-2148424545.jpg',
      totalEpisodes: 4,
      completedLessons: 4),
  Course(
      title: 'Management and Conservation of wildlife',
      category: 'Environmental science',
      imageUrl:
          'https://image.freepik.com/free-vector/mountains-landscape-with-pine-trees-sunset_23-2148260425.jpg',
      totalEpisodes: 4,
      completedLessons: 2),
  Course(
      title: 'Natural disasters and their management',
      category: 'Environmental science',
      imageUrl:
          "https://image.freepik.com/free-vector/sunset-sunrise-ocean-nature-landscape_33099-2244.jpg",
      totalEpisodes: 4,
      completedLessons: 2),
  Course(
      title: 'Environment polution',
      category: 'Environmental science',
      imageUrl:
          'https://image.freepik.com/free-vector/mountains-landscape-with-pine-trees-sunset_23-2148260425.jpg',
      totalEpisodes: 4,
      completedLessons: 2),
];
