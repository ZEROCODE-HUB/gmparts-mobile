import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final double size;

  const UserAvatarWidget({super.key, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) {
        final photo = currentUserPhoto;
        final name = currentUserDisplayName;
        return Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: (photo.isNotEmpty)
              ? Image.network(
                  photo,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildInitials(name),
                )
              : _buildInitials(name),
        );
      },
    );
  }

  Widget _buildInitials(String name) {
    return CircleAvatar(
      backgroundColor: Color(0xFFE94560),
      child: Text(
        (name.isNotEmpty ? name[0] : '?').toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size * 0.45,
        ),
      ),
    );
  }
}
