# Generated by Django 4.2.1 on 2023-08-26 12:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0090_challandetails_servicefees_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='FeesMaster',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('classid', models.CharField(default='', max_length=200)),
                ('feesterm', models.IntegerField(default=0)),
                ('category', models.CharField(default='', max_length=200)),
                ('feestemplate', models.CharField(default='', max_length=200)),
                ('fees', models.FloatField()),
                ('createdon', models.CharField(default='', max_length=50)),
                ('updatedby', models.CharField(default='', max_length=100)),
                ('upadatedon', models.CharField(default='', max_length=50)),
                ('deletedby', models.CharField(default='', max_length=100)),
                ('deletedon', models.CharField(default='', max_length=50)),
                ('softdelete', models.IntegerField(default=0)),
                ('academicyearid', models.IntegerField(default=1)),
                ('createdby', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='nvsapp.userregister')),
                ('instituteid', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='nvsapp.institutionprofile')),
            ],
        ),
        migrations.AlterField(
            model_name='challandetails',
            name='feestypeid',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='cdfeesheadid', to='nvsapp.feesmaster'),
        ),
        migrations.DeleteModel(
            name='MstFeesType',
        ),
    ]