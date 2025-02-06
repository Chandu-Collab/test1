class UserData {
  final String uid;
  int counterValue;

  UserData({
    required this.uid,
    this.counterValue = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'counterValue': counterValue,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'] ?? '',
      counterValue: map['counterValue']?.toInt() ?? 0,
    );
  }
}