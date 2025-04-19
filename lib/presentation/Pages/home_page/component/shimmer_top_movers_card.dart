import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTopMoversCard extends StatelessWidget {
  const ShimmerTopMoversCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.25,
        child: Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration:  BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  height: height * 0.25,
                  width: width * 0.4,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.only(right: 10),
                );
              },
            )));
  }
}
