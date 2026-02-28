import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Classe utilitária para manipulação e formatação de datas
class DateUtilsCustom {
  /// Formata um TimeOfDay no padrão "hh:mm"
  static String formatTime(dynamic time) {
    if (time is TimeOfDay) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      return "$hour:$minute";
    } else if (time is String) {
      final regex = RegExp(r'^\d{2}:\d{2}:\d{2}$');

      if (regex.hasMatch(time)) {
        final parts = time.split(':');
        final hour = parts[0];
        final minute = parts[1];
        return "$hour:$minute";
      }

      // Qualquer outro formato
      return "00:00";
    }

    return time.toString();
  }

  /// Formata horário para o padrão "00h00"
  static String formatTimeToHourMinute(dynamic time) {
    int hour = 0;
    int minute = 0;

    if (time is TimeOfDay) {
      hour = time.hour;
      minute = time.minute;
    } else if (time is DateTime) {
      hour = time.hour;
      minute = time.minute;
    } else if (time is String) {
      // Aceita "HH:mm" ou "HH:mm:ss"
      final parts = time.split(':');
      if (parts.length >= 2) {
        hour = int.tryParse(parts[0]) ?? 0;
        minute = int.tryParse(parts[1]) ?? 0;
      }
    } else {
      return time.toString();
    }

    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');

    return "${h}h$m";
  }

  /// Formata um TimeOfDay no padrão "hh:mm:ss"
  static String formatTimeWithSeconds(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute:00"; // Sem segundos reais
  }

  // Formata a data no padrão personalizado "dia, Mês, ano" (ex: 16, Julho, 2025)
  static String formatDateCustom(DateTime date) {
    // Lista de nomes dos meses em português
    const List<String> months = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];
    // Retorna a data formatada como "dia, Mês, ano"
    return '${date.day}, ${months[date.month - 1]}, ${date.year}';
  }

  // Formata a data no padrão "dd/MM/yyyy" (ex: 16/07/2025)
  static String formatDateDDMMYYYY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Formata a data no padrão "yyyy-MM-dd" (ex: 2025-07-16)
  static String formatDateYYYYMMDD(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Formata a hora no padrão "HH:mm:ss" (ex: 16:00:00)
  static String formatTimeHHMMSS(DateTime date) {
    return DateFormat('HH:mm:ss').format(date);
  }

  // Formata a hora no padrão "HH:mm:ss" (ex: 16:00)
  static String toHHMM(String time) {
    return time.substring(0, 5);
  }

  // Formata a data e hora no padrão "dd/MM/yyyy HH:mm" (ex: 16/07/2025 17:28 am)
  static String formatDateTimeDDMMYYYYHHMMa(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm a').format(date);
  }

  // Formata a data no padrão "dd MMM yyyy" (ex: 16 Jul 2025)
  static String formatDateShortMonth(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  // Formata a data e hora no padrão "dd MMMM yyyy, HH:mm" (ex: 16 July 2025, 17:28)
  static String formatDateFullMonthWithTime(DateTime date) {
    return DateFormat('dd MMMM yyyy, HH:mm').format(date);
  }


  // Permite escolher o formato via parâmetro, com 'custom' como padrão
  static String getFormattedCurrentDate({String format = 'custom'}) {
    final DateTime now = DateTime.now();
    switch (format) {
      case 'custom':
        return formatDateCustom(now); // Ex: 16, Julho, 2025
      case 'ddMMyyyy':
        return formatDateDDMMYYYY(now); // Ex: 16/07/2025
      case 'yyyyMMdd':
        return formatDateYYYYMMDD(now); // Ex: 2025-07-16
      case 'ddMMyyyyHHmm':
        return formatDateTimeDDMMYYYYHHMMa(now); // Ex: 16/07/2025 17:28
      case 'shortMonth':
        return formatDateShortMonth(now); // Ex: 16 Jul 2025
      case 'fullMonthWithTime':
        return formatDateFullMonthWithTime(now); // Ex: 16 July 2025, 17:28
      default:
        return formatDateCustom(now); // Padrão: 16, Julho, 2025
    }
  }
}
