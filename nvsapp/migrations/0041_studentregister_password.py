# Generated by Django 4.2.1 on 2023-06-18 03:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0040_remove_studentregister_password'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentregister',
            name='password',
            field=models.CharField(default='123456', max_length=100),
        ),
    ]