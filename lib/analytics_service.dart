import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logPurchaseComplete(double ticketValue) async {
    await _analytics.logEvent(name: 'purchase_complete', parameters: {
      'value': ticketValue,
      'currency': 'BRL',
    });
  }

  Future<void> logRentalComplete(String rentalType, double locacaoValue) async {
    await _analytics.logEvent(name: 'rental_complete', parameters: {
      'rental_type': rentalType,
      'value': locacaoValue,
      'currency': 'BRL',
    });
  }

  Future<void> logViewItem(String itemId, String itemName, double price) async {
    await _analytics.logEvent(name: 'view_item', parameters: {
      'item_id': itemId,
      'item_name': itemName,
      'price': price,
    });
  }

  Future<void> logAddToCart(String itemId, String itemName, double price) async {
    await _analytics.logEvent(name: 'add_to_cart', parameters: {
      'item_id': itemId,
      'item_name': itemName,
      'price': price,
    });
  }

  Future<void> logBeginCheckout(double totalValue) async {
    await _analytics.logEvent(name: 'begin_checkout', parameters: {
      'value': totalValue,
    });
  }

  Future<void> logPurchase(String transactionId, double totalValue, String currency) async {
    await _analytics.logEvent(name: 'purchase', parameters: {
      'transaction_id': transactionId,
      'value': totalValue,
      'currency': currency,
    });
  }

  Future<void> logSelectPaymentMethod(String selectedPaymentMethod) async {
    await _analytics.logEvent(name: 'select_payment_method', parameters: {
      'payment_method': selectedPaymentMethod,
    });
  }

  Future<void> logHeatmapClick(String elementId, String elementName) async {
    await _analytics.logEvent(name: 'heatmap_click', parameters: {
      'element_id': elementId,
      'element_name': elementName,
    });
  }

  Future<void> logFunnelStep(String currentStepName, int currentStepIndex) async {
    await _analytics.logEvent(name: 'funnel_step', parameters: {
      'step_name': currentStepName,
      'step_index': currentStepIndex,
    });
  }
}
