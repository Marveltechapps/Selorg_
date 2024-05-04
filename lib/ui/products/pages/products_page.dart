import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/core/utils/string_utils.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';
import 'package:sel_org/ui/products/bloc/cubit/product_cubit.dart';
import 'package:sel_org/ui/products/bloc/cubit/sub_category_cubit.dart';
import 'package:sel_org/ui/products/bloc/state/sub_category_state.dart';
import '../../../core/di/injector.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/dimens.dart';
import '../../../networking/models/products/product_response.dart';
import '../../../networking/models/products/sub_category_response.dart';
import '../bloc/state/product_state.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  final String categoryName;
  final String categoryCode;

  const ProductScreen(this.categoryName, this.categoryCode);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<ProductCubit>()),
      BlocProvider(create: (_) => getIt<SubCategoryCubit>())
    ], child: ProductContent(categoryName, categoryCode));
  }
}

class ProductContent extends StatefulWidget {
  final String categoryName;
  final String categoryCode;

  const ProductContent(this.categoryName, this.categoryCode, {super.key});

  @override
  State<StatefulWidget> createState() => _ProductContent();
}

class _ProductContent extends State<ProductContent> {
  late int tappedIndex;
  late double screenSize;
  ValueNotifier<int> isSelected = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    context.read<SubCategoryCubit>().getSubCategory(widget.categoryCode);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
          elevation: 4,
        ),
        body: Container(
          margin: EdgeInsets.only(
              left: context.getPadding(), right: context.getPadding()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: context.getSubCategoryPadding(),
                color: Colors.white,
                child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
                  builder: (context, state) {
                    if (state is SubCategoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.greenAccent),
                      );
                    } else if (state is SubCategoryLoaded) {
                      List<SubCategoryItem> subCategoryItems =
                          state.subCategoryResponse.data;
                      if (subCategoryItems.isNotEmpty) {
                        context
                            .read<ProductCubit>()
                            .getProducts(subCategoryItems[0].category_code);
                      }
                      return _buildSubCategoryList(subCategoryItems);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.greenAccent),
                        );
                      } else if (state is ProductLoaded) {
                        List<ProductItem> productItems =
                            state.productResponse.data;
                        return AlignedGridView.count(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: context.getGridColumn(),
                            itemCount: productItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildProductItem(
                                  context, productItems, index);
                            });
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildProductItem(
      BuildContext context, List<ProductItem> productItems, int index) {
    final ProductItem product = productItems[index];
    return GestureDetector(
      child: Card(
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Center(
                            child: SvgPicture.asset(
                          "assets/no-image-placeholder.svg",
                          height: screenSize >= 640 ? 120 : 100,
                        )),
                        imageUrl: productItems[index].imageURL,
                        height: screenSize >= 640 ? 120 : 100,
                      ),
                    ),
                    const Gap(8.0),
                    Text(productItems[index].skuName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                    const Gap(8.0),
                    Text(
                      productItems[index].size,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Gap(8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${productItems[index].mrp.split(".")[0]}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Gap(8.0),
                        Text(
                          "₹${productItems[index].salePrice.split(".")[0]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Center(
                      child: FilledButton(
                          onPressed: () {
                            addToCart(context, productItems[index]);
                          },
                          child: const Text("Add")),
                    )
                    // _itemAdded ? buildItemCountControls() : buildAddButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        // navigateToProductDetail(context, product.id,
        //     product.skuName); // Adjusted to include product ID and name
      },
    );
  }

  Widget _buildSubCategoryList(List<SubCategoryItem> subCategoryItems) {
    return ListView.separated(
      itemCount: subCategoryItems.length,
      itemBuilder: (context, index) {
        return _buildSubCategoryItem(context, subCategoryItems, index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(16.0);
      },
    );
  }

  Widget _buildSubCategoryItem(
      BuildContext context, List<SubCategoryItem> subCategoryList, int index) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            isSelected.value = index;
            context
                .read<ProductCubit>()
                .getProducts(subCategoryList[index].category_code);
          },
          child: Container(
            color: value == index ? Colors.grey.shade200 : Colors.white,
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            alignment: Alignment.center,
            child: screenSize >= 640 && kIsWeb
                ? Row(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          "assets/no-image-placeholder.svg",
                          height: 50,
                          width: 50,
                        ),
                        imageUrl: subCategoryList[index].image,
                        width: 50.0,
                        height: 50.0,
                      ),
                      const Gap(8.0),
                      Expanded(
                        child: Text(
                          subCategoryList[index].category_desc.capitalize(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                                  "assets/no-image-placeholder.svg",
                                  height: 75,
                                  width: 75),
                          imageUrl: subCategoryList[index].image,
                        ),
                        Center(
                          child: Text(
                              subCategoryList[index].category_desc.capitalize(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  void navigateToProductDetail(
      BuildContext context, String name, String categoryCode) {
    context.router.push(ProductRoute(
      categoryName: name,
      categoryCode: categoryCode,
    ));
  }

  void addToCart(BuildContext context, ProductItem productItem) {
    context.read<ProductCubit>().addToCart(CartItem(
        productItem.skuCode,
        productItem.skuName,
        productItem.imageURL,
        productItem.size,
        productItem.salePrice,
        productItem.mrp,
        productItem.baseCost,
        productItem.vendorName,
        productItem.isActive,
        productItem.isStocked,
        1));
    showCartAdded(
        context, "${productItem.skuName} has been added to your cart.");
  }

  showCartAdded(BuildContext context, String message) {
    AnimatedSnackBar.removeAll();
    AnimatedSnackBar.rectangle('Added', message,
            type: AnimatedSnackBarType.success,
            mobileSnackBarPosition: MobileSnackBarPosition.top,
            desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
            brightness: Brightness.light,
            duration: const Duration(seconds: 2))
        .show(context);
  }
}
