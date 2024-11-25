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

  InterstitialAd? _interstitialAd;

  // Test ad unit ID for interstitial
  final String _testInterstitialAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712' // Android test ID
      : 'ca-app-pub-3940256099942544/4411468910'; // iOS test ID

  @override
  void onInit() {
    super.onInit();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _testInterstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          print('Interstitial ad loaded successfully');
        },
        onAdFailedToLoad: (error) {
          print('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  Future<void> showInterstitialAd() async {
    if (_interstitialAd != null) {
      await _interstitialAd!.show();
      _interstitialAd = null;
      // Load the next interstitial ad
      _loadInterstitialAd();
    } else {
      print('Interstitial ad not ready yet');
      // Try to load a new ad
      _loadInterstitialAd();
    }
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
