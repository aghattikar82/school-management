# Generated by Django 4.2.1 on 2023-06-08 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0013_languagemapping_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='institutionprofile',
            name='createdby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='createdon',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='deletedby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='deletedon',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='institutecode',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='upadated',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='institutionprofile',
            name='updatedby',
            field=models.CharField(default='', max_length=100),
        ),
    ]