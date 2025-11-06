import 'package:dashboard/responsive.dart';
import 'package:flutter/material.dart';

const double _kHeaderHeight = 80.0;

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      leading: !Responsive.isDesktop(context)
          ? IconButton(
              onPressed: () => scaffoldKey?.currentState?.openDrawer(),
              icon: const Icon(Icons.menu),
            )
          : const SizedBox.shrink(),
      title: const HeaderTitle(),
      toolbarHeight: _kHeaderHeight,
      actionsPadding: const EdgeInsets.only(right: 24),
      actions: <Widget>[
        const HeaderSearchButton(),
        const HeaderNotificationButton(),
        const SizedBox(width: 10),
        const HeaderUserProfile(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_kHeaderHeight);
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context)) return const SizedBox.shrink();

    return SizedBox(
      width: 400,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }
}

class HeaderSearchButton extends StatelessWidget {
  const HeaderSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) return const SizedBox.shrink();

    return IconButton(onPressed: () {}, icon: const Icon(Icons.search));
  }
}

class HeaderNotificationButton extends StatelessWidget {
  const HeaderNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.notifications));
  }
}

class HeaderUserProfile extends StatelessWidget {
  const HeaderUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CircleAvatar(),
        const SizedBox(width: 10),
        if (!Responsive.isMobile(context)) const HeaderUserInfo(),
      ],
    );
  }
}

class HeaderUserInfo extends StatelessWidget {
  const HeaderUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[Text('John Doe'), Text('john.doe@example.com')],
    );
  }
}
