import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:untitled/dummy_data.dart';
import 'package:untitled/modal/recipe.dart';
import 'package:untitled/screens/detail_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Recipe>(
                  searchLabel: 'Search Recipe name',
                  suggestion: Center(
                    child: Container(
                      height: 400,
                      width: 350,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/recipe.jpg'),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  builder: (recipes) => ListTile(
                    title: Text(recipes.title),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                          ),),);
                    },
                  ),
                  filter: (recipes) => [
                    recipes.title,
                  ],
                  items: recipes,
                  failure: Center(
                    child: Container(
                      child: const Text('No Data Found'),
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: recipes[index].title,
                      imgUrl: recipes[index].imageUrl,
                      ingredients: recipes[index].ingredients,
                      steps: recipes[index].steps,
                      duration: recipes[index].duration,
                    ),),);
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                elevation: 4.0,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        recipes[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                        ),
                        child: Text(
                          recipes[index].title,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              color: Colors.white),
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              '${recipes[index].duration} min',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}