
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../services/api_service/url.dart';
import '../core/errors/app_exception.dart';
import '../core/errors/failure.dart';
import '../services/api_service/dio_client.dart';
@injectable
class SplashRepository{
  DioClient dioClient;
  SplashRepository({required this.dioClient});
  void close(){
    dioClient.close();
  }

  Future<Either<Failure, String>> getAppSettings() async {
    try{
      var res = await dioClient.request(URL.baseUrl, withAuth: false,);
      return Right(res.toString());
    }on AppException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }


}