class Book {
  final String title;
  final String author;
  final int publicationYear;

  Book({
    required this.title,
    required this.author,
    required this.publicationYear,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          publicationYear == other.publicationYear;

  @override
  int get hashCode => title.hashCode ^ author.hashCode ^ publicationYear.hashCode;
}