//packages
import 'package:flutter/material.dart';
//core
import '../../../../../core/assets/assets.dart';
//model
import '../../../data/model/category_item_model.dart';

class CustomCategoryItemIndex {
  static  final List<CategoryItemModel> items = [
    CategoryItemModel(
      title: 'Grocery',
      image: ImageAssets.svgsGrocery,
      color: const Color(0xffCCFF80),
    ),
    CategoryItemModel(
      title: 'Work',
      image: ImageAssets.svgsWork,
      color: const Color(0xffFF9680),
    ),
    CategoryItemModel(
      title: 'Sport',
      image: ImageAssets.svgsSport,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      title: 'Design',
      image: ImageAssets.svgsDesign,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      title: 'University',
      image: ImageAssets.svgsUniversity,
      color: const Color(0xff809CFF),
    ),
    CategoryItemModel(
      title: 'University',
      image: ImageAssets.svgsSocial,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      title: 'Music',
      image: ImageAssets.svgsMusic,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      title: 'Health',
      image: ImageAssets.svgsHealth,
      color: const Color(0xff80FFA3),
    ),
    CategoryItemModel(
      title: 'Movie',
      image: ImageAssets.svgsMovie,
      color: const Color(0xff80D1FF),
    ),
    CategoryItemModel(
      title: 'Home',
      image: ImageAssets.svgsHome,
      color: const Color(0xffFFCC80),
    ),];
}