import 'book.dart';

class BookRepository {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAllBooks() {
    return List.unmodifiable(_books);
  }

  void removeBook(String title) {
    _books.removeWhere((book) => book.title == title);
  }

  int getTotalBooks() {
    return _books.length;
  }
}