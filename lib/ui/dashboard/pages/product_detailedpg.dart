import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'fresh.dart';

class Productdetail extends StatefulWidget {
  final String imageURL;
  final String skuName;
  final String salePrice;
  final String mrp;
  final List<String> sizes;

  const Productdetail({
    super.key,
    required this.imageURL,
    required this.skuName,
    required this.salePrice,
    required this.mrp,
    required this.sizes,
  });

// Correct class name to follow Dart naming conventions.

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  late String _currentSelectedSize;
  int itemCount = 0; // Initialize item count
  bool _itemAdded = false; // Flag to track if an item has been added to cart
  @override
  void initState() {
    super.initState();
    _currentSelectedSize = widget.sizes.first;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.skuName)),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width > 600 ? 400 : 300,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(widget.imageURL),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Image.asset(widget.imageURL),
          ),
          ListTile(
            title: Text(widget.skuName,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Sale Price: ${widget.salePrice}\nMRP: ${widget.mrp}'),
                Text(" ₹${widget.salePrice}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

                Text("₹${widget.mrp}",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10.0)),

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
                              showComboPackDialog(
                                  context, widget as ProductItem);
                            }
                          });
                        },
                        items: widget.sizes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "Rs${widget.salePrice}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "₹${widget.mrp}",
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
                          return widget.sizes.map((String value) {
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
              ],
            ),
            trailing: _itemAdded ? buildItemCountControls() : buildAddButton(),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: const ExpansionTile(
                    title: Text("Product Information",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("> Country of Origin: India",
                                style: TextStyle(fontSize: 18)),
                            Text("> Shelf Life: 3 to 4 days",
                                style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                5), // Set borderRadius to zero for rectangular corners
          ),
        ),
        onPressed: () {},
        child: const Text("Add"));
  }

  Widget buildItemCountControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Color.fromARGB(255, 16, 83, 18),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (itemCount > 0) {
                setState(() {
                  itemCount--;
                  if (itemCount == 0) {
                    _itemAdded = false;
                  }
                });
              }
            },
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text('$itemCount',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 8,
        ),
        Container(
          color: Color.fromARGB(255, 16, 83, 18),
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                itemCount++;
                _itemAdded = true;
              });
            },
          ),
        ),
      ],
    );
  }

  void addItemToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You have successfully added the item to your cart.",
          style: TextStyle(color: Colors.green)),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 3),
    ));
    setState(() {
      _itemAdded = true;
    });
  }
}
