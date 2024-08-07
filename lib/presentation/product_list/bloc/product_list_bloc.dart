import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:limerick_flutter_task/domain/model/product_list_models.dart';
import 'package:limerick_flutter_task/domain/repositories/product_list.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  List<Products> productList = [];
  ProductListBloc() : super(ProductListInitial()) {
    on<GetProductListEvent>(productListEvent);
    on<SearchProductListEvent>(searchProductListEvent);
  }

  // Fetch Product List from API
  FutureOr<void> productListEvent(ProductListEvent event, Emitter<ProductListState> emit) async {
    emit(GetProductListLoadingState());
    productList = await ProductListRepo.getProductList();
    await Future.delayed(const Duration(seconds: 5));
    emit(GetProductListState(products: productList));
  }

  // This is Local Search  --- if you want to search from database then call search API
  FutureOr<void> searchProductListEvent(SearchProductListEvent event, Emitter<ProductListState> emit) async {
    emit(GetProductListLoadingState());
    List<Products> searchData = productList.where((value) => value.nameEn?.toLowerCase() == event.searchText.toLowerCase()).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(GetProductListState(products: searchData));
  }
}
