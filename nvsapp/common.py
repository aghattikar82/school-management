from django.shortcuts import render,redirect
import datetime
from django.http import JsonResponse
from django.http import HttpResponse
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from nvsapp.models import * 
from random import randrange
from django.db.models import Sum,Count
from django.core.paginator import Paginator
import requests
import json
currentdate=datetime.datetime.now().strftime("%Y-%m-%d")
maxdata=3
indiandate=datetime.datetime.now().strftime("%d-%m-%Y")
finalexampassingmarks=35
midtempassingmarks=20
iapassingmarks=10
servicefees=20