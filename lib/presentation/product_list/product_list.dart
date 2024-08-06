import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_flutter_task/presentation/common_widgets/custom_product_shimmer_loading.dart';
import 'package:limerick_flutter_task/presentation/product_list/bloc/product_list_bloc.dart';
import 'package:limerick_flutter_task/presentation/product_list/widget/bottom_sheet.dart';
import 'package:limerick_flutter_task/presentation/product_list/widget/custom_card.dart';
import 'package:limerick_flutter_task/presentation/product_list/widget/custom_checkout_alert.dart';
import 'package:limerick_flutter_task/presentation/product_list/widget/search_bar.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListBloc productListState = ProductListBloc();

  @override
  void initState() {
    productListState.add(GetProductListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchButton: (String searchData) {
          productListState.add(SearchProductListEvent(searchText: searchData));
        },
      ),
      body: Center(
        child: BlocBuilder<ProductListBloc, ProductListState>(
          bloc: productListState,
          builder: (context, state) {
            if (state is GetProductListLoadingState) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomOrderShimmer();
                },
              );
            }
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomCardWidget();
              },
            );
          },
        ),
      ),
      bottomSheet: BottomSheetWidget(
        button: () {
          showAlertDialog(context);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomCheckoutAlert(
          conFirmButton: () {},
        );
      },
    );
  }
}
