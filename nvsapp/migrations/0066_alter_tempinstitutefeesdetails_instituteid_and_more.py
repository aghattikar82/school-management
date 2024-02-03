# Generated by Django 4.2.1 on 2023-08-08 12:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0065_tempinstitutefeesdetails'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tempinstitutefeesdetails',
            name='instituteid',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='tempinstitutefeesdetails',
            name='pendingamount',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='tempinstitutefeesdetails',
            name='totalcollected',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='tempinstitutefeesdetails',
            name='totalcollection',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='tempinstitutefeesdetails',
            name='totaldiscount',
            field=models.FloatField(default=0),
        ),
    ]