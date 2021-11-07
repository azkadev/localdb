tanggal(int timestamp) {
  var now = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var bulan = [
    'Desember',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November'
  ];
  var suasana = [
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Pagi',
    'Siang',
    'Siang',
    'Siang',
    'Siang',
    'Siang',
    'Siang',
    'Sore',
    'Sore',
    'Sore',
    'Malam',
    'Malam',
    'Malam',
    'Malam',
    'Malam'
  ];
  var json = {};
  var hari = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jum'at", "Sabtu"];
  json["tahun"] = now.year;
  json["bulan"] = bulan[now.month];
  json["no_bulan"] = now.month;
  json["tanggal"] = now.day;
  json["hari"] = hari[now.weekday];
  json["suasana"] = suasana[now.hour];
  json["jam"] = now.hour;
  json["menit"] = now.minute;
  json["detik"] = now.second;
  json["timestamp"] = now.millisecondsSinceEpoch;
  return json;
}

tambah(){

}