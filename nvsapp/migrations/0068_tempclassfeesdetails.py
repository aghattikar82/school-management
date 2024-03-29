# Generated by Django 4.2.1 on 2023-08-08 14:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0067_tempinstitutefeesdetails_detailstype_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='TempClassFeesDetails',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('instituteid', models.IntegerField(default=0)),
                ('institutename', models.CharField(default='', max_length=1000)),
                ('classname', models.CharField(default='', max_length=1000)),
                ('classid', models.CharField(default='', max_length=1000)),
                ('totalcollection', models.FloatField(default=0)),
                ('totalcollected', models.FloatField(default=0)),
                ('totaldiscount', models.FloatField(default=0)),
                ('pendingamount', models.FloatField(default=0)),
                ('fromdate', models.CharField(default='', max_length=1000)),
                ('todate', models.CharField(default='', max_length=1000)),
                ('detailstype', models.CharField(default='', max_length=1000)),
            ],
        ),
    ]
