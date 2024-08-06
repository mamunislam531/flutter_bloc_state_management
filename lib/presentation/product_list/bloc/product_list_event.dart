part of 'product_list_bloc.dart';

abstract class ProductListEvent {}

 class GetProductListEvent extends ProductListEvent{}

 class SearchProductListEvent extends ProductListEvent{
   String searchText;
   SearchProductListEvent({required this.searchText});
 }
