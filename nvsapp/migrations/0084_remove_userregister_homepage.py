# Generated by Django 4.2.1 on 2023-08-24 02:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0083_mstdesignation_homepage'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userregister',
            name='homepage',
        ),
    ]
