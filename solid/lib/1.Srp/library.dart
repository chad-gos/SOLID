import 'book.dart';
import 'book_repository.dart';
import 'book_search_service.dart';

class Library {
  final BookRepository _repository;
  late BookSearchService _searchService;

  Library() : _repository = BookRepository() {
    _searchService = BookSearchService(_repository.getAllBooks());
  }

  void addBook(Book book) {
    _repository.addBook(book);
    _searchService = BookSearchService(_repository.getAllBooks());
  }

  void removeBook(String title) {
    _repository.removeBook(title);
    _searchService = BookSearchService(_repository.getAllBooks());
  }

  List<Book> getAllBooks() => _repository.getAllBooks();
  int getTotalBooks() => _repository.getTotalBooks();
  Book? findBookByTitle(String title) => _searchService.findBookByTitle(title);
  List<Book> findBooksByAuthor(String author) => _searchService.findBooksByAuthor(author);
  List<Book> findBooksByYear(int year) => _searchService.findBooksByYear(year);
}