from nvsapp.common import * 

def accountantheads(request):
    msg=""
    if request.method=="POST":
        hd=AccountHead()
        hd.head=request.POST["head"]
        hd.select_liabilities=request.POST["select_liabilities"]
        hd.instituteid=request.session["instituteid"];
        hd.save()
        msg="Accounts Head Added Successfully"
    return render(request,"accountant/accountantheads.html",{"msg":msg} )



def accountanthome(request):
    challancreated=ChallanDetails.objects.filter(instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    pendingpayments=ChallanDetails.objects.filter(paymentstatus="NEW",instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    completedpayments=ChallanDetails.objects.filter(paymentstatus="PAID",instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    challansrejected=ChallanDetails.objects.filter(paymentstatus="REJECTED",instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    
    return render(request,"accountant/accountanthome.html",{"challancreated":challancreated,"pendingpayments":pendingpayments,"completedpayments":completedpayments,"challansrejected":challansrejected})

def mstfeeshead(request):
    msg=""
    classdata=""
    if request.method=="POST":
        if MstFeesHead.objects.filter(classid_id=request.POST["select_class"],feeshead=request.POST["fees"],amount=request.POST["amount"],createdby_id=request.session["userid"],instituteid_id=request.session["instituteid"]).exists():
            msg="Fees Head Master Already Exists"
        else:
            fm=MstFeesHead()
            fm.classid_id=request.POST["select_class"]
            fm.feeshead=request.POST["fees"]
            fm.amount=request.POST["amount"]
            fm.createdby_id=request.session["userid"]
            fm.instituteid_id=request.session["instituteid"]
            fm.academicyearid_id=request.session["academicyearid"]
            fm.save()
            msg="Fees Master Added"
    classdata=Addclass.objects.filter(softdelete=0)
    return render(request,"accountant/mstfeeshead.html",{"msg":msg,"classdata":classdata})

def feesreportinstitutetwise(request):
    institutefeedata=""
    institutedata=""
    institutetotalfees=""
    msg=""
    if request.method == 'POST':
        instituteidsearch = request.POST['txtsearch']
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        if FeesPaidDetails.objects.filter(instituteid_id=instituteidsearch,academicyearid_id=academicyearid,softdelete=0).exists():
            institutefeedata = FeesPaidDetails.objects.filter(instituteid_id=instituteidsearch,academicyearid_id=academicyearid,softdelete=0).values("classid").annotate(dcount=Sum('totalamounttopay'))
            institutetotalfees=FeesPaidDetails.objects.filter(instituteid_id=instituteidsearch,academicyearid_id=academicyearid,softdelete=0).aggregate(Sum("amountpaid"))["amountpaid__sum"]
            print("-----------------------")

            print(institutetotalfees)
    
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"accountant/feesreportinstitutetwise.html",{"institutetotalfees":institutetotalfees,"institutedata":institutedata,"institutefeedata":institutefeedata,"msg":msg})


def feesreportstudentwise(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    feepaiddataamount=0
    challanpaiddataamount=0
    challanpaiddata=0
    if request.method == 'POST':
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        studentid=request.POST.get("txtstudentid","0")
        if ChallanDetails.objects.filter(studentid_id=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            challanpaiddata = ChallanDetails.objects.filter(studentid_id=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
            challanpaiddataamount=ChallanDetails.objects.filter(studentid_id=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(Sum("amounttopay"))["amounttopay__sum"]
        else:
            msg="Student ID Not Found"
    return render(request,"accountant/feesreportstudentwise.html",{"challanpaiddataamount":challanpaiddataamount,"challanpaiddata":challanpaiddata,"msg":msg})





def feesreportclasswise(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    classid=""
    if request.method == 'POST':
        classid = request.POST['txtsearch']
        fromdate=request.POST["fromdate"]
        todate=request.POST["todate"]
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        if StudentRegister.objects.filter(createdon__range=[fromdate,todate],chooseclass=classid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            studentdata = StudentRegister.objects.filter(createdon__range=[fromdate,todate],chooseclass=classid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
        if FeesPaidDetails.objects.filter(createdon__range=[fromdate,todate],chooseclass=classid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            feepaiddata=FeesPaidDetails.objects.filter(createdon__range=[fromdate,todate],chooseclass=classid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
    classdata=Addclass.objects.filter(softdelete=0)
    return render(request,"accountant/feesreportclasswise.html",{"classid":classid,"studentdata":studentdata,"msg":msg,"classdata":classdata,"feepaiddata":feepaiddata})

def feesreportdaywise(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    feepaiddataamount=0
    challanpaiddataamount=0
    challanpaiddata=0
    if request.method == 'POST':
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        fromdate=request.POST["fromdate"]
        todate=request.POST["todate"]
        if ChallanDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            challanpaiddata = ChallanDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
            challanpaiddataamount=ChallanDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(Sum("amounttopay"))["amounttopay__sum"]
        else:
            msg="Fees Not Found"
    return render(request,"accountant/feesreportdaywise.html",{"challanpaiddataamount":challanpaiddataamount,"challanpaiddata":challanpaiddata,"msg":msg})

def feesreport(request):
    msg=""
    feepaiddata=""
    data=""
    Institutiondata=""
    if request.method == 'POST':
        operation=request.POST['txtoperation']
        if operation=="1":
            search = request.POST['txtsearch']
            lastid=request.session['lastid']
            if StudentRegister.objects.filter(id=search).exists():
                data = StudentRegister.objects.filter(id=search)
                msg = ''
                instituteid_id=request.session["instituteid"]
                academicyearid_id=request.session["academicyearid"]
                feepaiddata=FeesPaidDetails.objects.filter(studentid=search,instituteid=instituteid_id,academicyearid=academicyearid_id)
    Institutiondata=InstitutionProfile.objects.filter(id=request.session["instituteid"])
    return render(request,"accountant/feesreport.html",{"Institutiondata":Institutiondata,"msg":msg,"feepaiddata":feepaiddata,"data":data})



def collectfees(request):
    msg=""
    feepaiddata=""
    data=""
    Institutiondata=""
    feesheads=""
    balanceamount=0
    studentfeesdatabalance=""
    lastid=request.session['lastid']
    instituteid_id=request.session["instituteid"]
    academicyearid_id=request.session["academicyearid"]
    sid=request.session["studentid_id"]
    data = StudentRegister.objects.filter(id=sid,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])
    for dd in data:
        if dd.discount!="":
            discountamt=dd.discount
        else:
            discountamt=0
        totalfees=dd.amount
    msg = ''
    if FeesPaidDetails.objects.filter(studentid_id=sid,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).exists():
        studentfeesdata=FeesPaidDetails.objects.filter(studentid_id=sid,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).values('studentid').annotate(total_price=Sum('totalamounttopay')).values("total_price")
        studentfeesdetails=FeesPaidDetails.objects.filter(studentid_id=sid,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])
        amountpaid=studentfeesdata[0]["total_price"]
        balanceamount=float(totalfees)-float(amountpaid)-float(discountamt)
        studentfeesdatabalance1=FeesPaidDetails.objects.filter(studentid_id=sid,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).values('studentid').annotate(total_price=Sum('totalamounttopay')).values("total_price")
        studentfeesdatabalance=studentfeesdata[0]["total_price"]
    feepaiddata=FeesPaidDetails.objects.filter(id=request.session["lastid"],instituteid=instituteid_id,academicyearid=academicyearid_id)
    feesheads=MstFeesHead.objects.filter(instituteid=instituteid_id,academicyearid=academicyearid_id,softdelete=0)
    Institutiondata=InstitutionProfile.objects.filter(id=request.session["instituteid"])
    return render(request,"accountant/collectfees.html",{"studentfeesdatabalance":studentfeesdatabalance,"balanceamount":balanceamount,"feesheads":feesheads,"Institutiondata":Institutiondata,"msg":msg,"feepaiddata":feepaiddata,"data":data})


def feesdetails(request):
    msg = ''
    data = ''
    feesheads=''
    Institutiondata=""
    studentfeesdata=""
    amountpaid=0
    feestypedata=""
    discountamt=0
    totalfees=0
    studentfeesdetails=""
    balanceamount=0
    category=""
    classid=0
    studentinstituteid="0"

    if request.method == 'POST':
        operation=request.POST['txtoperation']
        if operation=="1":
            search = request.POST['txtsearch']
            if StudentRegister.objects.filter(id=search,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).exists():
                data = StudentRegister.objects.filter(id=search,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])
                for dd in data:
                    category=dd.category
                    classid=dd.chooseclass
                    studentinstituteid=dd.instituteid_id
                    if dd.discount!="":
                        discountamt=dd.discount
                    else:
                        discountamt=0
                    totalfees=dd.amount
                msg = ''
                feestypedata=FeesMaster.objects.filter(category=category,classid_id=classid,softdelete=0,instituteid_id=studentinstituteid,academicyearid_id=request.session["academicyearid"])
                if FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).exists():
                    studentfeesdata=FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"]).values('studentid').annotate(total_price=Sum('amountpaid')).values("total_price")
                    studentfeesdetails=FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])
                    amountpaid=studentfeesdata[0]["total_price"]
                    print(totalfees)
                    balanceamount=float(totalfees)-(float(amountpaid)+float(discountamt))
                    print(balanceamount)
                else:
                    amountpaid=0
                    balanceamount=float(totalfees)-(float(amountpaid)+float(discountamt))
                    studentfeesdata=""
                    studentfeesdetails=""
            else:
                msg="Student record not found"

        else:
            return redirect("createchallan")

    return render(request,"accountant/feesdetails.html",{"studentinstituteid":studentinstituteid,"feestypedata":feestypedata,"discountamt":discountamt,"feesheads":feesheads,"studentfeesdetails":studentfeesdetails,"balanceamount":balanceamount,"amountpaid":amountpaid,"totalfees":totalfees,'data':data,'msg': msg,"studentfeesdata":studentfeesdata,"amountpaid":amountpaid})

def createchallan(request):
    sid=request.POST.get("sid","0")
    classid=request.POST.get("classid","0")
    sectionid=request.POST.get("sectionid","0")
    studentname=request.POST.get("studentname","0")
    mobilenumber=request.POST.get("mobilenumber","0")
    amountpaid=request.POST.get("amountpaid","")

    studentinstituteid=request.POST.get("studentinstituteid","")

    cd=ChallanDetails()
    cd.studentid_id=request.POST["sid"]
    cd.classid_id=request.POST['classid']
    cd.feestypeid_id=request.POST['feesmasterid']
    cd.sectionid_id=request.POST['sectionid']
    cd.amounttopay=request.POST["amountpaid"]
    cd.servicefees=servicefees
    cd.totalamounttopay=float(servicefees)+float(request.POST["amountpaid"])
    cd.instituteid_id=studentinstituteid
    cd.academicyearid_id=request.session["academicyearid"]
    cd.createdon=currentdate
    cd.createdonind=indiandate
    cd.createdby_id=request.session["userid"]
    cd.save()
    challanid=ChallanDetails.objects.filter(studentid_id=request.POST["sid"],createdonind=indiandate).last().id
    challandata=ChallanDetails.objects.filter(id=challanid,studentid_id=request.POST["sid"],createdonind=indiandate,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])

    return render(request,"accountant/createchallan.html",{"challandata":challandata})


def accountsettingpassword(request):
    msg=""
    if request.method=="POST":
        usernumber=request.session["mobilenumber"]
        currentpassword=request.POST["txtcurrentpassword"]
        newpassword=request.POST["txtnewpassword"]
        confirmpassword=request.POST["txtconfirmpassword"]
        if newpassword != confirmpassword:
            msg=" new password & confirm new password  must be save"
        else:
            if UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0).exists():
                data=UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0)
                data.update(password=newpassword)
                msg=" change password successfully"
            else:
                msg="current password  does not match"
    return render(request,"accountant/accountsettingpassword.html",{"msg":msg})

def accoutantsettingprofile(request):
    userprofildata=""
    userId=request.session["userid"]
    userprofildata=UserRegister.objects.filter(id=userId)
    return render(request,"accountant/accoutantsettingprofile.html",{"userprofildata":userprofildata})