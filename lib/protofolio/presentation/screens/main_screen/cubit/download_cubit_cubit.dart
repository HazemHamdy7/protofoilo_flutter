import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'download_cubit_state.dart';
 
class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit() : super(DownloadInitial());

  Future<void> downloadCV() async {
    const String cvUrl = 'https://example.com/your_cv.pdf'; // رابط السيرة الذاتية
    final Dio dio = Dio();

    // طلب إذن التخزين
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      emit(DownloadError('Storage permission is required.'));
      return;
    }

    // تحديد موقع الحفظ
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
      String newPath = '';
      List<String> paths = directory!.path.split('/');
      for (int x = 1; x < paths.length; x++) {
        String folder = paths[x];
        if (folder != 'Android') {
          newPath += '/$folder';
        } else {
          break;
        }
      }
      newPath = '$newPath/Downloads';
      directory = Directory(newPath);
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final filePath = '${directory.path}/Your_CV.pdf';

    emit(DownloadInProgress(0.0)); // بدء التحميل

    try {
      await dio.download(
        cvUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            emit(DownloadInProgress(received / total)); // تحديث النسبة
          }
        },
      );

      emit(DownloadSuccess(filePath)); // النجاح مع مسار الملف
    } catch (e) {
      emit(DownloadError('Failed to download: $e')); // خطأ في التحميل
    }
  }
}
