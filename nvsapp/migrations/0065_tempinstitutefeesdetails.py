# Generated by Django 4.2.1 on 2023-08-08 12:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0064_alter_userregister_emailid_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='TempInstituteFeesDetails',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('institutename', models.CharField(default='', max_length=1000)),
                ('instituteid', models.IntegerField(max_length=50)),
                ('totalcollection', models.FloatField(max_length=50)),
                ('totalcollected', models.FloatField(max_length=50)),
                ('totaldiscount', models.FloatField(max_length=50)),
                ('pendingamount', models.FloatField(max_length=50)),
            ],
        ),
    ]
