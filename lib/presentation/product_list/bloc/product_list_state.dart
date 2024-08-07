part of 'product_list_bloc.dart';

abstract class ProductListState {}

final class ProductListInitial extends ProductListState {}

final class GetProductListLoadingState extends ProductListState {}

final class GetProductListState extends ProductListState {
  List<Products> products;
  GetProductListState({required this.products});
}
