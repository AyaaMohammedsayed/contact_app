import 'package:contact_app/app_theme.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactView extends StatefulWidget {
  final ContactModel model;
  final VoidCallback onDelete;
  ContactView({required this.model, required this.onDelete});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: widget.model.image != null
                ? Image.file(
                    widget.model.image!,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/image_profile.png',
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.beige,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.model.name,
                style: textTheme.titleMedium!.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Positioned(
            
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.beige,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/email.svg'),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          widget.model.email,
                          style: textTheme.titleSmall!.copyWith(
                            color: AppTheme.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/Phone_call.svg'),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          widget.model.phone,
                          style: textTheme.titleSmall!.copyWith(
                            color: AppTheme.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.red,
                      foregroundColor: AppTheme.semiWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                                   onPressed: () {
                      print("Delete button pressed for ${widget.model.name}"); 
                      widget.onDelete(); 
                    },
                   child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/delete.svg'),
                    Text(
                      'Delete',
                      style: textTheme.labelSmall!.copyWith(
                        color: AppTheme.semiWhite,
                        fontSize: 16,
                      ),
                    ),
                    ],
                   ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
