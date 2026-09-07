import 'package:bookly/Features/home/data/models/book/book.dart';

abstract class HomeRemoteDataSource {
  Future<List<Book>> fetchFeaturedBooks();

  Future<List<Book>> fetchNewestBooks();
}



class HomeRemoteDataSourceimpl extends HomeRemoteDataSource {
  @override
  Future<List<Book>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}