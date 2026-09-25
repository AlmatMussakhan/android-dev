class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => !book.isBorrowed).toList();
  }

  double getTotalValue() {
    return _books.fold(0.0, (sum, book) => sum + book.price);
  }
}

void main() {
  Library library = Library();

  library.addBook(Book(title: 'Clean Code', author: 'Robert Martin', price: 12500.0));
  library.addBook(Book(title: 'Dart Programming', author: 'G. Latter', price: 9800.0, isBorrowed: true));
  library.addBook(Book(title: 'Flutter in Action', author: 'Eric Windmill', price: 15000.0));
  library.addBook(Book(title: 'Design Patterns', author: 'Erich Gamma', price: 18400.0, isBorrowed: true));

  print('books in library:');
  List<Book> available = library.getAvailableBooks();
  for (var book in available) {
    print('- "${book.title}" (${book.author}) — ${book.price} ₸');
  }

  double totalValue = library.getTotalValue();
  print('\n💰 Total value of all books in the library: $totalValue ₸');
}