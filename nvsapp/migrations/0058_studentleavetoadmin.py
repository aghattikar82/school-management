# Generated by Django 4.2.1 on 2023-07-05 03:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0057_studentleave'),
    ]

    operations = [
        migrations.CreateModel(
            name='StudentLeaveToAdmin',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subject', models.CharField(default='', max_length=1000)),
                ('leavedate', models.CharField(max_length=20)),
                ('end_date', models.CharField(max_length=100)),
                ('text', models.CharField(max_length=10000)),
                ('classid', models.CharField(default='', max_length=100)),
                ('sectionsid', models.CharField(default='', max_length=100)),
                ('createdon', models.CharField(default='', max_length=50)),
                ('leavestatus', models.CharField(default='PENDING', max_length=50)),
                ('updatedby', models.CharField(default='', max_length=100)),
                ('upadatedon', models.CharField(default='', max_length=50)),
                ('deletedby', models.CharField(default='', max_length=100)),
                ('deletedon', models.CharField(default='', max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
                ('academicyearid', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='nvsapp.academicmaster')),
                ('createdby', models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='sltaid', to='nvsapp.studentregister')),
                ('instituteid', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='nvsapp.institutionprofile')),
            ],
        ),
    ]