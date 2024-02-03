# Generated by Django 4.2.1 on 2023-06-11 10:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0018_rename_instituteid_studentregister_institutionid'),
    ]

    operations = [
        migrations.CreateModel(
            name='StudentSelectedSubject',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('classid', models.IntegerField()),
                ('sectionid', models.IntegerField()),
                ('studentid', models.IntegerField()),
                ('subjectid', models.IntegerField()),
                ('subjecttype', models.IntegerField()),
                ('academicyearid', models.IntegerField()),
                ('instituteid', models.IntegerField()),
            ],
        ),
        migrations.RenameField(
            model_name='subjectstaffclassmapping',
            old_name='staff',
            new_name='staffid',
        ),
        migrations.RemoveField(
            model_name='studentregister',
            name='Subject',
        ),
        migrations.RemoveField(
            model_name='studentregister',
            name='language',
        ),
        migrations.AlterField(
            model_name='studentregister',
            name='institutionid',
            field=models.CharField(default='', max_length=100),
        ),
    ]
