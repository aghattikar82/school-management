# Generated by Django 4.2.1 on 2023-08-29 13:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0093_alter_feesmaster_academicyearid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentregister',
            name='rollno',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='studentregister',
            name='studentid',
            field=models.CharField(default='', max_length=15),
        ),
    ]
