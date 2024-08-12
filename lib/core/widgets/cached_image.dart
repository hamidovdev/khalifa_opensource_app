// import 'package:flutter/material.dart';

// class CachedImage extends StatelessWidget {
//   final String imageUrl;
//   final double? width;
//   final double? height;
//   final double borderRadius;
//   final BoxFit? fit;
//   const CachedImage({
//     required this.imageUrl,
//     this.borderRadius = 0,
//     this.width,
//     this.height,
//     this.fit,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: CachedNetworkImage(
//         imageUrl: imageUrl,
//         fit: fit ?? BoxFit.cover,
//         placeholder: (context, url) => ShimmerContainer(
//           width: width ?? 25,
//           height: height ?? 25,
//           borderRadius: borderRadius,
//         ),
//         errorWidget: (context, url, error) => ShimmerContainer(
//           width: width ?? 25,
//           height: height ?? 25,
//           borderRadius: borderRadius,
//         ),
//       ),
//     );
//   }
// }
