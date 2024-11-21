//packages
import 'package:flutter/material.dart';
//core
import '../../../../../core/assets/assets.dart';
//model
import '../../../data/model/category_item_model.dart';

class CustomCategoryItemIndex {
  static  final List<CategoryItemModel> items = [
    CategoryItemModel(
      name: 'Grocery',
      icon: ImageAssets.svgsGrocery,
      color: const Color(0xffCCFF80),
    ),
    CategoryItemModel(
      name: 'Work',
      icon: ImageAssets.svgsWork,
      color: const Color(0xffFF9680),
    ),
    CategoryItemModel(
      name: 'Sport',
      icon: ImageAssets.svgsSport,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      name: 'Design',
      icon: ImageAssets.svgsDesign,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      name: 'University',
      icon: ImageAssets.svgsUniversity,
      color: const Color(0xff809CFF),
    ),
    CategoryItemModel(
      name: 'Social',
      icon: ImageAssets.svgsSocial,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      name: 'Music',
      icon: ImageAssets.svgsMusic,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      name: 'Health',
      icon: ImageAssets.svgsHealth,
      color: const Color(0xff80FFA3),
    ),
    CategoryItemModel(
      name: 'Movie',
      icon: ImageAssets.svgsMovie,
      color: const Color(0xff80D1FF),
    ),
    CategoryItemModel(
      name: 'Home',
      icon: ImageAssets.svgsHome,
      color: const Color(0xffFFCC80),
    ),
    ];
}