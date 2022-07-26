import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:tugasakhir/model/activity_model.dart';
import 'package:tugasakhir/model/cutiresponse.dart';
import 'package:tugasakhir/model/dashboard_chief.dart';
import 'package:tugasakhir/model/detail_activity_response.dart';
import 'package:tugasakhir/model/user_response.dart';
import 'package:tugasakhir/services/baseurl.dart';
import 'package:tugasakhir/services/token.dart';

import '../component/toast.dart';

class KepalaLapanganServices {
  Client client = Client();

  Future<ActivityResponse> getActivity() async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/activities');
    final response = await client.get(uri, headers: header);
    var res = jsonDecode(response.body);
    return activityResponseFromJson(response.body);
  }

  //get detail activity
  Future<DetailActivityResponse> getDetailActivity(String id) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/activities/show/$id');
    final response = await client.get(uri, headers: header);
    print(response.body);
    return detailActivityResponseFromJson(response.body);
  }

  //delete activity
  Future<bool> deleteActivity(String id) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/activities/delete/$id');
    final response = await client.delete(uri, headers: header);
    print(response.body);
    return true;
  }

  Future<DashboardChief> getDashboard() async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/dashboard');
    final response = await client.post(uri, headers: header);
    return dashboardChiefFromJson(response.body);
  }

  Future<bool> postActivity(
    String chiefofficerid,
    String fieldId,
    String lokasi,
    String description,
    String startTime,
    String finishTime,
  ) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/activities/store');
    var body = {
      'chief_officer_id': chiefofficerid,
      'field_officer_id': fieldId,
      'location_name': lokasi,
      'description': description,
      'start_time': startTime,
      'finish_time': finishTime,
      'coordinate': 'https://goo.gl/maps/S28gvAB9yTsFdUECA',
      'status_activity': '0'
    };
    final response = await client.post(uri, body: body, headers: header);
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      return true;
    } else {
      if (res['message'] != null) {
        ToastCustom.toastError(res['message']);
      } else {
        List error = [];
        //res foreach key and value
        res['errors'].forEach((key, value) {
          for (var key in value) {
            error.add(key);
          }
        });
        ToastCustom.toastError(error.first);
      }
      return false;
    }
  }

  Future<bool> updateActivity(
    String id,
    String chiefofficerid,
    String fieldId,
    String lokasi,
    String description,
    String startTime,
    String finishTime,
  ) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/activities/update/$id');
    var body = {
      'kepala_id': chiefofficerid,
      'pekerja_id': fieldId,
      'nama_tempat': lokasi,
      'deskripsi': description,
      'waktu_mulai': startTime,
      'waktu_selesai': finishTime,
      'koordinat': 'https://goo.gl/maps/S28gvAB9yTsFdUECA'
    };
    final response = await client.patch(uri, body: body, headers: header);
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      return true;
    } else {
      if (res['message'] != null) {
        ToastCustom.toastError(res['message']);
      } else {
        List error = [];
        //res foreach key and value
        res['errors'].forEach((key, value) {
          for (var key in value) {
            error.add(key);
          }
        });
        ToastCustom.toastError(error.first);
      }
      return false;
    }
  }

  Future<CutiResponse> getCuti() async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/paidLeaves');
    final response = await client.get(uri, headers: header);
    var res = jsonDecode(response.body);
    return cutiResponseFromJson(response.body);
  }

  Future<UsersResponse> getUsers() async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/users');
    final response = await client.get(uri, headers: header);
    return usersResponseFromJson(response.body);
  }

  Future<bool> register(String nama, email, phone) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/register');
    var body = {
      'name': nama,
      'email': email,
      'phone_number': phone,
      'role': '1'
    };
    final response = await client.post(uri, body: body, headers: header);
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      return true;
    } else {
      if (res['message'] != null) {
        ToastCustom.toastError(res['message']);
      } else {
        List error = [];
        //res foreach key and value
        res['errors'].forEach((key, value) {
          for (var key in value) {
            error.add(key);
          }
        });
        ToastCustom.toastError(error.first);
      }
      return false;
    }
  }

  Future<bool> updateUser(
      String nama, phone, passold, passnew, passconf) async {
    var header = await TokenC().header();
    var uri = Uri.parse(BaseUrl().getip() + '/users/update');
    var body = {
      'name': nama,
      'phone_number': phone,
      'old_password': passold,
      'password': passnew,
      'password_confirmation': passconf
    };
    final response = await client.patch(uri, body: body, headers: header);
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      return true;
    } else {
      if (res['message'] != null) {
        ToastCustom.toastError(res['message']);
      } else {
        List error = [];
        //res foreach key and value
        res['errors'].forEach((key, value) {
          for (var key in value) {
            error.add(key);
          }
        });
        ToastCustom.toastError(error.first);
      }
      return false;
    }
  }
}
