# Generated by Django 4.2.1 on 2023-09-14 17:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0099_rename_bookreturndate_libraryissuebook_actualreturndate_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='accounthead',
            name='instituteid',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='nvsapp.institutionprofile'),
        ),
    ]
