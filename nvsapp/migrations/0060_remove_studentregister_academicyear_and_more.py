# Generated by Django 4.2.1 on 2023-07-05 03:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0059_alter_studentleave_classid_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='studentregister',
            name='academicyear',
        ),
        migrations.AlterField(
            model_name='studentregister',
            name='academicyearid',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='academicid', to='nvsapp.academicmaster'),
        ),
    ]
