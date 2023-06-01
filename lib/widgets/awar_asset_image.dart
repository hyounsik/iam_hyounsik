import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlatformAwareAssetImage extends StatelessWidget {
  final String asset;
  final String? package;
  const PlatformAwareAssetImage({
    required this.asset,
    this.package,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$asset',
      );
    }

    return Image.asset(
      asset,
      package: package,
    );
  }
}
