# Generated by Django 4.2.1 on 2023-08-24 04:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nvsapp', '0085_alter_lbryissuebook_bookid'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='lbryaddbooks',
            new_name='LibraryAddBook',
        ),
        migrations.RenameModel(
            old_name='lbryissuebook',
            new_name='LibraryIssueBook',
        ),
    ]
