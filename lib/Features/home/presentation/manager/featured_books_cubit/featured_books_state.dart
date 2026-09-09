// part of 'featured_books_cubit.dart';

// import '../../../domain/entities/book_entity.dart';

import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState  {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
   FeaturedBooksSuccess(this.books);
}

class FeaturedBooksError extends FeaturedBooksState {
  final String errorMessage;
  FeaturedBooksError(this.errorMessage);
}
