# Generated by Django 4.2.1 on 2023-06-17 13:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0034_alter_managementmembers_createdby'),
    ]

    operations = [
        migrations.AlterField(
            model_name='managementmembers',
            name='deletedby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='managementmembers',
            name='deletedon',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='managementmembers',
            name='upadated',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='managementmembers',
            name='updatedby',
            field=models.CharField(default='', max_length=100),
        ),
    ]
