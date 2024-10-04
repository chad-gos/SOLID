Below is a code that violates Single Responsibility Principle. Please refactor and write a test case that covers 100% of the code below.

***HINT:*** First, we need to split the classes into separate files.
```
class Book {
    title: string;
    author: string;
    publicationYear: number;
    constructor(title: string, author: string, publicationYear: number) {
        this.title = title;
        this.author = author;
        this.publicationYear = publicationYear;
    }
}

class Library {
    books: Book[];

    constructor() {
        this.books = [];
    }
    addBook(book: Book): void {
        this.books.push(book);
    }

    getListBooks(): Book[] {
        return this.books;
    }

    removeBook(title: string): void {
        this.books = this.books.filter(book => book.title !== title);
    }

    getBookByTitle(title: string): Book | undefined {
        return this.books.find(book => book.title === title);
    }

    getTotalNumberOfBooks(): number {
        return this.books.length;
    }

    getBooksByAuthor(author: string): Book[] {
        return this.books.filter(book => book.author === author);
    }

    getBooksByPublicationYear(publicationYear: number): Book[] {
        return this.books.filter(book => book.publicationYear === publicationYear);
    }
}

let lib: Library;
lib = new Library();

let book1: Book;
book1 = new Book('Clean Code', 'Edric Cao', 2023);

let book2: Book;
book2 = new Book('Design Pattern', 'Edric Cao', 2022);

lib.addBook(book1);
lib.addBook(book2);
console.log(lib.getBookByTitle('Clean Code')); // Output: Book { title: 'Clean Code', author: 'Edric Cao', publicationYear: 2023 }
```