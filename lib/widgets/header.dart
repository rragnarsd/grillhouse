import 'package:dashboard/responsive.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: Constants.kLeadingWidth,
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      leading: HeaderLeading(scaffoldKey: scaffoldKey),
      title: const HeaderTitle(),
      toolbarHeight: Constants.kHeaderHeight,
      actionsPadding: _getActionsPadding(context),
      actions: const <Widget>[
        HeaderSearchButton(),
        HeaderNotificationButton(),
        SizedBox(width: 10),
        HeaderUserProfile(),
      ],
    );
  }

  EdgeInsets _getActionsPadding(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(right: Constants.kDesktopActionsPadding);
    } else if (Responsive.isTablet(context)) {
      return const EdgeInsets.only(right: Constants.kTabletActionsPadding);
    } else {
      return const EdgeInsets.only(right: Constants.kMobileActionsPadding);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(Constants.kHeaderHeight);
}

class HeaderLeading extends StatelessWidget {
  const HeaderLeading({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: const EdgeInsets.all(Constants.kMenuButtonPadding),
      onPressed: () => scaffoldKey?.currentState?.openDrawer(),
      icon: const Icon(Icons.menu),
    );
  }
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
