import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user, required this.onViewProfile});

  final UserEntity user;
  final Function(String uid, UserRole role) onViewProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.wildBlueYonder.withAlpha(18),
            blurRadius: 62,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      width: double.infinity,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onViewProfile(user.id, user.role),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.avatar,
              width: 40,
              height: 40,
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(AppImages.logo),
              placeholder: (context, url) => const ItemLoading(
                width: 40,
                height: 40,
                radius: 0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onViewProfile(user.id, user.role),
                child: Text(
                  user.name,
                  style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Text(user.address.isEmpty ? "-----" : user.address),
            ],
          ),
        ),
      ],
    );
  }
}
