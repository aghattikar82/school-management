# Generated by Django 4.2.1 on 2023-08-08 14:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0066_alter_tempinstitutefeesdetails_instituteid_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='tempinstitutefeesdetails',
            name='detailstype',
            field=models.CharField(default='', max_length=1000),
        ),
        migrations.AddField(
            model_name='tempinstitutefeesdetails',
            name='fromdate',
            field=models.CharField(default='', max_length=1000),
        ),
        migrations.AddField(
            model_name='tempinstitutefeesdetails',
            name='todate',
            field=models.CharField(default='', max_length=1000),
        ),
    ]
