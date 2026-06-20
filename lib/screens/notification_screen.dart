import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Roket SpaceX berhasil mendarat',
        'subtitle': 'Misi Falcon 9 berhasil kembali ke bumi',
        'time': '2 jam lalu',
        'icon': 'rocket',
      },
      {
        'title': 'NASA umumkan misi baru ke Mars',
        'subtitle': 'Program Artemis diperluas hingga Mars',
        'time': '5 jam lalu',
        'icon': 'star',
      },
      {
        'title': 'Teleskop James Webb temukan galaksi baru',
        'subtitle': 'Galaksi tertua yang pernah ditemukan manusia',
        'time': '1 hari lalu',
        'icon': 'telescope',
      },
      {
        'title': 'ISS terima kru astronot baru',
        'subtitle': '4 astronot tiba di stasiun luar angkasa',
        'time': '2 hari lalu',
        'icon': 'satellite',
      },
      {
        'title': 'Satelit cuaca baru diluncurkan',
        'subtitle': 'Pemantauan cuaca global semakin akurat',
        'time': '3 hari lalu',
        'icon': 'cloud',
      },
      {
        'title': 'China luncurkan misi ke bulan',
        'subtitle': 'Chang\'e 7 dijadwalkan mendarat di kutub selatan',
        'time': '4 hari lalu',
        'icon': 'moon',
      },
    ];

    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.deepPurple.shade100,
              child: const Icon(
                Icons.notifications,
                color: Colors.deepPurple,
                size: 24,
              ),
            ),
            title: Text(
              notif['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  notif['subtitle'] ?? '',
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  notif['time'] ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
