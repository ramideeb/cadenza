import 'dart:io';

import 'package:aes_crypt/aes_crypt.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  AesCrypt crypt;

  FileHandler() {
    this.crypt = new AesCrypt();
  }

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localTempCachePath async {
    final Directory directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<String> storeFile(
      {@required String onlineUriString,
      @required String theFileName,
      @required String theEncryptionKey}) async {
    String theEncryptedFileName = "$theFileName.aes";
    return storeOnlineFileIntoCache(
            onlineUriString: onlineUriString, temporaryName: theFileName)
        .then((File temporaryCacheFile) => encryptFile(
            cacheFile: temporaryCacheFile,
            theEncryptedFileName: theEncryptedFileName,
            theEncryptionKey: theEncryptionKey));
  }

  Future<File> storeOnlineFileIntoCache(
      {@required String onlineUriString,
      @required String temporaryName}) async {

    Dio temp;
    String cacheFileName;
    Uri onlineUri;

    return _localTempCachePath.then((String theCachePath){
       temp = new Dio();
       cacheFileName = "$theCachePath/$temporaryName";
       onlineUri = Uri.parse(onlineUriString);
    }).then((_)=> temp.downloadUri(onlineUri, cacheFileName)).then((_){
      File cacheFile = File(cacheFileName);
      return cacheFile;
    });
  }

  Future<String> encryptFile(
      {@required File cacheFile,
      @required String theEncryptedFileName,
      @required String theEncryptionKey}) async {

    String cacheFilePath;
    String encryptedFilePath;

    return _localPath.then((String localPath){
      cacheFilePath = cacheFile.path;
      encryptedFilePath = "$localPath/$theEncryptedFileName";
      crypt.setPassword(theEncryptionKey);
      crypt.setOverwriteMode(AesCryptOwMode.on);
    }).then((_)=> crypt.encryptFileSync(cacheFilePath, encryptedFilePath)).then((String toReturnString ){
      cacheFile.delete();
      return toReturnString;
    });
  }

  Future<String> decryptFile(
      {@required String theEncryptedFilePath,
      @required String theDecryptedFileName,
      @required String theEncryptionKey}) async {

    String decryptionFilePath;
    return _localTempCachePath.then((String theCachePath)async{
      decryptionFilePath = "$theCachePath/$theDecryptedFileName";
      crypt.setPassword(theEncryptionKey);
      crypt.setOverwriteMode(AesCryptOwMode.on);
      return crypt.decryptFileSync(theEncryptedFilePath, decryptionFilePath);
    });
  }

  void deleteFile({@required String theFilePath}) {
    Uri uriFile = Uri.parse(theFilePath);
    File toDeleteFile = File.fromUri(uriFile);
    toDeleteFile.delete();
  }

  Future<bool> isTheFileExist(String theFilePath) async {
    if (theFilePath == null) return false;
    return await File(theFilePath).exists();
  }
}
