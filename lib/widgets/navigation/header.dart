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

//TODO - Add notification dropdown
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
        Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
          child: PopupMenuButton<String>(
            offset: const Offset(0, 55),
            color: Colors.white,
            elevation: 8,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
              visualDensity: VisualDensity.compact,
              elevation: WidgetStatePropertyAll<double>(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
            ),
            onSelected: (String result) => debugPrint('Selected: $result'),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              _menuItem('Profile', Icons.person_outline),
              _menuItem('Edit Profile', Icons.edit_outlined),
              const PopupMenuDivider(),
              _menuItem('Analytics', Icons.bar_chart_outlined),
              const PopupMenuDivider(),
              _menuItem('Account settings', Icons.settings_outlined),
              _menuItem('Logout', Icons.logout_outlined),
            ],
            child: SizedBox(
              height: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Image.asset(Constants.profileImg),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (!Responsive.isMobile(context)) const _HeaderUserInfo(),
      ],
    );
  }

  static PopupMenuItem<String> _menuItem(
    String text,
    IconData icon, {
    Color? color,
  }) {
    return PopupMenuItem<String>(
      value: text,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.grey.withValues(alpha: .1),
        hoverColor: Colors.grey.withValues(alpha: .06),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 20, color: color ?? Colors.black87),
              const SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  color: color ?? Colors.black87,
                  fontWeight: color != null
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderUserInfo extends StatelessWidget {
  const _HeaderUserInfo();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'John Smith',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'john@example.com',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
