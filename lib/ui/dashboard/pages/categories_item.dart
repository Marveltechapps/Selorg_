import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sel_org/ui/dashboard/pages/tempproductspage.dart';
import '../../../core/router/app_router.dart';

class CategoryContent extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Fruit & Vegetables",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/Fruits_Vegetables.png",
      "route": "/item1"
    },
    {
      "title": "Groceries",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/Groceries.png",
      "route": "/item2"
    },
    {
      "title": "Fresh Fruits",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Fruits.png",
      "route": "/item1"
    },
    {
      "title": "Fresh Veggies",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Fresh_Vegetables.png",
      "route": "/item2"
    },
    {
      "title": "Leafy Herbs & Seasonings",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Leafy_Herbs_Seasonings.png",
      "route": "/item1"
    },
    {
      "title": "Dry Fruits & Nuts",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Dry_Fruits_Nuts.png",
      "route": "/item2"
    },
    {
      "title": "Rice & Cereals",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Rice_Cereals.png",
      "route": "/item1"
    },
    {
      "title": "Millets",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Millets.png",
      "route": "/item2"
    },
    {
      "title": "Grains & PulsesFruit & Vegetables",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Grains_Pulses.png",
      "route": "/item1"
    },
    {
      "title": "Dal",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Dal.png",
      "route": "/item2"
    },
    {
      "title": "Seeds",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Seeds.png",
      "route": "/item2"
    },
    {
      "title": "Whole spices & Seasoning",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Whole_Spices_Seasoning.png",
      "route": "/item2"
    },
    {
      "title": "Oil",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Oil.png",
      "route": "/item2"
    },
    {
      "title": "Sugar & Jaggery",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Sugar_Jaggery.png",
      "route": "/item2"
    },
    {
      "title": "Attas & Flours",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Attas_Flours.png",
      "route": "/item2"
    },
    {
      "title": "Masalas & Powders",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Masalas_Powders.png",
      "route": "/item2"
    },
    {
      "title": "Ghee",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Ghee.png",
      "route": "/item2"
    },
    {
      "title": "Honey & Spreads",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Honey_Spreads.png",
      "route": "/item2"
    },
    {
      "title": "Salts",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Salts.png",
      "route": "/item2"
    },
    {
      "title": "Beverages",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Beverages.png",
      "route": "/item2"
    },
    {
      "title": "Breads & Cereals",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Breads_Cereals.png",
      "route": "/item2"
    },
    {
      "title": "Noodles & Vermicelli",
      "image":
          "https://selorg.s3.ap-south-1.amazonaws.com/category/sub_category/Noodles_Vermicelli.png",
      "route": "/item2"
    },
  ];

  CategoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: screenSize * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Gap(16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenSize > 600 ? 6 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(
                        0xFFE5EEC3), // Background color of the container
                    borderRadius: BorderRadius.circular(
                        10), // Rounded corners like a Card
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 4.0,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, items[index]['route']);
                      // Assuming that `items[index]['title']` is the name and `items[index]['route']` is the category code.
                      // navigateToProduct(context, items[index]['title'],
                      //     items[index]['route']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductItemPage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              items[index]['title'],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const Gap(16.0),
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: items[index]['image'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                            alignment: Alignment.center,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

void navigateToProduct(BuildContext context, String name, String categoryCode) {
  context.router.push(ProductRoute(
    categoryName: name,
    categoryCode: categoryCode,
  ));
}
