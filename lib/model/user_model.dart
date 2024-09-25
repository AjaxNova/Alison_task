class UserModel {
  int success;
  String message;
  Customerdata customerdata;
  String guestId;

  UserModel({
    required this.success,
    required this.message,
    required this.customerdata,
    required this.guestId,
  });

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'],
      message: json['message'],
      customerdata: Customerdata.fromJson(json['customerdata']),
      guestId: json['guest_id'], // Map 'guest_id' to 'guestId'
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'customerdata': customerdata.toJson(),
      'guest_id': guestId, // Map 'guestId' to 'guest_id'
    };
  }
}

class Customerdata {
  String id;
  String name;
  String email;
  String mobile;
  String referee;
  String referralCode;
  int status;
  String token;
  int otpverificationstatus;
  int emailverificationstatus;

  Customerdata({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.referee,
    required this.referralCode,
    required this.status,
    required this.token,
    required this.otpverificationstatus,
    required this.emailverificationstatus,
  });

  // From JSON
  factory Customerdata.fromJson(Map<String, dynamic> json) {
    return Customerdata(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      referee: json['referee'],
      referralCode:
          json['referral_code'], // Map 'referral_code' to 'referralCode'
      status: json['status'],
      token: json['token'],
      otpverificationstatus: json['otpverificationstatus'],
      emailverificationstatus: json['emailverificationstatus'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'referee': referee,
      'referral_code': referralCode, // Map 'referralCode' to 'referral_code'
      'status': status,
      'token': token,
      'otpverificationstatus': otpverificationstatus,
      'emailverificationstatus': emailverificationstatus,
    };
  }
}
