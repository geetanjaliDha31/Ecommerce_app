import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        toolbarHeight: 65,
        centerTitle: true,
        titleTextStyle: AppTheme.appText(
          size: 22,
          weight: FontWeight.bold,
          color: AppTheme.blackColor,
          letterSpacing: 4,
        ),
        title: Text(
          "Search",
        ),
      ),
      body: Column(children: [
        Container(
          color: AppTheme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  style: AppTheme.appText(
                    size: 14,
                    weight: FontWeight.w600,
                    color: AppTheme.whiteColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: AppTheme.appText(
                      size: 14,
                      weight: FontWeight.w600,
                      color: AppTheme.whiteColor,
                    ),
                    hintText: "Search Groups",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
