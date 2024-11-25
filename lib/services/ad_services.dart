import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'dart:io';

class AdServices extends GetxController {
  static final AdServices _instance = AdServices._internal();
  factory AdServices() => _instance;
  AdServices._internal();

  final logger = Logger();
  bool isInitialized = false;
  final RxBool isAdAvailable = false.obs;

  // Test Ad Unit IDs
  static const String testBannerId = 'ca-app-pub-3940256099942544/6300978111';
  static const String testInterstitialId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String testRewardedId = 'ca-app-pub-3940256099942544/5224354917';

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;

  Future<void> initializeAd() async {
    if (isInitialized) return;

    try {
      // Initialize Mobile Ads SDK
      await MobileAds.instance.initialize();
      isInitialized = true;
      logger.i('Google Mobile Ads initialized successfully');

      // Load initial banner ad
      await _loadBannerAd();
    } catch (e) {
      logger.e('Error initializing ads: $e');
      isInitialized = false;
    }
  }

  Future<void> _loadBannerAd() async {
    bannerAd = BannerAd(
      adUnitId: testBannerId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          logger.i('Banner Ad loaded successfully');
          isAdAvailable.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          logger.e('Banner Ad failed to load: $error');
          ad.dispose();
          bannerAd = null;
          isAdAvailable.value = false;
        },
      ),
    );

    try {
      await bannerAd?.load();
    } catch (e) {
      logger.e('Error loading banner ad: $e');
    }
  }

  BannerAd? getBannerAd() => bannerAd;

  @override
  void onClose() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
    rewardedAd?.dispose();
    super.onClose();
  }

  static BannerAd createBannerAd({
    AdSize size = AdSize.banner,
    String? adUnitId,
    void Function(Ad)? onAdLoaded,
    void Function(Ad, LoadAdError)? onAdFailedToLoad,
  }) {
    return BannerAd(
      adUnitId: adUnitId ?? testBannerId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onAdLoaded ?? (_) {},
        onAdFailedToLoad: onAdFailedToLoad ?? (_, __) {},
      ),
    );
  }
}

class AdService {
  static String get bannerAdUnitId {
    // Replace with your actual ad unit IDs
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Test ad unit ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Test ad unit ID
    }
    throw UnsupportedError('Unsupported platform');
  }

  static String generateUniqueAdUnitId() {
    return '${bannerAdUnitId}_${DateTime.now().millisecondsSinceEpoch}';
  }
}