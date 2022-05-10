class SplitData {
  SplitData(this.qrCodeData) {
    this.classifyQrCodeData();
  }
  String? qrCodeData;
  String? gloveType;
  String? serialNumber;
  String? productionDate;
  String? kiloVolt;
  String? webSite;
  String? gloveClass;
  List? splittedData;

  void classifyQrCodeData() {
    splittedData = qrCodeData!.split(' '); // Parcalanacak veri
    gloveType = splittedData![0] + splittedData![1];
    gloveClass = splittedData![2]; //Safeline , ASP-EI, 4 kelimeleri
    serialNumber = splittedData![3];
    productionDate = splittedData![4];
    kiloVolt = splittedData![5];
    try {
      webSite = splittedData![5] +
          splittedData![
              6]; //asparenerji .com olara basılanlar icin .com birlesiyor.
    } catch (e) {
      webSite = splittedData![5]; // bitisik basilirsa asparenerji.com aliyor.
    }
  }

  String? get getGloveType => gloveType;
  String? get getSerialNumber => serialNumber;
  String? get getProductionDate => productionDate;
  String? get getKiloVolt => kiloVolt;
  String? get getGloveClass => gloveClass;
}
