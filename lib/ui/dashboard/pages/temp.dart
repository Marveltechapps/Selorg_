// Widget _buildProductItem(
//     BuildContext context, List<ProductItem> productItems, int index) {
//   double screenSize = MediaQuery.of(context).size.width;
//   return Card(
//     elevation: 4,
//     color: Colors.white,
//     child: Stack(
//       children: [
//         Positioned(
//           left: 10,
//           top: 10,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Text('25% OFF',
//                 style: TextStyle(color: Colors.white, fontSize: 12)),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CachedNetworkImage(
//                   placeholder: (context, url) =>
//                       const Center(child: CircularProgressIndicator()),
//                   errorWidget: (context, url, error) => Center(
//                       child: SvgPicture.asset(
//                           "assets/no-image-placeholder.svg",
//                           height: screenSize >= 640 && kIsWeb ? 120 : 100)),
//                   imageUrl: productItems[index].imageURL,
//                   height: screenSize >= 640 && kIsWeb ? 120 : 100,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 productItems[index].skuName,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//                 softWrap: true,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//               const SizedBox(height: 8.0),
//               // Expanded(
//               //   child: DropdownButtonHideUnderline(
//               //     child: DropdownButton<String>(
//               //       isExpanded: true,
//               //       value: productItems[index].currentSize,
//               //       onChanged: (String? newValue) {
//               //         // Logic to handle change
//               //       },
//               //       items: productItems[index].sizes.map<DropdownMenuItem<String>>((String value) {
//               //         return DropdownMenuItem<String>(
//               //           value: value,
//               //           child: Text(value),
//               //         );
//               //       }).toList(),
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(height: 8.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Rs ${productItems[index].salePrice}",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       addToCart(context, productItems[index]);
//                       // Add to cart logic
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                     child: const Text('Add'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

//
// correct ui for temp product

//
// Scaffold(
// appBar: AppBar(title: const Text("Product List")),
// body: LayoutBuilder(
// builder: (context, constraints) {
// int columns;
// if (kIsWeb) {
// columns = constraints.maxWidth > 1200 ? 5 : 2;
// } else {
// columns = constraints.maxWidth > 600 ? 2 : 1;
// }
// return GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: columns,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// childAspectRatio: aspectRatio,
// ),
// itemCount: productItems.length,
// itemBuilder: (context, index) =>
// ProductCard(product: productItems[index]),
// );
// },
// ),
// );
