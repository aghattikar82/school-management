# Generated by Django 4.2.1 on 2023-06-16 08:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0028_expensehead'),
    ]

    operations = [
        migrations.CreateModel(
            name='MstFeedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedback', models.CharField(max_length=200)),
                ('createdby', models.CharField(max_length=100)),
                ('createdon', models.CharField(max_length=50)),
                ('updatedby', models.CharField(max_length=100)),
                ('upadatedon', models.CharField(max_length=50)),
                ('deletedby', models.CharField(max_length=100)),
                ('deletedon', models.CharField(max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
            ],
        ),
        migrations.RenameField(
            model_name='academicmaster',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='addclass',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='addsection',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='calender',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='classwork',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='logindetails',
            old_name='institutionid',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='message',
            old_name='institutedId',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='studentregister',
            old_name='institutionid',
            new_name='instituteid',
        ),
        migrations.RenameField(
            model_name='userregister',
            old_name='institutionid',
            new_name='instituteid',
        ),
        migrations.RemoveField(
            model_name='homework',
            name='institutedId',
        ),
        migrations.AddField(
            model_name='classwork',
            name='subjects',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='homework',
            name='instituteid',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='homework',
            name='subjects',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='noticecircular',
            name='image',
            field=models.CharField(default='onimage.png', max_length=225),
        ),
        migrations.AlterField(
            model_name='homework',
            name='deletedon',
            field=models.CharField(default='00-00-000', max_length=50),
        ),
    ]
