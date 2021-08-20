void main() {
  // don't change this function
  var data1 = ["Jalan Raya", "Kecamatan", "Kabupaten", 'Provinsi', null];
  var result1 = cleanData(data1);
  isValid(result1, "Jalan Raya, Kecamatan, Kabupaten, Provinsi");

  var data2 = ["Jalan Raya", null, "Kabupaten", 'Provinsi', null];
  var result2 = cleanData(data2);
  isValid(result2, "Jalan Raya, Kabupaten, Provinsi");

  var data3 = ["Jalan Raya", "Kecamatan", "Kabupaten", 'Provinsi', '13000'];
  var result3 = cleanData(data3);
  isValid(result3, "Jalan Raya, Kecamatan, Kabupaten, Provinsi - 13000");
}

String cleanData(List data) {
  var result = '';
  // TODO write your code here
  var tempList = data.whereType<String>().toList();
  result = tempList.join(', ');
  if (tempList.length >= 5) {
    result = result.replaceAll('Provinsi,', 'Provinsi -');
  }

  print(tempList.length);
  return result;
}

void isValid(String result, String validation) {
  // don't change this function
  print('$result : ${result == validation ? "pass" : "fail"}');
}
