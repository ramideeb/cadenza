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

    File temporaryCacheFile = await storeOnlineFileIntoCache(
        onlineUriString: onlineUriString, temporaryName: theFileName);

    return encryptFile(
        cacheFile: temporaryCacheFile,
        theEncryptedFileName: theEncryptedFileName,
        theEncryptionKey: theEncryptionKey);
  }

  Future<File> storeOnlineFileIntoCache(
      {@required String onlineUriString,
      @required String temporaryName}) async {

    String theCachePath = await _localTempCachePath;
    Dio temp = new Dio();
    String cacheFileName = "$theCachePath/$temporaryName";
    Uri onlineUri = Uri.parse(onlineUriString);

    await temp.downloadUri(onlineUri, cacheFileName);
    File cacheFile = File(cacheFileName);
    return cacheFile;

  }

  Future<String> encryptFile(
      {@required File cacheFile,
      @required String theEncryptedFileName,
      @required String theEncryptionKey}) async {
    String localPath = await _localPath;
    String cacheFilePath = cacheFile.path;
    String encryptedFilePath = "$localPath/$theEncryptedFileName";

    crypt.setPassword(theEncryptionKey);
    crypt.setOverwriteMode(AesCryptOwMode.on);
    String toReturnString = await crypt.encryptFile(cacheFilePath, encryptedFilePath);
    cacheFile.delete();

    return toReturnString;
  }

  Future<String> decryptFile(
      {@required String theEncryptedFilePath,
      @required String theDecryptedFileName,
      @required String theEncryptionKey}) async {
    String theCachePath = await _localTempCachePath;
    String decryptionFilePath = "$theCachePath/$theDecryptedFileName";
    crypt.setPassword(theEncryptionKey);

    return crypt.decryptFile(theEncryptedFilePath, decryptionFilePath);
  }

  void deleteTheEncryptedFile({@required String theEncryptedFilePath}) {
    Uri uriFile = Uri.parse(theEncryptedFilePath);
    File toDeleteFile = File.fromUri(uriFile);
    toDeleteFile.delete();

  }

  Future<bool> isTheFileExist(String theFilePath) async {
    if (theFilePath == null) return false;
    return await File(theFilePath).exists();
  }
}
