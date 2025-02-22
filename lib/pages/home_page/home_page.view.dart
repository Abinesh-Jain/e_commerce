import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/marketplace_request_card.dart';
import '../../components/no_data.dart';
import '../../components/paginator.dart';
import '../../config/app_colors.dart';
import '../../src/routes.dart';
import '../../utils/strings.dart';
import '../../utils/svgs.dart';
import 'home_page.controller.dart';

class HomePageView extends GetResponsiveView<HomePageController> {
  HomePageView({super.key});

  @override
  Widget? builder() {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.menus[controller.page.value].title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(255, 115, 4, 1),
                  Color.fromRGBO(251, 42, 119, 1),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: [
          NoData(
            child: Icon(
              controller.menus[0].icon,
              size: 200,
              color: AppColors.coralRed,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: controller.tabs.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.onTabTapped(index),
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: controller.tab.value == index
                              ? AppColors.coralRed.withOpacity(.1)
                              : null,
                          border: Border.all(
                            color: controller.tab.value == index
                                ? AppColors.coralRed
                                : AppColors.mercury,
                          ),
                        ),
                        child: Text(
                          controller.tabs[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, index) => const SizedBox(width: 8),
                ),
              ),
              Expanded(
                child: Paginator(
                  get: (page) => controller.marketplaceApi
                      .getMarketplaceRequests(page: page),
                  itemBuilder: (context, index, item) => InkWell(
                    onTap: () => Get.toNamed(Routes.request, arguments: item),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mercury),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Badge(
                        backgroundColor: Colors.transparent,
                        offset: const Offset(-120, -15),
                        label: item.isHighValue == true
                            ? TextButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.westSide,
                                  minimumSize: const Size(100, 24),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  textStyle: const TextStyle(fontSize: 14),
                                ),
                                onPressed: () {},
                                icon: SvgPicture.asset(Svgs.star),
                                label: const Text(
                                  'HIGH VALUE',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : null,
                        child: MarketplaceRequestCard(item),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          NoData(
            child: Icon(
              controller.menus[2].icon,
              size: 200,
              color: AppColors.coralRed,
            ),
          ),
          NoData(
            child: Icon(
              controller.menus[3].icon,
              size: 200,
              color: AppColors.coralRed,
            ),
          ),
          NoData(
            child: Icon(
              controller.menus[4].icon,
              size: 200,
              color: AppColors.coralRed,
            ),
          ),
        ][controller.page.value],
        floatingActionButton: controller.page.value == 1
            ? FloatingActionButton.extended(
                onPressed: controller.postRequest,
                label: const Text(
                  Strings.postRequest,
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.onMenuTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.page.value,
          selectedItemColor: AppColors.coralRed,
          items: controller.menus
              .map((e) => BottomNavigationBarItem(
                    icon: e.badge == null
                        ? SvgPicture.asset(
                            e.svg,
                            colorFilter: const ColorFilter.mode(
                              Colors.grey,
                              BlendMode.srcIn,
                            ),
                          )
                        : Badge(
                            label: Text(e.badge!),
                            child: SvgPicture.asset(
                              e.svg,
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                    activeIcon: e.badge == null
                        ? SvgPicture.asset(
                            e.svg,
                            colorFilter: const ColorFilter.mode(
                              AppColors.coralRed,
                              BlendMode.srcIn,
                            ),
                          )
                        : Badge(
                            label: Text(e.badge!),
                            child: SvgPicture.asset(
                              e.svg,
                              colorFilter: const ColorFilter.mode(
                                AppColors.coralRed,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                    label: e.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
