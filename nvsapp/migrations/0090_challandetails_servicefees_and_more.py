# Generated by Django 4.2.1 on 2023-08-24 07:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0089_alter_libraryissuebook_academicyearid'),
    ]

    operations = [
        migrations.AddField(
            model_name='challandetails',
            name='servicefees',
            field=models.FloatField(default=0),
        ),
        migrations.AddField(
            model_name='challandetails',
            name='totalamounttopay',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='challandetails',
            name='amounttopay',
            field=models.FloatField(default=0),
        ),
    ]
