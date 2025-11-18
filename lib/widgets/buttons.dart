import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.onClick,
    required this.label,
    required this.bgColor,
    this.textColor = Colors.black,
    this.enabled = true,
  });

  final VoidCallback onClick;
  final String label;
  final Color bgColor;
  final Color textColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        backgroundColor: bgColor,
        disabledBackgroundColor: theme.disabledColor,
        disabledForegroundColor: theme.colorScheme.onSurface.withValues(
          alpha: 0.38,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: enabled ? onClick : null,
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PrimaryElevatedIconBtn extends StatelessWidget {
  const PrimaryElevatedIconBtn({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.btnLabel,
    required this.backgroundColor,
    required this.textColor,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String btnLabel;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        fixedSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, size: 18, color: textColor),
      label: Text(
        btnLabel,
        style: theme.textTheme.titleMedium?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PrimaryOutlinedBtn extends StatelessWidget {
  const PrimaryOutlinedBtn({
    super.key,
    required this.onClick,
    required this.label,
    this.enabled = true,
  });

  final VoidCallback onClick;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(double.infinity, 48),
        side: BorderSide(color: theme.colorScheme.onSurface),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: enabled ? onClick : null,
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PrimaryOutlinedIconBtn extends StatelessWidget {
  const PrimaryOutlinedIconBtn({
    super.key,
    required this.onClick,
    required this.icon,
    required this.label,
    required this.color,
  });

  final VoidCallback onClick;
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, size: 18, color: color),
      label: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PrimaryFilledIconButton extends StatelessWidget {
  const PrimaryFilledIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    this.iconColor,
    this.shape,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final OutlinedBorder? shape;
  final Color backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton.filled(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        shape: shape,
      ),
      icon: Icon(
        icon,
        color: iconColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.8),
      ),
      onPressed: onPressed,
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({super.key, this.onPressed, required this.icon});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton(
      style: IconButton.styleFrom(padding: EdgeInsets.zero),
      icon: Icon(
        icon,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
      ),
      onPressed: onPressed,
    );
  }
}
