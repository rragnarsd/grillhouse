import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.onClick,
    required this.label,
    required this.bgColor,
    this.textColor = Colors.black,
    this.height = 54,
    this.enabled = true,
  });

  final VoidCallback onClick;
  final String label;
  final Color bgColor;
  final Color textColor;
  final double height;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, height),
        backgroundColor: bgColor,
        disabledBackgroundColor: theme.disabledColor,
        disabledForegroundColor: theme.colorScheme.onSurface.withValues(
          alpha: 0.38,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      onPressed: enabled ? onClick : null,
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
      ),
    );
  }
}

class PrimaryOutlinedBtn extends StatelessWidget {
  const PrimaryOutlinedBtn({
    super.key,
    required this.onClick,
    required this.label,
    this.height = 54,
    this.enabled = true,
  });

  final VoidCallback onClick;
  final String label;
  final double height;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(double.infinity, height),
        side: BorderSide(color: theme.colorScheme.onSurface),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      onPressed: enabled ? onClick : null,
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
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
    this.shape,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton.filled(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: theme.colorScheme.secondary.withValues(alpha: .3),
        shape: shape,
      ),
      icon: Icon(
        icon,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
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
