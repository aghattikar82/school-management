# Generated by Django 4.2.1 on 2023-06-20 07:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0048_alter_mstdesignation_designationname'),
    ]

    operations = [
        migrations.RenameField(
            model_name='studentattendance',
            old_name='Staffid',
            new_name='staffid',
        ),
    ]