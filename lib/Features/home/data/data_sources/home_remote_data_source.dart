// import 'package:bookly/Features/home/data/models/book/book.dart';
import 'package:bookly/Features/home/data/models/book/book.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_sevices.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiSevice apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?key=${apiService.key}&Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(Book.fromJson(book));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint:
          'volumes?key=${apiService.key}&Filtering=free-ebooks&orderBy=newest&q=programming',
    );
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(Book.fromJson(book));
    }
    return books;
  }
}
