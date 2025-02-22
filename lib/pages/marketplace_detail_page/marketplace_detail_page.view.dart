import 'package:e_commerce/components/key_detail_card.dart';
import 'package:e_commerce/components/marketplace_request_card.dart';
import 'package:e_commerce/config/app_colors.dart';
import 'package:e_commerce/utils/pngs.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/button.dart';
import '../../utils/svgs.dart';
import 'marketplace_detail_page.controller.dart';

class MarketplaceDetailPageView
    extends GetResponsiveView<MarketplaceDetailPageController> {
  MarketplaceDetailPageView({super.key});

  @override
  Widget? builder() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: controller.delete,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(255, 115, 4, 1),
                  Color.fromRGBO(251, 42, 119, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: controller.share,
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteLilac,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Row(
              children: [
                if (controller.request!.userDetails?.profileImage != null) ...[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        controller.request!.userDetails!.profileImage!),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.request!.userDetails?.name ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(controller.request?.createdAt ?? ''),
                        ],
                      ),
                      Text(
                        controller.request!.userDetails?.designation ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      if (controller.request?.userDetails?.company != null)
                        Row(
                          children: [
                            SvgPicture.asset(Svgs.company),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                controller.request?.userDetails?.company ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                MarketplaceRequestCard(
                  controller.request!,
                  discriptionStyle: const TextStyle(fontSize: 16),
                  header: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Looking for',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Svgs.frame),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              controller.request?.serviceType ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Highlights',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const Row(
                        children: [
                          Button(
                            icon: Svgs.rupee,
                            color: AppColors.whiteLilac,
                            child: Text('Budget: 1,45,000'),
                          ),
                          SizedBox(width: 8),
                          Button(
                            icon: Svgs.brand,
                            color: AppColors.whiteLilac,
                            child: Text('Brand: Swiggy'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: controller.onShareViaWhatsapp,
                        icon: Svgs.whatsapp,
                        color: const Color(0x0BDC4E1F),
                        logo: Image.asset(Pngs.whatsapp),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Share via ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Whatsapp',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Button(
                        onTap: controller.onShareOnLinkedin,
                        icon: Svgs.linkedin,
                        color: const Color.fromRGBO(0, 102, 200, .12),
                        logo: Image.asset(Pngs.linkedin),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Share on ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Linkedin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                KeyDetailCard(controller.request!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset(Svgs.clock),
                    const SizedBox(width: 8),
                    const Text('Your post will be expired on 26 July'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: controller.edit,
                        child: const Text(
                          Strings.edit,
                          style: TextStyle(color: AppColors.coralRed),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextButton(
                        onPressed: controller.close,
                        child: const Text(
                          Strings.close,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
