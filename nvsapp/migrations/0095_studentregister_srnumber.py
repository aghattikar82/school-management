# Generated by Django 4.2.1 on 2023-08-29 16:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0094_alter_studentregister_rollno_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentregister',
            name='srnumber',
            field=models.CharField(default='', max_length=15),
        ),
    ]