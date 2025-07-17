import 'package:flutter/material.dart';
import 'package:responsive_app/size_config.dart';

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(),
        32.wSpace,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileInfo(),
              24.hSpace,
              StatsRow(),
              32.hSpace,
              FollowButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(),
        16.hSpace,
        ProfileInfo(),
        24.hSpace,
        StatsRow(),
        32.hSpace,
        FollowButton(),
      ],
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          'Follow',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: StatItem('Posts', '215')),
          16.wSpace,
          Expanded(child: StatItem('Followers', '1.2K')),
          16.wSpace,
          Expanded(child: StatItem('Following', '340')),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  const StatItem(this.label, this.value, {super.key});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          4.hSpace,
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Aya Saleh',
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
        ),
        8.hSpace,
        Text(
          'Flutter Developer | UI/UX Enthusiast',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 75.w / 2,
      backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=12'),
      backgroundColor: Colors.grey[300],
    );
  }
}
