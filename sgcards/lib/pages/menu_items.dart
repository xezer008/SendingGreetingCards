import 'package:sgcards/pages/contacts_page.dart';
import 'package:sgcards/pages/groups_page.dart';
import 'package:sgcards/pages/home_page.dart';
import 'package:sgcards/pages/menu_details.dart';
import 'package:flutter/material.dart';
import 'package:sgcards/pages/settings_page.dart';

class MenuItems {
  List<MenuDetails> items = [
    MenuDetails(title: "Ana Sehife", icon: Icons.home, page: const HomePage()),
    MenuDetails(
        title: "Kontaklar", icon: Icons.person, page: const ContactsPage()),
    MenuDetails(title: "Qruplar", icon: Icons.group, page: const GroupsPage()),
    MenuDetails(
        title: "Ayarlar", icon: Icons.settings, page: const SettingPage()),
  ];
}
