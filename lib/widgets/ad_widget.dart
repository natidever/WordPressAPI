import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_app/services/ad_services.dart';

class AdBannerWidget extends StatefulWidget {
  final AdSize adSize;
  final String? adUnitId;

  const AdBannerWidget({
    Key? key,
    this.adSize = AdSize.banner,
    this.adUnitId,
  }) : super(key: key);

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  final AdServices _adServices = AdServices();

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId ?? AdServices.testBannerId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded) {
      return SizedBox(
        height: widget.adSize.height.toDouble(),
        width: widget.adSize.width.toDouble(),
      );
    }

    return SizedBox(
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd),
    );
  }
}
