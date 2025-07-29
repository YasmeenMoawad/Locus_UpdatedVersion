import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:locus_application/constants/colors.dart';
import 'package:locus_application/features/explore_news/presentation/views/community_view.dart';
import 'package:locus_application/features/explore_news/presentation/views/profile_view.dart';
import 'package:locus_application/features/explore_news/presentation/views/widgets/custom_image_profile.dart';
import 'package:locus_application/features/explore_news/presentation/views/widgets/drawer_item.dart';
import 'package:locus_application/features/explore_news/presentation/views/widgets/drawer_list_tile.dart';

class CustomizedDrawer extends StatelessWidget {
  const CustomizedDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: LocusColors.primaryColor2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: Column(
          children: [
            Row(
              children: [
                const CustomImageProfile(
                  profileImage: AssetImage('assets/images/profile_image.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Locus team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Locusteam@gmail.com',
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white.withOpacity(0.699999988079071),
                        // fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Divider(),
              // * profile
            ),
            DrawerItem(
              icon:
                  const Image(image: AssetImage('assets/images/user_icon.png')),
              title: 'Profile',
              subTitle1: 'Setting',
              subTitle12: 'My Planet',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ProfileView();
                  }),
                );
              },
              subTitle1onTap: () {},
              subTitle2onTap: () {},
            ),
            DrawerItem(
              icon: const Image(
                  image: AssetImage('assets/images/community_icon.png')),
              title: 'Community',
              subTitle1: 'Posts',
              subTitle12: 'Upload',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommunityView()));
              },
              subTitle1onTap: () {},
              subTitle2onTap: () {},
            ),
            Column(
              children: [
                DrawerListTile(
                  icon: SvgPicture.asset('assets/images/document_icon.svg'),
                  title: 'Terms / Conditions',
                  onTap: () {},
                ),
                DrawerListTile(
                  icon: SvgPicture.asset('assets/images/notebook.svg'),
                  title: 'Privacy / Policy',
                  onTap: () {},
                ),
                DrawerListTile(
                  icon: SvgPicture.asset('assets/images/help-circle.svg'),
                  title: 'FAQs',
                  onTap: () {},
                ),
                DrawerListTile(
                  icon: SvgPicture.asset('assets/images/rating.svg'),
                  title: 'App Rating',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

