// lib/domain/usecases/auth/request_otp.dart

import '../../../core/error/failure.dart';
import '../../../core/result/result.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/auth_session.dart';
import '../../repositories/i_auth_repository.dart';
import '../../entities/mobile_number.dart';

final class RequestOtpParams extends UseCaseParams {
  final String mobile;

  const RequestOtpParams({required this.mobile});

  @override
  List<Object?> get props => [mobile];
}

/// Sends a one-time code to a mobile number.
///
/// The mobile number rule used to live in `otpRequestProvider`, which threw a raw
/// `Exception('Please enter a valid 10-digit mobile number')`. It belongs here:
/// one place, returning a typed failure the UI can render safely.
final class RequestOtp extends UseCase<OtpChallenge, RequestOtpParams> {
  final IAuthRepository _repository;

  const RequestOtp(this._repository);

  @override
  Future<Result<OtpChallenge>> call(RequestOtpParams params) async {
    final mobile = params.mobile.trim();

    if (mobile.isEmpty) {
      return const Err(ValidationFailure('Please enter your mobile number.'));
    }
    if (!MobileNumber.isValid(mobile)) {
      return const Err(
        ValidationFailure('Please enter a valid mobile number.'),
      );
    }

    return _repository.requestOtp(mobile);
  }
}
