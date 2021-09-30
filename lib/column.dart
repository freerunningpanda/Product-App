// Column(
//                   children: [
//                     Text(
//                       product.title,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                           fontSize: 20.0, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'price: ${product.price}',
//                       style: const TextStyle(
//                           fontSize: 20.0, fontStyle: FontStyle.italic),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'category: ${product.category.trim()}',
//                       style: const TextStyle(
//                           fontSize: 20.0, color: Colors.black87),
//                     ),
//                     Expanded(
//                         child: CachedNetworkImage(
//                       imageUrl: product.image,
//                       placeholder: (context, url) =>
//                           Image.asset('assets/no_image.jpg'),
//                     )),
//                     Text(
//                       product.description,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(fontSize: 20.0),
//                     ),
//                   ],
//                 ),