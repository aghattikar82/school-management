# Generated by Django 4.2.1 on 2023-06-11 11:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0019_studentselectedsubject_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='mstsubject',
            name='optional',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AddField(
            model_name='mstsubject',
            name='subjectcategory',
            field=models.CharField(default='', max_length=200),
        ),
        migrations.AddField(
            model_name='mstsubject',
            name='subjecttype',
            field=models.CharField(default='', max_length=200),
        ),
    ]
