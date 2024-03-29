# Generated by Django 4.2.1 on 2023-06-24 09:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0052_rename_createdby_id_leavestaff_createdby'),
    ]

    operations = [
        migrations.CreateModel(
            name='TimeTableSchedule',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('createdon', models.CharField(max_length=50)),
                ('updatedby', models.CharField(max_length=100)),
                ('upadatedon', models.CharField(max_length=50)),
                ('deletedby', models.CharField(max_length=100)),
                ('deletedon', models.CharField(max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
                ('academicyearid', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='aid', to='nvsapp.academicmaster')),
                ('createdby', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='ur', to='nvsapp.userregister')),
                ('fp1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp1', to='nvsapp.subjectstaffclassmapping')),
                ('fp2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp2', to='nvsapp.subjectstaffclassmapping')),
                ('fp3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp3', to='nvsapp.subjectstaffclassmapping')),
                ('fp4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp4', to='nvsapp.subjectstaffclassmapping')),
                ('fp5', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp5', to='nvsapp.subjectstaffclassmapping')),
                ('fp6', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp6', to='nvsapp.subjectstaffclassmapping')),
                ('fp7', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='fp7', to='nvsapp.subjectstaffclassmapping')),
                ('instituteid', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='iid', to='nvsapp.institutionprofile')),
                ('mp1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp1', to='nvsapp.subjectstaffclassmapping')),
                ('mp2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp2', to='nvsapp.subjectstaffclassmapping')),
                ('mp3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp3', to='nvsapp.subjectstaffclassmapping')),
                ('mp4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp4', to='nvsapp.subjectstaffclassmapping')),
                ('mp5', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp5', to='nvsapp.subjectstaffclassmapping')),
                ('mp6', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp6', to='nvsapp.subjectstaffclassmapping')),
                ('mp7', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='mp7', to='nvsapp.subjectstaffclassmapping')),
                ('sap1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sap1', to='nvsapp.subjectstaffclassmapping')),
                ('sap2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sap2', to='nvsapp.subjectstaffclassmapping')),
                ('sap3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sap3', to='nvsapp.subjectstaffclassmapping')),
                ('sap4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sap4', to='nvsapp.subjectstaffclassmapping')),
                ('subjectstaffmapid', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sid', to='nvsapp.subjectstaffclassmapping')),
                ('thp1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp1', to='nvsapp.subjectstaffclassmapping')),
                ('thp2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp2', to='nvsapp.subjectstaffclassmapping')),
                ('thp3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp3', to='nvsapp.subjectstaffclassmapping')),
                ('thp4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp4', to='nvsapp.subjectstaffclassmapping')),
                ('thp5', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp5', to='nvsapp.subjectstaffclassmapping')),
                ('thp6', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp6', to='nvsapp.subjectstaffclassmapping')),
                ('thp7', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='thp7', to='nvsapp.subjectstaffclassmapping')),
                ('tup1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup1', to='nvsapp.subjectstaffclassmapping')),
                ('tup2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup2', to='nvsapp.subjectstaffclassmapping')),
                ('tup3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup3', to='nvsapp.subjectstaffclassmapping')),
                ('tup4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup4', to='nvsapp.subjectstaffclassmapping')),
                ('tup5', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup5', to='nvsapp.subjectstaffclassmapping')),
                ('tup6', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup6', to='nvsapp.subjectstaffclassmapping')),
                ('tup7', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='tup7', to='nvsapp.subjectstaffclassmapping')),
                ('wp1', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp1', to='nvsapp.subjectstaffclassmapping')),
                ('wp2', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp2', to='nvsapp.subjectstaffclassmapping')),
                ('wp3', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp3', to='nvsapp.subjectstaffclassmapping')),
                ('wp4', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp4', to='nvsapp.subjectstaffclassmapping')),
                ('wp5', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp5', to='nvsapp.subjectstaffclassmapping')),
                ('wp6', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp6', to='nvsapp.subjectstaffclassmapping')),
                ('wp7', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, related_name='wp7', to='nvsapp.subjectstaffclassmapping')),
            ],
        ),
    ]
