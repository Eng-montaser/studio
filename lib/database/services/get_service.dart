import 'package:http/http.dart' as http;

import '../api.dart';

class GetService extends BaseApi {
  Future<http.Response> getUser() async {
    return await api.httpGet('Customer/Profile');
  }

  Future<http.Response> getJobCarList() async {
    return await api.httpGet('orders');
  }

  Future<http.Response> getMakers() async {
    return await api.httpGetwithouttoken('General/Cars/Vendors');
  }

  Future<http.Response> getColors() async {
    return await api.httpGetwithouttoken('General/Cars/Colors');
  }Future<http.Response> getFuels() async {
    return await api.httpGetwithouttoken('General/Cars/FuelTypes');
  }

  Future<http.Response> getServices() async {
    return await api.httpGet('services');
  }

  Future<http.Response> getModels(int vendorId) async {
    return await api.httpGetwithouttoken('General/Cars/Models/$vendorId');
  }
  Future<http.Response> getCylinder(int modelId) async {
    return await api.httpGetwithouttoken('General/Cars/Models/Cylinder/$modelId');
  }
  Future<http.Response> getAllModels() async {
    return await api.httpGet('models');
  }

  Future<http.Response> getYear(String make, String model) async {
    return await api
        .httpGet('products/year', query: {'make': make, 'model': model});
  }

  Future<http.Response> getCars() async {
    return await api.httpGet('Customer/Cars',
        );
  }



  Future<http.Response> viewCar(int id) async {
    return await api.httpGet(
      'cars/show/$id',
    );
  }
}
