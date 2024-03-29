# Generated by Django 4.2.1 on 2023-06-25 05:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0053_timetableschedule'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='timetableschedule',
            name='subjectstaffmapid',
        ),
        migrations.AddField(
            model_name='timetableschedule',
            name='classid',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='nvsapp.addclass'),
        ),
        migrations.AddField(
            model_name='timetableschedule',
            name='sectionid',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='nvsapp.addsection'),
        ),
    ]
