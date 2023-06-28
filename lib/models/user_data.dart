class UserData{
  int? customer_id;
  String? name;
  String? eng_name;
  String? phone;
  String? username;
  String? email;
  double? wallet_balance;
  String? cash_back_coupon;


  UserData({this.customer_id, this.name, this.eng_name, this.phone,
      this.username, this.email, this.wallet_balance,this.cash_back_coupon});

  factory UserData.fromJson(Map<String,dynamic> json)=>
      UserData(
          customer_id: json['customer_id'] ,
          name: json['name'] ,
          eng_name:json['eng_name'],
          phone:  json['phone'] ,
          wallet_balance:   json['wallet_balance'] ,
          username:  json['username'] ,
          email:  json['email'] ,
        cash_back_coupon:  json['cash_back_coupon'] ,
      );

}
class GroupData{
  int? id;
  String? name;
  String? slug;
  String? description;
  GroupData({
    this.id,
    this. name,
    this.description,
    this.slug,
  });
  factory GroupData.fromJson(Map<String,dynamic> json)=>
      GroupData(
        id: json['id'] ,
        description:json['description'],
        name:  json['name'] ,
        slug:  json['slug'] ,
      );
}
enum GroupDataType{
  General_Manager,
  Technicians,
  Receptions_Customers,
  Customers
}
class TechniciansData{
  int? id;

  String? title;
  String? image;

  String? group;
  TechniciansData({
    this.id,

    this.image,
    this.group,
    this.title,

  });
  factory TechniciansData.fromJson(Map<String,dynamic> json)=>
      TechniciansData(
        id: json['id'] ,
        // image:  json['image'] ,
        group:   json['group'] ,
        title:   json['full_name'],

      );
}