class LopHoc {
  final String? maGiangVien;
  final String? maLopHoc;
  final String? soLuongSinhVien;
  final String? tenLopHoc;
  const LopHoc(
      {required this.maGiangVien,
      required this.maLopHoc,
      required this.soLuongSinhVien,
      required this.tenLopHoc});
  toJson() {
    return {
      "name": maGiangVien,
      "tuoi": maLopHoc,
      "email": soLuongSinhVien,
      "diaChi": tenLopHoc
    };
  }
}


