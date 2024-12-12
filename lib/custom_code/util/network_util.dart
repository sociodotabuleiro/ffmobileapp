import 'dart:async';
import 'dart:io';

import '../../../analytics_service.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';

class NetworkUtil {
  final analytics_service = AnalyticsService();
  final Logger _logger = Logger();
  Future<Response?> retryRequest(
    Future<Response> Function() request, {
    int retries = 3,
    Duration delay = const Duration(seconds: 2),
  }) async {
    int attempt = 0;
    Response? response;

    while (attempt < retries) {
      try {
        // Make the request
        response = await request();

        // Log success
        _logger.i('Request succeeded with status: ${response.statusCode}');

        // Check for successful status codes
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response;
        }

        // Stop retrying for 400-level errors (client errors)
        if (response.statusCode >= 400 && response.statusCode < 500) {
          _logger.e(
              'Non-recoverable error: ${response.statusCode}. Stopping retries.');
          return response; // Return response for client error
        }

        // Log other status codes and continue retrying
        _logger.w(
            'Request failed with status: ${response.statusCode}. Retrying...');
      } on TimeoutException catch (e) {
        // Handle request timeout
        _logger.e('TimeoutException occurred: $e');
      } on SocketException catch (e) {
        // Handle network issues
        _logger.e('SocketException occurred: $e');
      } catch (e) {
        // Catch-all for other exceptions
        _logger.e('An unexpected error occurred: $e');
      }

      // Increment attempt counter
      attempt++;

      // If retries remain, wait before retrying
      if (attempt < retries) {
        await Future.delayed(delay);
      }
    }

    // Log and return the last response or null if all retries failed
    _logger.e('All retries failed. Returning the last response or null.');
    return response;
  }
}