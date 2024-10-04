import 'package:solid/1.Srp/book.dart';
import 'package:solid/1.Srp/book_search_service.dart';
import 'package:solid/1.Srp/library.dart';
import 'package:test/test.dart';

void main() {
  late Library library;
  late Book book1;
  late Book book2;

  setUp(() {
    library = Library();
    book1 = Book(
      title: 'Clean Code',
      author: 'Edric Cao',
      publicationYear: 2023,
    );
    book2 = Book(
      title: 'Design Pattern',
      author: 'Edric Cao',
      publicationYear: 2022,
    );
  });

  group('Library Tests', () {
    test('should add books correctly', () {
      library.addBook(book1);
      library.addBook(book2);
      expect(library.getTotalBooks(), equals(2));
    });

    test('should find book by title', () {
      library.addBook(book1);
      final foundBook = library.findBookByTitle('Clean Code');
      expect(foundBook, equals(book1));
    });

    test('should throw exception when book not found', () {
      expect(
        () => library.findBookByTitle('Non-existent Book'),
        throwsA(isA<BookNotFoundException>()),
      );
    });

    test('should find books by author', () {
      library.addBook(book1);
      library.addBook(book2);
      final books = library.findBooksByAuthor('Edric Cao');
      expect(books.length, equals(2));
    });

    test('should find books by year', () {
      library.addBook(book1);
      library.addBook(book2);
      final books = library.findBooksByYear(2023);
      expect(books.length, equals(1));
      expect(books.first, equals(book1));
    });

    test('should remove book correctly', () {
      library.addBook(book1);
      library.addBook(book2);
      library.removeBook('Clean Code');
      expect(library.getTotalBooks(), equals(1));
      expect(
        () => library.findBookByTitle('Clean Code'),
        throwsA(isA<BookNotFoundException>()),
      );
    });
  });
}