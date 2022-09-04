void main(List<String> args) async {

  print("Selamat Datang di Rumah Sakit Sakti");
  print(":::::::::::::::::::::::::::::::::::");

  print('\nPasien 1 (umum) datang');
  periksa('umum').then((String dataPasien){
    print(dataPasien);
  }).catchError((error){
    print(error);
  });
  
  print('Pasien 2 (darurat) datang \n');
  try {
    String dataPasien = await periksa('darurat');
    print(dataPasien);
  } catch (error) {
    print(error);
  }

  try{
    var dataPasien = await pesanSelesai();
    print(dataPasien);
  }catch(error){
    print(error);
  }finally{
    print('Seluruh pasien telah dilayani');
  }

}

Future<String> periksa(String tipe) {
  return Future.delayed(Duration(seconds: 3), () {
    if (tipe == 'darurat') {
      return "Pasien $tipe dilayani \n";
    } else {
      throw "Pasien $tipe dilayani setelah pasien darurat";
    }
  });
}

Future<String> pesanSelesai() async {
  var service = await melayaniUmum();
  return "Pasien darurat selesai dilayani \n$service";
}

Future<String> melayaniUmum(){
  return Future.delayed(Duration(seconds: 5), (){
    return 'Pasien umum dilayani \n';
  });
}