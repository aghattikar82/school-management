# Generated by Django 4.2.1 on 2023-06-02 08:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0007_rename_academymaster_academicmaster'),
    ]

    operations = [
        migrations.CreateModel(
            name='FeesType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('classes', models.CharField(max_length=200)),
                ('caste', models.CharField(max_length=200)),
                ('feetype', models.CharField(max_length=200)),
                ('feestype', models.CharField(max_length=200)),
                ('fees', models.CharField(max_length=200)),
                ('instituteid', models.CharField(default='', max_length=100)),
                ('createdby', models.CharField(default='', max_length=100)),
                ('createdon', models.CharField(default='', max_length=50)),
                ('updatedby', models.CharField(default='', max_length=100)),
                ('upadatedon', models.CharField(default='', max_length=50)),
                ('deletedby', models.CharField(default='', max_length=100)),
                ('deletedon', models.CharField(default='', max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
            ],
        ),
    ]
