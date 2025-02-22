import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/marketplace_api.dart';
import '../../models/menu.dart';
import '../../utils/strings.dart';
import '../../utils/svgs.dart';

mixin HomePageVariables {
  RxInt page = 1.obs;
  RxInt tab = 0.obs;
  List<Menu> menus = [
    const Menu(
      title: Strings.explore,
      icon: Icons.explore,
      svg: Svgs.explore,
    ),
    const Menu(
      title: Strings.marketplace,
      icon: Icons.store,
      badge: Strings.nEW,
      svg: Svgs.storefront,
    ),
    const Menu(
      title: Strings.search,
      icon: Icons.search,
      svg: Svgs.search,
    ),
    const Menu(
      title: Strings.activity,
      icon: Icons.av_timer,
      svg: Svgs.activity,
    ),
    const Menu(
      title: Strings.profile,
      icon: Icons.person,
      svg: Svgs.profile,
    ),
  ];
  final List<String> tabs = ['For You', 'Recent', 'My Requests', 'Top'];
  MarketplaceApi marketplaceApi = MarketplaceApi();
}
