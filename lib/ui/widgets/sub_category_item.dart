import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../networking/models/products/sub_category_response.dart';

class SubCategory extends StatefulWidget {
  bool isSelected = false;
  SubCategoryItem subCategoryItem;
  SubCategory(this.subCategoryItem);

  @override
  State<StatefulWidget> createState() => SubCategoryItemState();

}

class SubCategoryItemState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isSelected ? Colors.grey.shade200 : Colors.white,
      padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
      alignment: Alignment.center,
      child: GestureDetector(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CircleAvatar(
                radius: 32.0,
                child: CachedNetworkImage(
                  imageUrl: "https://thumbs.dreamstime.com/z/vegetables-1430407.jpg?w=992",
                ),
              ),
            ),
            Center(
              child: Text(widget.subCategoryItem.category_desc,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0), softWrap: false, overflow: TextOverflow.ellipsis, maxLines: 2),
            )
          ],
        ),
        onTap: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
        },
      ),
    );
  }

}