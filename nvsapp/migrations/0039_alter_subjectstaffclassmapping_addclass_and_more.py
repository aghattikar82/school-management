# Generated by Django 4.2.1 on 2023-06-18 00:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0038_alter_subjectstaffclassmapping_addclass'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='Addclass',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='cls', to='nvsapp.addclass'),
        ),
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='academicyearid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='ayr', to='nvsapp.academicmaster'),
        ),
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='createdby',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='cby', to='nvsapp.userregister'),
        ),
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='instituteid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='inst', to='nvsapp.institutionprofile'),
        ),
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='section',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='sec', to='nvsapp.addsection'),
        ),
        migrations.AlterField(
            model_name='subjectstaffclassmapping',
            name='subject',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='sub', to='nvsapp.mstsubject'),
        ),
    ]
