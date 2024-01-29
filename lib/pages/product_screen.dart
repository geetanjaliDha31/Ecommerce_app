// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/services/db_services.dart';
import 'package:ecommerce_app/services/firestore.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DefaultTextStyle(
                      style: AppTheme.appText(
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.product.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("MRP:"),
                              Text(widget.product.price.toString() + "Rs"),
                            ],
                          ),
                          Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: addCart
                                  ? AppTheme.blackColor
                                  : AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: AppTheme.buttonShadow,
                            ),
                            margin: EdgeInsets.all(40),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  addCart = !addCart;
                                });
                              },
                              child: Text(
                                addCart ? "Added To Cart" : "Add To Cart",
                                style: AppTheme.appText(
                                  size: 18,
                                  weight: FontWeight.w600,
                                  color: AppTheme.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "About the items",
                            style: AppTheme.appText(
                              size: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.product.description,
                            style: AppTheme.appText(
                              size: 12,
                              weight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      offset: Offset(1, 3),
                      color: Colors.grey,
                    )
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 26,
                    color: AppTheme.blackColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
