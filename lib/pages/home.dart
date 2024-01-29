// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unused_import, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/components/grid_card.dart';
import 'package:ecommerce_app/components/loader.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/pages/add_to_cart.dart';
import 'package:ecommerce_app/pages/product_screen.dart';
import 'package:ecommerce_app/pages/profile.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:ecommerce_app/services/firestore.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/theme/splash_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Product>>? products;
  int _selectedIndex = 0;

  Future<List<Product>> getProducts() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/data/product.json");
    List mapData = jsonDecode(data);

    print(mapData);
    List<Product> products =
        mapData.map((product) => Product.fromJson(product)).toList();
    return products;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    onCardPress(Product product) {
      nextScreen(
          context,
          ProductScreen(
            product: product,
          ));
    }

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        toolbarHeight: 65,
        centerTitle: true,
        titleTextStyle: SplashTheme.splashText(
          size: 22,
          weight: FontWeight.bold,
          color: AppTheme.blackColor,
          letterSpacing: 4,
        ),
        title: Text(
          "Kit Kart",
        ),
        leading: Image.asset(
          'assets/logo.png',
          // '/logo.png',
          height: 20,
          width: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: () {
                nextScreen(context, const Search());
              },
              icon: Icon(
                Icons.search,
                color: AppTheme.blackColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: AppTheme.cardShadow,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.grey.shade600,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, Home());
                },
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, AddToCart());
                },
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, Profile());
                },
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Product>>(
          future: getProducts(),
          builder: (context, data) {
            if (data.hasData) {
              List<Product> products = data.data!;
              return GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: index % 2 == 0
                        ? const EdgeInsets.only(left: 22)
                        : const EdgeInsets.only(right: 22),
                    decoration: AppTheme.getCardDecoration(),
                    child: InkWell(
                      onTap: () {
                        onCardPress(data.data![index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 7,
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                  products[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        products[index].title,
                                        style: AppTheme.appText(
                                          size: 14,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      products[index].price.toString(),
                                      style: AppTheme.appText(
                                        size: 14,
                                        weight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Loader(),
              );
            }
          }),
    );

    
  }
}
