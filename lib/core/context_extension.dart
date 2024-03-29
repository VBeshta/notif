import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notif/core/logger/composite_logger.dart';
import 'package:notif/core/logger/composite_logger_holder.dart';
import 'package:notif/core/router/app_router.dart';
import 'package:notif/core/router/app_router_handler.dart';
import 'package:notif/presentation/tokens/spacing_holders.dart';
import 'package:notif/presentation/tokens/spacings.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get s => AppLocalizations.of(this)!;

  CompositeLogger get l => CompositeLoggerHolder.of(this);

  ColorScheme get c => Theme.of(this).colorScheme;

  Spacings get sp => SpacingsHolder.of(this).spacings;

  AppRouter get r => AppRouterHolder.of(this).router;
}
