import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopFood extends StatefulWidget {
  final String name;
  final double rating;
  final double distance;
  final double price;
  final bool isSelected;
  final VoidCallback onTap;

  const PopFood({
    required this.name,
    required this.rating,
    required this.distance,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<PopFood> createState() => _PopFoodState();
}

class _PopFoodState extends State<PopFood> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100.withOpacity(0.5),
                offset: const Offset(0, 0))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://www.qualityassurancemag.com/fileuploads/publications/29/issues/103585/articles/images/Impossible_Burger_fmt.png",
                  ),
                  //AssetImage('images/burger.jpg'),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Column(
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    Text('${widget.rating}'),
                    Container(
                      width: 1,
                      height: 15,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: Colors.grey,
                    ),
                    Text(
                      '${widget.distance} km',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.orange,
                    ),
                    Text(
                      '${widget.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
