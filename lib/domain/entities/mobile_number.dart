// lib/domain/entities/mobile_number.dart

/// Mobile number rules, matching the backend's `utils/phone.js`.
///
/// Accepts the local formats of the countries the platform serves:
///   India:    10 digits starting 6-9            e.g. 9876543210
///   Malaysia: 01x followed by 7-8 more digits    e.g. 0123456789, 01123456789
abstract final class MobileNumber {
  static final RegExp _format = RegExp(r'^(?:[6-9]\d{9}|01\d{8,9})$');

  /// Longest accepted number, for input length limits.
  static const int maxLength = 11;

  /// Whether [raw] is a valid local mobile number.
  static bool isValid(String? raw) => _format.hasMatch(raw?.trim() ?? '');
}
