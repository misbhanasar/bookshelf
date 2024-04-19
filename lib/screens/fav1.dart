// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:library_project/model/data_model.dart';
// import 'package:library_project/screens/bookdetails.dart';





// class Breakfast extends StatefulWidget {
//   const Breakfast({Key? key});

//   @override
//   State<Breakfast> createState() => _BreakfastState();
// }

// class _BreakfastState extends State<Breakfast> {
//   late List<Bookmodel> breakfastRecipes = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch recipes by category when the widget initializes
    
//     // Open the 'favorites' box when the widget initializes
//     openFavoritesBox();
//   }

  

 

//   Future<void> openFavoritesBox() async {
//     // Open the 'favorites' box
//     await Hive.openBox<Bookmodel>('favorites');
//   }

//   void saveFavoriteRecipe(Bookmodel recipe) async {
//     final favoriteBox = await Hive.openBox<Bookmodel>('favorites');
//     // Toggle favorite status
//     if (favoriteBox.containsKey(recipe.bokname)) {
//       // Remove from favorites if already favorite
//       await favoriteBox.delete(recipe.bokname);
//     } else {
//       // Add to favorites if not favorite
//       await favoriteBox.put(recipe.bokname, recipe);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return ValueListenableBuilder(
//       valueListenable: Hive.box<Bookmodel>('favorites').listenable(),
//       builder: (context, Box<Bookmodel> favoritesBox, _) {
//         final favoriteRecipes = favoritesBox.values.toList();
//         return breakfastRecipes.isEmpty?
//         Center( child: Text('No recipes found in Breakfast category'),):
//         ListView.separated(
//           itemBuilder: (ctx, index) {
//             final Bookmodel recipe = breakfastRecipes[index];
//             final isFavorite = favoriteRecipes.contains(recipe);
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Bookdetails(
//                       data: recipe,
//                     ),
//                   ),
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 2,
//                   child: ListTile(
//                     title: Text(recipe.bokname),
//                     subtitle: Text(recipe.authorname),
//                     leading: CircleAvatar(
//                       radius: 30,
//                       // ignore: unnecessary_null_comparison
//                       backgroundImage: recipe.imagepath != null
//                           ? FileImage(File(recipe.imagepath))
//                           : null,
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           onPressed: () async {
//                             // Update 'favorites' box with the recipe
//                             saveFavoriteRecipe(recipe);
//                           },
//                           icon: Icon(
//                             isFavorite ? Icons.favorite : Icons.favorite_border,
//                             color: isFavorite ? Colors.red : null,
//                           ),
//                         ),
                   
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (ctx, index) {
//             return const SizedBox(
//               height: 10,
//             );
//           },
//           itemCount: breakfastRecipes.length,
//         );
//       },
//     );
//   }
// }