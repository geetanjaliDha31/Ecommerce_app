// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:ecommerce_app/models/product.dart';
// import 'package:ecommerce_app/theme/app_theme.dart';
// import 'package:flutter/material.dart';

// class GridCard extends StatelessWidget {
//   final int index;
//   final Function() onPress;
//   final Product product;
//   const GridCard({super.key,required this.product, required this.index, required this.onPress});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: index % 2 == 0
//           ? const EdgeInsets.only(left: 22)
//           : const EdgeInsets.only(right: 22),
//       decoration: AppTheme.getCardDecoration(),
//       child: InkWell(
//         onTap: onPress,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(25),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Image.network(
//                     // "https://media.istockphoto.com/id/1350560575/photo/pair-of-blue-running-sneakers-on-white-background-isolated.webp?b=1&s=170667a&w=0&k=20&c=liUSgX6SafJ7HWvefFqR9-pnf3KuH6v1lwQ6iEpePWc=",
//                     product.image,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 2,
//                         ),
//                         child: Text(
//                           product.title,
//                           style: AppTheme.appText(
//                             size: 14,
//                             weight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         product.price.toString(),
//                         style: AppTheme.appText(
//                           size: 14,
//                           weight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
