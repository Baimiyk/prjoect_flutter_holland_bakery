import 'package:flutter/material.dart';

class MembershipCard extends StatelessWidget {
  final String membershipLevel;
  final String points;
  final VoidCallback? onMembershipTap;
  final VoidCallback? onCouponTap;

  const MembershipCard({
    super.key,
    required this.membershipLevel,
    required this.points,
    this.onMembershipTap,
    this.onCouponTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Membership Section
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: onMembershipTap ?? () {},
                    child: Row(
                      children: [
                        const Icon(Icons.stars, color: Colors.green),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              membershipLevel,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              points,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFFFF5621),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Divider
              Container(
                width: 3,
                height: 30,
                color: Colors.grey.shade500,
              ),

              // Gift Coupon Section
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: onCouponTap ?? () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Gift Coupon",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}