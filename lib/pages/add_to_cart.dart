// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/list_card.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/profile.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/theme/splash_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final carts = ['1', '2'];
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: carts.length,
              padding: EdgeInsets.symmetric(vertical: 30),
              itemBuilder: (BuildContext context, int index) {
                return ListCard(
                  image:
                      "https://images.unsplash.com/photo-1597248881519-db089d3744a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
                  title: "Yellow Shoe",
                  price: 900,
                );
              },
            ),
            priceFooter(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: CustomButton(text: "CHECKOUT", onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }

  priceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey.shade500,
            thickness: 2,
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  "Total:",
                  style: AppTheme.appText(
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "\$ Price",
                  style: AppTheme.appText(
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
