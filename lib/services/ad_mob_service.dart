import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get InterstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1092157597274926/5936768758';
    }
    if(Platform.isIOS) {
      return 'ca-app-pub-1092157597274926/6189923697';
    }

    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: ((ad) => debugPrint('Ad loaded')),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
