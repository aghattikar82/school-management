# Generated by Django 4.2.1 on 2023-06-08 08:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0009_mstfeestype_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='CasteOperator',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('castes', models.CharField(max_length=100)),
                ('selectreligion', models.CharField(max_length=100)),
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
        migrations.CreateModel(
            name='MstSubject',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subjectname', models.CharField(max_length=200)),
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
        migrations.CreateModel(
            name='Religion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('religion', models.CharField(max_length=100)),
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
        migrations.CreateModel(
            name='subcaste',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subcaste', models.CharField(max_length=100)),
                ('Category', models.CharField(max_length=100)),
                ('selectreligion', models.CharField(max_length=100)),
                ('selectcastes', models.CharField(max_length=100)),
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
        migrations.CreateModel(
            name='SubjectStaffClassMapping',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('staff', models.CharField(default='', max_length=200)),
                ('subject', models.CharField(default='', max_length=200)),
                ('mclass', models.CharField(default='', max_length=200)),
                ('section', models.CharField(default='', max_length=200)),
                ('instituteid', models.CharField(default='', max_length=100)),
                ('createdby', models.CharField(default='', max_length=100)),
                ('createdon', models.CharField(default='', max_length=50)),
                ('updatedby', models.CharField(default='', max_length=100)),
                ('upadatedon', models.CharField(default='', max_length=50)),
                ('deletedby', models.CharField(default='', max_length=100)),
                ('deletedon', models.CharField(default='', max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
                ('academicyearid', models.IntegerField(default=1)),
            ],
        ),
        migrations.DeleteModel(
            name='FeesType',
        ),
        migrations.AddField(
            model_name='calender',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='classwork',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='homework',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='message',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='mstfeestype',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='academicyearid',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='createdby',
            field=models.CharField(default='admin', max_length=100),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='createdon',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='deletedby',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='deletedon',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='softdelete',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='upadatedon',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='studentregister',
            name='updatedby',
            field=models.CharField(default='', max_length=100),
        ),
    ]