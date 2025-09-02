import 'package:flutter/material.dart';

class AppPallete {
  //? Example
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  
  //* 1. Main COLORS
  // Warna utama yang mendefinisikan identitas visual aplikasi.
  static const Color primary = Color.fromRGBO(56, 142, 60, 1);
  static const Color secondary = Color.fromRGBO(193, 220, 195, 1);

  //* 2. TEXT COLORS
  // Warna yang digunakan secara spesifik untuk elemen teks.
  static const Color textPrimary = Color.fromRGBO(51, 51, 51, 1);
  static const Color textSecondary = Color.fromRGBO(102, 102, 102, 1);
  
  //* 3. SEMANTIC COLORS
  // Warna yang memberikan makna atau status tertentu (sukses, peringatan, error).
  static const Color semanticRed = Color.fromRGBO(234, 67, 53, 1);
  static const Color semanticYellow = Color.fromRGBO(255, 204, 61, 1);
  static const Color semanticGreen = Color.fromRGBO(109, 196, 73, 1);

  //* 4. BASE COLORS
  // Warna netral fundamental untuk latar belakang, border, dll.
  static const Color baseWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color baseBlack = Color.fromRGBO(0, 0, 0, 1);
  
  //* 5. GREEN PALETTE (Shades & States)
  // Variasi warna hijau untuk berbagai state (hover, active, dll).

  // Light
  static const Color lightGreen = Color.fromRGBO(235, 244, 236, 1);
  static const Color lightGreenHover = Color.fromRGBO(225, 238, 226, 1);
  static const Color lightGreenActive = Color.fromRGBO(193, 220, 195, 1);

  // Normal (sama dengan 'primary')
  static const Color normalGreen = Color.fromRGBO(56, 142, 60, 1);
  static const Color normalGreenHover = Color.fromRGBO(50, 128, 54, 1);
  static const Color normalGreenActive = Color.fromRGBO(45, 114, 48, 1);

  // Dark
  static const Color darkGreen = Color.fromRGBO(42, 107, 45, 1);
  static const Color darkGreenHover = Color.fromRGBO(34, 85, 36, 1);
  static const Color darkGreenActive = Color.fromRGBO(25, 64, 27, 1);

  // Darker
  static const Color darkerGreen = Color.fromRGBO(20, 50, 21, 1);
  
  //* Navbar Icon
  static const Color navbarInactive = Color(0xFFD3D3D3);
}