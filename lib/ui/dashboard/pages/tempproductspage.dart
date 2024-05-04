import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:gap/gap.dart';
import 'package:sel_org/ui/dashboard/pages/product_detailedpg.dart';

import 'cart_page.dart';

class ProductItem {
  String imageURL;
  String skuName;
  List<String> sizes;
  String mrp;
  String salePrice;

  ProductItem(
      this.imageURL, this.skuName, this.sizes, this.mrp, this.salePrice);
}

final List<String> productname = [
  "Mango",
  "Apple",
  "Avacado",
  "Banana",
  "Grapes",
  "Guava",
  "Kiwi",
  "Lemon",
  "Orange"
];

class ProductItemPage extends StatelessWidget {
  final List<ProductItem> productItems = List.generate(
    9,
    (index) => ProductItem(
      "assets/product_$index.png",
      productname[index],
      [
        "500gram",
        "1kg",
        "750gram",
        "2 * 1kg    Multipack",
        "3*500g    Multipack",
        "Combo pack"
      ],
      "${(index + 1) * 100 + 900}",
      "${(index + 1) * 75 + 725}",
    ),
  );
  ProductItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio;
    if (screenWidth < 350) {
      aspectRatio = 0.59; // more height for smaller screens
    } else if (screenWidth < 400) {
      aspectRatio = 0.7; // more height for smaller screens
    } else if (screenWidth < 800) {
      aspectRatio = 0.75; // moderate height for medium screens
    } else if (screenWidth < 800) {
      aspectRatio = 0.75; // moderate height for medium screens
    } else {
      aspectRatio = 0.8; // less height for larger screens
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns;
          if (kIsWeb) {
            columns = constraints.maxWidth > 1200 ? 5 : 2;
          } else {
            columns = constraints.maxWidth > 600 ? 2 : 1;
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: aspectRatio,
            ),
            itemCount: productItems.length,
            itemBuilder: (context, index) =>
                ProductCard(product: productItems[index]),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductItem product;
  const ProductCard({super.key, required this.product});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late String _currentSelectedSize;
  bool _itemAdded = false; // Declare and initialize _itemAdded here
  int itemCount = 1;
  // Initial item count when added to cart
  @override
  void initState() {
    super.initState();
    _currentSelectedSize = widget.product.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    double screenSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Productdetail(
                      imageURL: widget.product.imageURL,
                      skuName: widget.product.skuName,
                      salePrice: widget.product.salePrice,
                      mrp: widget.product.mrp,
                      sizes: widget.product.sizes,
                    )));
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('25% OFF',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        widget.product.imageURL,
                        height: screenSize >= 640 ? 120 : 100,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.product.skuName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black26)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            elevation: 16,
                            value: _currentSelectedSize,
                            icon: const Icon(
                                Icons.arrow_drop_down), // Icon for dropdown
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentSelectedSize = newValue!;
                                if (newValue == "Combo pack") {
                                  showComboPackDialog(context, widget.product);
                                }
                              });
                            },
                            items: widget.product.sizes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(value, // Display the size
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFBFF6BF),
                                            ),
                                            child: const Text('50% OFF',
                                                style: TextStyle(
                                                    color: Color(0xFF49C949),
                                                    fontSize: 10)),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Rs${widget.product.salePrice}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "₹${widget.product.mrp}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          // const Spacer(),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // print("Button tapped for $value");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors
                                                .green, // Button foreground (text/icon) color
                                          ),
                                          child: const Text('Add'),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),

                            itemHeight: null,

                            // Remove default height restriction
                            dropdownColor: Colors.white,

                            // Wrap dropdown menu in a container to control size and scrolling
                            menuMaxHeight: 300,

                            // Set max height for the dropdown
                            selectedItemBuilder: (BuildContext context) {
                              return widget.product.sizes.map((String value) {
                                return Text(
                                    value, // This is the display on the dropdown button itself
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black));
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs ${widget.product.salePrice}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        _itemAdded
                            ? buildItemCountControls()
                            : buildAddButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return ElevatedButton(
      onPressed: () => showFloatingContainer(context),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF034703)),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
              color: const Color(0xFF034703).withOpacity(0.75), width: 1.5),
        ),
      ),
      child: const Text(
        'Add',
        style: TextStyle(color: Color(0xFF034703)),
      ),
    );
  }

  Widget buildItemCountControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (itemCount > 1) {
                itemCount--; // Decrement itemCount if more than one
              } else if (itemCount == 1) {
                itemCount--;
                _itemAdded =
                    false; // Reset to show Add button when count reaches zero
              }
            });
          },
        ),
        Text('$itemCount',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              itemCount++; // Increment itemCount
              if (!_itemAdded && itemCount == 1) {
                _itemAdded =
                    true; // Ensure the counter controls are shown when increasing from zero
              }
            });
          },
        ),
      ],
    );
  }

  Widget viewcart() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: mobile ? 8 : 0),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: mobile ? 8 : 16),
        height: mobile ? 50 : 60,
        width: mobile ? width : width * 0.70,
        decoration: const BoxDecoration(
            color: Color(0xFF034703),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 Item | ₹92',
                style: TextStyle(
                    fontSize: mobile ? 16 : 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                  // context.tabsRouter.setActiveIndex(3);
                },
                child: Text("View Cart",
                    style: TextStyle(
                        fontSize: mobile ? 16 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }

  void addItemToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      elevation: 5,

      backgroundColor: Colors.white,
      content: Text(
        "You have successfully added the item to your cart.",
        style: TextStyle(color: Colors.green),
      ),
      duration: Duration(seconds: 3), // Snackbar will disappear after 3 seconds
    ));
    setState(() {
      _itemAdded = true; // Set this flag true to update the UI accordingly
    });
  }

  // Function to show a floating container
  void showFloatingContainer(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool mobile = width < 600;
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        // top: MediaQuery.of(context).size.height *
        //     0.3, // Adjust the position as needed
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        bottom: 0,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: mobile ? 8 : 0),
            padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: mobile ? 8 : 16),
            height: mobile ? 50 : 60,
            width: mobile ? width : width * 0.70,
            decoration: const BoxDecoration(
                color: Color(0xFF034703),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1 Item | ₹92',
                    style: TextStyle(
                        fontSize: mobile ? 16 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CartScreen()));
                      // context.tabsRouter.setActiveIndex(3);
                    },
                    child: Text("View Cart",
                        style: TextStyle(
                            fontSize: mobile ? 16 : 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
      ),
    );

    // Insert the overlay entry into the overlay
    Overlay.of(context)?.insert(overlayEntry);

    // Automatically remove the overlay after 3 seconds
    // Future.delayed(Duration(seconds: 3), () {
    //   overlayEntry.remove();
    // });
  }
}

//   void addItemToCart(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       elevation: 5,
//
//       backgroundColor: Colors.white,
//       content: Text(
//         "You have successfully added the item to your cart.",
//         style: TextStyle(color: Colors.green),
//       ),
//       duration: Duration(seconds: 3), // Snackbar will disappear after 3 seconds
//     ));
//     setState(() {
//       _itemAdded = true; // Set this flag true to update the UI accordingly
//     });
//   }
// }

void showComboPackDialog(BuildContext context, ProductItem product) {
  int itemCount = 1; // Initial item count set to 1

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        // Use StatefulBuilder to manage the state inside the dialog
        builder: (context, setState) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Combo Pack"),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            content: Card(
              elevation: 4,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListBody(
                      children: <Widget>[
                        Card(
                          borderOnForeground: true,
                          child: Image.asset(product.imageURL),
                        ),
                        Text(
                          product.skuName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: [
                            Text("Rs ${product.salePrice}",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            Text("₹${product.mrp}",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 15.0)),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 16, 94, 19),
                              child: IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (itemCount > 1) {
                                    // Prevent reducing below 1
                                    setState(() => itemCount--);
                                  }
                                },
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text('$itemCount',
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              color: const Color.fromARGB(255, 16, 94, 19),
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() => itemCount++);
                                },
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
