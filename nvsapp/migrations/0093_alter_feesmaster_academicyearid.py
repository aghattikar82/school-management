# Generated by Django 4.2.1 on 2023-08-26 13:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0092_alter_feesmaster_classid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feesmaster',
            name='academicyearid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='fmaid', to='nvsapp.academicmaster'),
        ),
    ]
