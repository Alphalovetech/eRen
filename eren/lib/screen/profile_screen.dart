import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
      child: Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
    );
  }

  Widget _tile(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // cover + avatar area
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/cover.jpg'), // replace with your cover asset
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 80,
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundImage: const AssetImage('assets/images/avatar.jpg'), // replace with avatar asset
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 46), // space to account for overlapping avatar
              // name, location, edit icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Wade Warren', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black)),
                        const SizedBox(height: 6),
                        Text('Los Angeles, California, United States', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: primary),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // settings card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Account Setting
                      const SizedBox(height: 8),
                      _sectionHeader('Account Setting'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                      _tile(context, Icons.person_outline, 'Personal Information'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                      _tile(context, Icons.account_circle_outlined, 'My Account'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),

                      // Payment
                      _sectionHeader('Payment'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                      _tile(context, Icons.credit_card, 'Payment Method'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),

                      // Setting & Security
                      _sectionHeader('Setting & Security'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                      _tile(context, Icons.lock_outline, 'Change Password'),
                      Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                      _tile(context, Icons.notifications_none, 'Notification Preference'),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28), // bottom spacing for nav
            ],
          ),
        ),
      ),
    );
  }
}
