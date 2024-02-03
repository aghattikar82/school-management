# Generated by Django 4.2.1 on 2023-06-01 09:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0004_accounthead_castes'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userregister',
            name='Institutionname',
        ),
        migrations.AddField(
            model_name='userregister',
            name='institutionid',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='createdby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='createdon',
            field=models.CharField(default='00-00-0000', max_length=50),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='deletedby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='deletedon',
            field=models.CharField(default='00-00-0000', max_length=50),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='upadated',
            field=models.CharField(default='00-00-0000', max_length=50),
        ),
        migrations.AlterField(
            model_name='userregister',
            name='updatedby',
            field=models.CharField(default='', max_length=100),
        ),
    ]
