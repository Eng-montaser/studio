class CarInfo {
  int? id;
  int? Car_Vendor_id;
  int? Car_Model_id;
  int? Car_Color_id;
  int? Cylinder_id;
  int? Car_Fule_Type_id;
  String? Vendors_binary_image;
  String? Fule_Type_eng_name;
  String? Fule_Type_name;
  String? color_eng_name;
  String? color_name;
  String? Models_eng_name;
  String? Models_name;
  String? Model_Year;
  String? Car_Lic_No;
  String? Board_No;
  String? Last_KMs_Usages;
  String? Vendor_name;
  String? Vendor_egn_name;

  CarInfo(
      {this.id,
      this.Car_Vendor_id,
      this.Car_Model_id,
      this.Car_Color_id,
      this.Cylinder_id,
      this.Car_Fule_Type_id,
      this.Vendors_binary_image,
      this.Fule_Type_eng_name,
      this.Fule_Type_name,
      this.color_eng_name,
      this.color_name,
      this.Models_eng_name,
      this.Models_name,
      this.Model_Year,
      this.Car_Lic_No,
      this.Board_No,
      this.Last_KMs_Usages,
      this.Vendor_name,
      this.Vendor_egn_name});

  factory CarInfo.fromJson(Map<String, dynamic> json) => CarInfo(
      id: json['id'],
      Car_Vendor_id: json['Car_Vendor_id'],
      Car_Model_id: json['Car_Model_id'],
      Car_Color_id: json['Car_Color_id'],
      Cylinder_id: json['Cylinder_id'],
      Car_Fule_Type_id: json['Car_Fule_Type_id'],
      Vendors_binary_image: json['Vendors_binary_image'],
      Fule_Type_eng_name: json['Fule_Type_eng_name'],
      Fule_Type_name: json['Fule_Type_name'],
      color_eng_name: json['color_eng_name'],
      color_name: json['color_name'],
      Models_eng_name: json['Models_eng_name'],
      Models_name: json['Models_name'],
      Model_Year: '${json['Model_Year']}',
      Car_Lic_No: '${json['Car_Lic_No']}',
      Board_No: '${json['Board_No']}',
      Last_KMs_Usages: '${json['Last_KMs_Usages']}',
      Vendor_name: json['Vendor_name'],
      Vendor_egn_name: json['Vendor_egn_name']);

  Map<String, String> toMap() {
    return {
      // "mark_id": '${make!.id}',
      // "model_id": '${model!.id}',
      // "color_id": '${color!.id}',
      // "year": '$year',
      // "vin": '$vin',
      // "serial_number": '$serialNumber',
      // "mileage_form_car": '$mileage'
    };
  }
}

class CarMake {
  int? id;

  String? title_ar;
  String? title_en;
  List<CarModel> carModelItems;
  CarMake({
    this.id,
    this.title_ar,
    required this.carModelItems,
    this.title_en,
  });
  factory CarMake.fromJson(Map<String, dynamic> json) => CarMake(
      id: json['id'],
      title_en: json['eng_name'],
      title_ar: json['name'],
      carModelItems: []);
}

class CarModel {
  int? id;

  String? title_ar;
  String? title_en;
  int? car_vendor_id;
  int? Car_Size_ID;
  CarModel(
      {this.id,
      this.title_ar,
      this.title_en,
      this.Car_Size_ID,
      this.car_vendor_id});
  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'],
      title_en: json['eng_name'],
      title_ar: json['name'],
      Car_Size_ID: json['Car_Size_ID'],
      car_vendor_id: json['car_vendor_id']);
}

class CarColor {
  int? id;

  String? title_ar;
  String? title_en;

  CarColor({
    this.id,
    this.title_ar,
    this.title_en,
  });
  factory CarColor.fromJson(Map<String, dynamic> json) => CarColor(
        id: json['id'],
        title_en: json['eng_name'],
        title_ar: json['name'],
      );
}

class CarFuel {
  int? id;

  String? title_ar;
  String? title_en;

  CarFuel({
    this.id,
    this.title_ar,
    this.title_en,
  });
  factory CarFuel.fromJson(Map<String, dynamic> json) => CarFuel(
        id: json['id'],
        title_en: json['eng_name'],
        title_ar: json['name'],
      );
}

class CarCylinder {
  int? id;

  String? name;

  CarCylinder({
    this.id,
    this.name,
  });
  factory CarCylinder.fromJson(Map<String, dynamic> json) => CarCylinder(
        id: json['id'],
        name: '${json['name']}',
      );
}
