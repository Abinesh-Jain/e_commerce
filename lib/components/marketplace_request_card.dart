import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app_colors.dart';
import '../models/marketplace_request.dart';
import '../utils/svgs.dart';
import 'button.dart';

class MarketplaceRequestCard extends StatelessWidget {
  const MarketplaceRequestCard(
    this.request, {
    super.key,
    this.header,
    this.discriptionStyle,
  });

  final Widget? header;

  final MarketplaceRequest request;

  final TextStyle? discriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        header ??
            Row(
              children: [
                if (request.userDetails?.profileImage != null) ...[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(request.userDetails!.profileImage!),
                    radius: 23,
                  ),
                  const SizedBox(width: 8)
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.userDetails?.name ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        request.userDetails?.designation ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 11),
                          const SizedBox(width: 2),
                          Text(
                            request.createdAt ?? '2s',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
        if (header == null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                SvgPicture.asset(Svgs.frame),
                const SizedBox(width: 8),
                Text(
                  'Looking for ${request.serviceType}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        Text(
          '${request.description}',
          style: discriptionStyle,
        ),
        if (header == null) ...[
          const SizedBox(height: 8),
          if (request.requestDetails?.cities != null) ...[
            Button(
              color: AppColors.whiteLilac,
              icon: Svgs.distance,
              child: Text('${request.requestDetails?.cities?.join(', ')}'),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            children: [
              if (request.requestDetails?.followersRange != null) ...[
                Button(
                  color: AppColors.whiteLilac,
                  icon: Svgs.instagram,
                  child: Text(
                      '${request.requestDetails?.followersRange?.igFollowersMin} - ${request.requestDetails?.followersRange?.igFollowersMax}'),
                ),
                const SizedBox(width: 8),
              ],
              if (request.requestDetails?.categories != null)
                Button(
                  color: AppColors.whiteLilac,
                  icon: Svgs.category,
                  child:
                      Text('${request.requestDetails?.categories?.join(', ')}'),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
