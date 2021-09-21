class Language {
  final int id;
  final String name;
  final String languageCode;

  const Language(this.id, this.name, this.languageCode);


}

const List<Language> getLanguages = <Language>[
  Language(1, 'English', 'EN'),
  Language(2, 'हिंदी', 'HI'),
  Language(3, 'پشتو', 'PS'),
  Language(4, 'ગુજરાતી', 'GU'),
];