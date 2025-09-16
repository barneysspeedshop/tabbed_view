import 'package:flutter/widgets.dart';

import 'tab_status.dart';

/// Signature for a function that builds a leading widget in tab.
typedef TabLeadingBuilder = Widget? Function(
    BuildContext context, TabStatus status);
