# Generated by Django 4.2.1 on 2023-08-30 13:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0095_studentregister_srnumber'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='accounthead',
            name='instituteid',
        ),
    ]