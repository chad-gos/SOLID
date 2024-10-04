import 'book.dart';

class BookSearchService {
  final List<Book> _books;

  BookSearchService(this._books);

  Book? findBookByTitle(String title) {
    return _books.firstWhere(
      (book) => book.title == title,
      orElse: () => throw BookNotFoundException('Book not found with title: $title'),
    );
  }

  List<Book> findBooksByAuthor(String author) {
    return _books.where((book) => book.author == author).toList();
  }

  List<Book> findBooksByYear(int year) {
    return _books.where((book) => book.publicationYear == year).toList();
  }
}

class BookNotFoundException implements Exception {
  final String message;
  BookNotFoundException(this.message);
}