import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    return AppBar(
      leadingWidth: isDesktop ? 8.0 : null,
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      leading: isTablet ? _HeaderLeading(scaffoldKey: scaffoldKey) : null,
      title: const _HeaderTitle(),
      toolbarHeight: 80.0,
      actionsPadding: _getActionsPadding(context),
      actions: const <Widget>[
        _HeaderSearchButton(),
        _HeaderNotificationButton(),
        SizedBox(width: 10),
        _HeaderUserProfile(),
      ],

      automaticallyImplyLeading: false,
    );
  }

  EdgeInsets _getActionsPadding(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(right: 24.0);
    } else if (Responsive.isTablet(context)) {
      return const EdgeInsets.only(right: 16.0);
    } else {
      return const EdgeInsets.only(right: 8.0);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _HeaderLeading extends StatelessWidget {
  const _HeaderLeading({this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isMobile(context)) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: const EdgeInsets.all(16.0),
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () => scaffoldKey?.currentState?.openDrawer(),
      icon: const Icon(Icons.menu),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle();

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
          hintText: Constants.search,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
    );
  }
}

class _HeaderSearchButton extends StatelessWidget {
  const _HeaderSearchButton();

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) return const SizedBox.shrink();

    return IconButton(onPressed: () {}, icon: const Icon(Icons.search));
  }
}

class _HeaderNotificationButton extends StatelessWidget {
  const _HeaderNotificationButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.notifications));
  }
}

class _HeaderUserProfile extends StatelessWidget {
  const _HeaderUserProfile();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Image.asset(Constants.profileImg),
          ),
        ),
        const SizedBox(width: 10),
        if (!Responsive.isMobile(context)) const _HeaderUserInfo(),
      ],
    );
  }
}

class _HeaderUserInfo extends StatelessWidget {
  const _HeaderUserInfo();

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
