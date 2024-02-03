from nvsapp.common import * 

def adminstudentdisplay(request):    
    msg=""
    classid=0
    sectionid=0
    academicyearid=0
    data=""
    page_obj=""
    staffdata=""
    instituteid=0
    sectiondata=""
    academicyeardata=AcademicMaster.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    classdata=Addclass.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    sectiondata=Addsection.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    academicyearid=request.POST.get("academicyearid","")
    instituteid=request.POST.get("instituteid","")
    classid=request.POST.get("classid","")
    sectionid=request.POST.get("sectionid","")
    search = request.POST.get("txtsearch","")
    fieldname = request.POST.get("ddlfield","")
    if request.method=="POST":
        action=request.POST["operation"]
        if action=="Get Data":
            if  StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid).exists():
                data=StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid)
                if  fieldname == 'studentid':
                    if StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid)
                    else:
                        msg = 'Record Not Found'
                if fieldname == 'studentname':
                    if StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid)
                    else:
                        msg = 'Record Not Found'
                elif fieldname == 'mobilenumber':
                    if StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid).order_by("id")
                    else:
                        msg = 'Record Not Found'
        p = Paginator(data,int(maxdata))
        page_number = request.GET.get('page')
        try:
            page_obj = p.get_page(page_number)
            if  StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid).exists():
                data=StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid).order_by("id")
                if  fieldname == 'studentid':
                    if StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid).order_by("id")
                    else:
                        msg = 'Record Not Found'
                if fieldname == 'studentname':
                    if StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid).order_by("id")
                    else:
                        msg = 'Record Not Found'
                elif fieldname == 'mobilenumber':
                    if StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid).order_by("id")
                    else:
                        msg = 'Record Not Found'
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")
    return render(request,"admin/sudentdisplayadmin.html",{"data":page_obj,"maxdata":maxdata, "academicyeardata":academicyeardata,"institutedata":institutedata,"classdata":classdata,"sectiondata":sectiondata})


def adminfeesdetails(request):
    institutefeedata=""
    institutedata=""
    institutetotalfees=""
    classfeedata=""
    msg=""
    if request.method == 'POST':
        instituteidsearch = request.POST['txtsearch']
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        if FeesPaidDetails.objects.filter(instituteid_id=instituteidsearch,academicyearid_id=academicyearid,softdelete=0).exists():
            institutefeedata = FeesPaidDetails.objects.filter(instituteid_id=instituteidsearch,academicyearid_id=academicyearid,softdelete=0).values("classid").annotate(dcount=Sum('amountpaid'))
            institutetotalfees=FeesPaidDetails.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(Sum("amountpaid"))["amountpaid__sum"]
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"admin/adminfeesdetails.html",{"classfeedata":classfeedata,"institutetotalfees":institutetotalfees,"institutedata":institutedata,"institutefeedata":institutefeedata,"msg":msg})

def adminpendingleaves(request):
    msg=""
    data=""
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        iid=request.session['instituteid']
        if action=="Approve":
            lid=request.POST["leaveid"]
            leavedata=LeaveStaff.objects.filter(id=lid,softdelete=0,instituteid=iid)
            leavedata.update(leavestatus="APPROVED",updatedby="Admin",updatedon=datetime.datetime.now())
            msg="Leave Approved"
        elif action=="Reject":
            lid=request.POST["leaveid"]
            leavedata=LeaveStaff.objects.filter(id=lid,softdelete=0,instituteid=iid)
            leavedata.update(leavestatus="REJECTED",updatedby="Admin",updatedon=datetime.datetime.now())
            msg="Leave Rejected"
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="PENDING")
    return render(request,"admin/adminpendingleaves.html",{"leavedata":leavedata,"msg":msg})

def adminapprovedleaves(request):
    msg=""
    data=""
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="APPROVED")
    return render(request,"admin/adminapprovedleaves.html",{"leavedata":leavedata,"msg":msg})

def adminrejectedleaves(request):
    msg=""
    data=""
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="REJECTED")
    return render(request,"admin/adminrejectedleaves.html",{"leavedata":leavedata,"msg":msg})


def adminchangepassword(request):
    msg=""
    if request.method=="POST":
        usernumber=request.session["mobilenumber"]
        currentpassword=request.POST["txtcurrentpassword"]
        newpassword=request.POST["txtnewpassword"]
        confirmpassword=request.POST["txtconfirmpassword"]
        if newpassword != confirmpassword:
            msg=" new password & confirm new password  must be same"
        else:
            if UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0).exists():
                data=UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0)
                data.update(password=newpassword)
                msg=" change password successfully"
            else:
                msg="current password  does not match"
    return render(request,"admin/adminchangepassword.html",{"msg":msg})

def adminprofile(request):
    userprofildata=""
    userId=request.session["userid"]
    userprofildata=UserRegister.objects.filter(id=userId)
    return render(request,"admin/adminprofile.html",{"userprofildata":userprofildata})


def feedback(request):
	msg=""
	if request.method=="POST":
		fb=MstFeedback()
		fb.feedback=request.POST["feedbackquestion"]
		fb.createdby_id=request.session["userid"]
		fb.save()
		msg="Feedback Added"
	else:
		msg=""
	return render(request,"admin/feedback.html",{"msg":msg})


def adminhome(request):
    datacount = ""
    Sdatacount = ""
    Fdatacount = ""
    datacount = InstitutionProfile.objects.filter(softdelete=0).count()
    Sdatacount = StudentRegister.objects.filter(softdelete=0).count()
    Fdatacount = UserRegister.objects.filter(softdelete=0).count()
    totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totfees=Sum("amount"))
    totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totdisc=Sum("discount"))
    totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totpaid=Sum("amountpaid"))
    challancreated=ChallanDetails.objects.filter(academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    pendingpayments=ChallanDetails.objects.filter(paymentstatus="NEW",academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    completedpayments=ChallanDetails.objects.filter(paymentstatus="PAID",academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    challansrejected=ChallanDetails.objects.filter(paymentstatus="REJECTED",academicyearid_id=request.session["academicyearid"],softdelete=0).count()

    if not all(totalfeestobecollection.values()):
        totalfeestobecollection=0
    else:
        totalfeestobecollection=totalfeestobecollection["totfees"]

    if not all(totaldiscountfees.values()):
        totaldiscountfees=0
    else:
        totaldiscountfees=totaldiscountfees["totdisc"]
    if not all(totalfeescollectedtilldate.values()):
        totalfeescollectedtilldate=0
    else:
        totalfeescollectedtilldate=totalfeescollectedtilldate["totpaid"]
    totfalfeesbalance = float(totalfeestobecollection) - (float(totalfeescollectedtilldate) + float(totalfeescollectedtilldate))
    return render(
        request,
        "admin/adminhome.html",
        {
            "totalfeestobecollection": float(totalfeestobecollection),
            "totaldiscountfees": float(totaldiscountfees),
            "totalfeescollectedtilldate": float(totalfeescollectedtilldate),
            "totfalfeesbalance": float(totfalfeesbalance),
            "datacount": float(datacount),
            "Sdatacount": float(Sdatacount),
            "Fdatacount": float(Fdatacount),
            "challancreated":challancreated,"pendingpayments":pendingpayments,"completedpayments":completedpayments,"challansrejected":challansrejected
        },
    )


def indivisualstudent(request):
    msg = ''
    data = ''
    feesheads=''
    Institutiondata=""
    studentfeesdata=""
    amountpaid=0
    discountamt=0
    totalfees=0
    studentfeesdetails=""
    balanceamount=0
    print(request.POST.get("studentid","0"))
    search = request.POST.get("studentid","0")
    instituteid=request.POST.get("instituteid","")
    academicyearid=request.session["academicyearid"]
    classid=request.POST.get("classid","0")
    institutename=request.POST.get("institutename","0")
    classname=request.POST.get("institutename","0")


    if StudentRegister.objects.filter(id=search,softdelete=0,academicyearid_id=academicyearid,instituteid_id=instituteid,chooseclass_id=classid).exists():
        data = StudentRegister.objects.filter(id=search,softdelete=0,academicyearid_id=academicyearid,instituteid_id=instituteid,chooseclass_id=classid)
        for dd in data:
            if dd.discount!="":
                discountamt=dd.discount
            else:
                discountamt=0
            totalfees=dd.amount
        msg = ''
        if FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=academicyearid,instituteid_id=instituteid,classid_id=classid).exists():
            studentfeesdata=FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=academicyearid,instituteid_id=instituteid,classid_id=classid).values('studentid').annotate(total_price=Sum('amountpaid')).values("total_price")
            studentfeesdetails=FeesPaidDetails.objects.filter(studentid_id=search,softdelete=0,academicyearid_id=academicyearid,instituteid_id=instituteid,classid_id=classid)
            amountpaid=studentfeesdata[0]["total_price"]
            balanceamount=float(totalfees)-(float(amountpaid)+float(discountamt))
            
        else:
            amountpaid=0
            balanceamount=float(totalfees)-(float(amountpaid)+float(discountamt))
            studentfeesdata=""
            studentfeesdetails=""
    else:
        msg="Student record not found"
    return render(request,"admin/indivisualstudent.html",{"discountamt":float(discountamt),"classname":classname,"institutename":institutename,"feesheads":feesheads,"studentfeesdetails":studentfeesdetails,"balanceamount":balanceamount,"amountpaid":amountpaid,"totalfees":totalfees,'data':data,'msg': msg,"studentfeesdata":studentfeesdata,"amountpaid":amountpaid})

def indivisualclass(request):
    finalcollection=0
    finalcollected=0
    finaldiscount=0
    finalpending=0
    classdata=""
    fromdate=""
    todate=""
    dispfromdate=""
    disptodate=""

    institiutedata=""
    data=""
    if request.method=="POST":
        print("am in post?")
        print(request.POST.get("fromdate",""))
        instituteid=request.POST.get("instituteid","")
        institutename=request.POST.get("institutename","")
        classid=request.POST.get("classid","")
        classname=request.POST.get("classname","")
        studentdata=StudentRegister.objects.filter(softdelete=0,instituteid_id=instituteid,chooseclass_id=classid,academicyearid_id=request.session["academicyearid"])
        fromdate=request.POST.get("fromdate","")
        todate=request.POST.get("todate","")
        fromdate=request.POST.get("fromdate","")
        arrfromdate=fromdate.split("-")
        dispfromdate=arrfromdate[2]+"-"+arrfromdate[1]+"-"+arrfromdate[0]
        todate=request.POST.get("todate","")
        arrtodate=todate.split("-")
        disptodate=arrtodate[2]+"-"+arrtodate[1]+"-"+arrtodate[0]


        academicyear=request.session["academicyearid"]

        TempStudentsFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="STUDENTWISE",classid=classid,userid=request.session["userid"]).delete()
        for sid in studentdata:
            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=classid,id=sid.id).values("id").exists():
                totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=classid,id=sid.id).values("id").annotate(totfees=Sum("amount"))
                if not all(totalfeestobecollection.values()):
                    totalfeestobecollection=0
                else:
                    for d in totalfeestobecollection:
                        totalfeestobecollection=d.get("totfees")
            else:
                totalfeestobecollection=0
            finalcollection+=totalfeestobecollection

            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=classid,id=sid.id).values("id").exists():
                totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=classid,id=sid.id).values("id").annotate(totdisc=Sum("discount"))
                if not all(totaldiscountfees.values()):
                    totaldiscountfees=0
                else:
                    for d in totaldiscountfees:
                        totaldiscountfees=d.get("totdisc")
            else:
                totaldiscountfees=0
            finaldiscount+=totaldiscountfees
            if FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,createdon__range=[fromdate,todate],classid_id=classid,studentid=sid.id).values("studentid").exists():
                totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,createdon__range=[fromdate,todate],classid_id=classid,studentid=sid.id).values("studentid").annotate(totpaid=Sum("amountpaid"))
                if not all(totalfeescollectedtilldate.values()):
                    totalfeescollectedtilldate=0
                else:
                    for d in totalfeescollectedtilldate:
                        totalfeescollectedtilldate=d.get("totpaid")
            else:
                totalfeescollectedtilldate=0
            finalcollected+=totalfeescollectedtilldate
            
            totfalfeesbalance = float(totalfeestobecollection) - (float(totaldiscountfees) + float(totalfeescollectedtilldate))
            finalpending+=totfalfeesbalance
            ift=TempStudentsFeesDetails()
            ift.instituteid=instituteid
            ift.institutename=institutename
            ift.classid=classid
            ift.classname=classname
            ift.studentname=sid.studentname+" "+sid.surname+" "+sid.fathername
            ift.studentid=sid.id
            ift.totalcollection=totalfeestobecollection
            ift.totalcollected=totalfeescollectedtilldate
            ift.totaldiscount=totaldiscountfees
            ift.pendingamount=totfalfeesbalance
            ift.fromdate=fromdate
            ift.todate=todate
            ift.detailstype="STUDENTWISE"
            ift.userid=request.session["userid"]            
            ift.save()
        data=TempStudentsFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="STUDENTWISE",classid=classid,userid=request.session["userid"])
    return render(
        request,
        "admin/indivisualclass.html",
        {
            "fromdate":fromdate,
            "todate":todate,
            "data":data,
            "classname":classname,
            "dispfromdate":dispfromdate,
            "disptodate":disptodate,


            "instituteid":instituteid,
            "institutename":institutename,
            "finalcollection":finalcollection,
            "finalcollected":finalcollected,
            "finaldiscount":finaldiscount,
            "finalpending":finalpending            
        },
    )


def indivisualinstitute(request):
    finalcollection=0
    finalcollected=0
    finaldiscount=0
    finalpending=0
    classdata=""
    fromdate=""
    todate=""
    dispfromdate=""
    disptodate=""

    institiutedata=""
    data=""
    if request.method=="POST":
        instituteid=request.POST.get("instituteid","")
        institutename=request.POST.get("institutename","")
        classdata=Addclass.objects.filter(softdelete=0,instituteid_id=instituteid)

        fromdate=request.POST.get("fromdate","")
        arrfromdate=fromdate.split("-")
        dispfromdate=arrfromdate[2]+"-"+arrfromdate[1]+"-"+arrfromdate[0]
        todate=request.POST.get("todate","")
        arrtodate=todate.split("-")
        disptodate=arrtodate[2]+"-"+arrtodate[1]+"-"+arrtodate[0]

        academicyear=request.session["academicyearid"]
        TempClassFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="CLASSWISE",userid=request.session["userid"]).delete()
        for clsid in classdata:
            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=clsid.id).values("chooseclass").exists():
                totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=clsid.id).values("chooseclass").annotate(totfees=Sum("amount"))
                if not all(totalfeestobecollection.values()):
                    totalfeestobecollection=0
                else:
                    for d in totalfeestobecollection:
                        totalfeestobecollection=d.get("totfees")
            else:
                totalfeestobecollection=0
            finalcollection+=totalfeestobecollection

            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=clsid.id).values("chooseclass").exists():
                totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,chooseclass_id=clsid.id).values("chooseclass").annotate(totdisc=Sum("discount"))
                if not all(totaldiscountfees.values()):
                    totaldiscountfees=0
                else:
                    for d in totaldiscountfees:
                        totaldiscountfees=d.get("totdisc")
            else:
                totaldiscountfees=0
            finaldiscount+=totaldiscountfees
            if FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,createdon__range=[fromdate,todate],classid_id=clsid.id).values("classid").exists():
                totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=instituteid,createdon__range=[fromdate,todate],classid_id=clsid.id).values("classid").annotate(totpaid=Sum("amountpaid"))
                if not all(totalfeescollectedtilldate.values()):
                    totalfeescollectedtilldate=0
                else:
                    for d in totalfeescollectedtilldate:
                        totalfeescollectedtilldate=d.get("totpaid")
            else:
                totalfeescollectedtilldate=0
            finalcollected+=totalfeescollectedtilldate
            
            totfalfeesbalance = float(totalfeestobecollection) - (float(totaldiscountfees) + float(totalfeescollectedtilldate))
            finalpending+=totfalfeesbalance
            ift=TempClassFeesDetails()
            ift.instituteid=instituteid
            ift.institutename=institutename
            ift.classid=clsid.id
            ift.classname=clsid.className
            ift.totalcollection=totalfeestobecollection
            ift.totalcollected=totalfeescollectedtilldate
            ift.totaldiscount=totaldiscountfees
            ift.pendingamount=totfalfeesbalance
            ift.fromdate=fromdate
            ift.todate=todate
            ift.detailstype="CLASSWISE"
            ift.userid=request.session["userid"]            
            ift.save()
        data=TempClassFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="CLASSWISE",userid=request.session["userid"])
    return render(
        request,
        "admin/indivisualinstitute.html",
        {
            "data":data,
            "fromdate":fromdate,
            "todate":todate,
            "dispfromdate":dispfromdate,
            "disptodate":disptodate,

            "instituteid":instituteid,
            "institutename":institutename,
            "finalcollection":finalcollection,
            "finalcollected":finalcollected,
            "finaldiscount":finaldiscount,
            "finalpending":finalpending            
        },
    )

def viewinstituteexpectedcollection(request):
    finalcollection=0
    finalcollected=0
    finaldiscount=0
    finalpending=0
    institiutedata=""
    data=""
    fromdate=""
    todate=""
    if request.method=="POST":
        institiutedata=InstitutionProfile.objects.filter(softdelete=0)
        fromdate=request.POST.get("fromdate","")
        todate=request.POST.get("todate","")
        academicyear=request.session["academicyearid"]
        TempInstituteFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="INSTITUTEWISE",userid=request.session["userid"]).delete()
        for inst in institiutedata:
            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id).values("instituteid").exists():
                totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id).values("instituteid").annotate(totfees=Sum("amount"))
                if not all(totalfeestobecollection.values()):
                    totalfeestobecollection=0
                else:
                    for d in totalfeestobecollection:
                        totalfeestobecollection=d.get("totfees")
            else:
                totalfeestobecollection=0
            finalcollection+=totalfeestobecollection

            if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id).values("instituteid").exists():
                totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id).values("instituteid").annotate(totdisc=Sum("discount"))
                if not all(totaldiscountfees.values()):
                    totaldiscountfees=0
                else:
                    for d in totaldiscountfees:
                        totaldiscountfees=d.get("totdisc")
            else:
                totaldiscountfees=0
            finaldiscount+=totaldiscountfees


            if FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id,createdon__range=[fromdate,todate]).values("instituteid").exists():
                totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=inst.id,createdon__range=[fromdate,todate]).values("instituteid").annotate(totpaid=Sum("amountpaid"))
                if not all(totalfeescollectedtilldate.values()):
                    totalfeescollectedtilldate=0
                else:
                    for d in totalfeescollectedtilldate:
                        totalfeescollectedtilldate=d.get("totpaid")
            else:
                totalfeescollectedtilldate=0
            finalcollected+=totalfeescollectedtilldate
            
            totfalfeesbalance = float(totalfeestobecollection) - (float(totaldiscountfees) + float(totalfeescollectedtilldate))
            finalpending+=totfalfeesbalance
            ift=TempInstituteFeesDetails()
            ift.instituteid=inst.id
            ift.institutename=inst.institutename
            ift.totalcollection=totalfeestobecollection
            ift.totalcollected=totalfeescollectedtilldate
            ift.totaldiscount=totaldiscountfees
            ift.pendingamount=totfalfeesbalance
            ift.fromdate=fromdate
            ift.todate=todate
            ift.detailstype="INSTITUTEWISE"
            ift.userid=request.session["userid"]
            ift.save()
        data=TempInstituteFeesDetails.objects.filter(fromdate=fromdate,userid=request.session["userid"],todate=todate,detailstype="INSTITUTEWISE")
    return render(
        request,
        "admin/viewinstituteexpectedcollection.html",
        {
            "institiutedata": institiutedata,
            "data":data,
            "finalcollection":finalcollection,
            "finalcollected":finalcollected,
            "finaldiscount":finaldiscount,
            "finalpending":finalpending,
            "fromdate":fromdate,
            "todate":todate            
        },
    )




def viewinstitutediscount(request):
    totalfeestobecollection =0 #StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totfees=Sum("amount"))
    totaldiscountfees =0 #StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totdisc=Sum("discount"))
    totalfeescollectedtilldate =0 #FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totpaid=Sum("amountpaid"))
    totfalfeesbalance = float(totalfeestobecollection["totfees"]) - (
        float(totaldiscountfees["totdisc"]) + float(totalfeescollectedtilldate["totpaid"])
    )
    return render(
        request,
        "admin/viewinstitutediscount.html",
        {
            "totalfeestobecollection": totalfeestobecollection["totfees"],
            "totaldiscountfees": totaldiscountfees["totdisc"],
            "totalfeescollectedtilldate": totalfeescollectedtilldate["totpaid"],
            "totfalfeesbalance": totfalfeesbalance,
        },
    )

def viewinstitutecollected(request):
    totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totfees=Sum("amount"))
    totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totdisc=Sum("discount"))
    totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totpaid=Sum("amountpaid"))
    totfalfeesbalance = float(totalfeestobecollection["totfees"]) - (
        float(totaldiscountfees["totdisc"]) + float(totalfeescollectedtilldate["totpaid"])
    )
    return render(
        request,
        "admin/viewinstitutecollected.html",
        {
            "totalfeestobecollection": totalfeestobecollection["totfees"],
            "totaldiscountfees": totaldiscountfees["totdisc"],
            "totalfeescollectedtilldate": totalfeescollectedtilldate["totpaid"],
            "totfalfeesbalance": totfalfeesbalance,
        },
    )

def viewinstitutebalance(request):
    totalfeestobecollection =0 # StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totfees=Sum("amount"))
    totaldiscountfees =0 # StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totdisc=Sum("discount"))
    totalfeescollectedtilldate =0 # FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"]).aggregate(totpaid=Sum("amountpaid"))

    totfalfeesbalance = float(totalfeestobecollection["totfees"]) - (
        float(totaldiscountfees["totdisc"]) + float(totalfeescollectedtilldate["totpaid"])
    )
    return render(
        request,
        "admin/viewinstitutebalance.html",
        {
            "totalfeestobecollection": totalfeestobecollection["totfees"],
            "totaldiscountfees": totaldiscountfees["totdisc"],
            "totalfeescollectedtilldate": totalfeescollectedtilldate["totpaid"],
            "totfalfeesbalance": totfalfeesbalance,
        },
    )


def getcaste(request):
    if request.method=="POST":
        religionid=request.POST["religionid"]
        print(religionid);
        castes=CasteOperator.objects.filter(selectreligion=religionid)
    return JsonResponse({"castes":list(castes.values())})


def subcaste(request):
    msg=""
    data=""
    if request.method=="POST":
        if MstSubCaste.objects.filter(subcaste=request.POST["subcaste"],softdelete=0,instituteid_id=request.session["instituteid"]).exists():
            msg="Already Exists"
        else:
            s=MstSubCaste()
            s.subcastename=request.POST["subcaste"]
            s.Category=request.POST["textcategory"]
            s.selectreligion_id=request.POST["religion"]
            s.selectcastes_id=request.POST["castes"]
            s.createdby_id=request.session["userid"]
            s.instituteid_id=request.session["instituteid"]
            s.save()
            msg="Save Successfully"
    else:
        msg=""
    if Religion.objects.filter(softdelete=0,instituteid_id=request.session["instituteid"]).exists():
        data=Religion.objects.filter(softdelete=0,instituteid_id=request.session["instituteid"])
    return render(request,"admin/subcaste.html",{"msg":msg,"data":data})


def castemaster(request):
    msg=""
    data=""
    if request.method=="POST":
        if CasteOperator.objects.filter(castes=request.POST["textcaste"]).exists():
            msg="Caste Already Exists"
        else:
            d=CasteOperator()
            d.castes=request.POST["textcaste"]
            d.selectreligion_id=request.POST["religion"]
            d.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
            d.createdby_id=request.session["userid"]
            d.instituteid_id=request.session["instituteid"]
            d.save()
            msg="Caste Added Successfully"
    else:
        msg=""
    data=Religion.objects.all()
    return render(request,"admin/castemaster.html",{"msg":msg,"data":data})

def religion(request):
    msg=""
    if request.method=="POST":
        if Religion.objects.filter(religion=request.POST["txtreligion"]).exists():
            msg="Religion Already Add"
        else:
            n=Religion()
            n.religion=request.POST["txtreligion"]
            n.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
            n.instituteid_id=request.session["instituteid"]
            n.createdby_id=request.session["userid"]
            n.save()
            msg="Religion Added Successfully"
    else:
        msg=""
    return render(request,"admin/religion.html",{"msg":msg})

def seachinstitutes(request):
    msg=""
    data=""
    if request.method=="POST":
        search=request.POST['txtsearch']
        fieldname=request.POST['ddlfield']
        if search.isnumeric() and fieldname=="Instituteid":
            if InstitutionProfile.objects.filter(id=search).exists():
                data=InstitutionProfile.objects.filter(id=search)
            else:
                msg="Record Not Found"
        else:
            if (fieldname=="Institutename"):
                if InstitutionProfile.objects.filter(institutename__icontains=search).exists():
                    data=InstitutionProfile.objects.filter(institutename__icontains=search)
                else:
                    msg="Record Not Found"
            
    return render(request,"admin/searchinstitute.html",{"data":data,"msg":msg})


def  searchuser(request):
	msg=""
	data=""
	if request.method=="POST":
		Iid=request.POST['txtinstitutename']
		search=request.POST['txtsearch']
		fieldname=request.POST['ddlfield']
		if UserRegister.objects.filter().exists():
			data=UserRegister.objects.filter(instituteid=Iid)
		else:
			msg="Record Not Found"
		if search.isnumeric() and fieldname=="userid":
			if UserRegister.objects.filter(id=search,instituteid=Iid,softdelete=0).exists():
				data=UserRegister.objects.filter(id=search,instituteid=Iid,softdelete=0)
			else:
				msg="Record Not Found"
		else:
			if (fieldname=="username"):
				if UserRegister.objects.filter(name__icontains=search,instituteid=Iid,softdelete=0).exists():
					data=UserRegister.objects.filter(name__icontains=search,instituteid=Iid,softdelete=0)
				else:
					msg="Record Not Found"
			elif fieldname=="usermobilenumber":
				if UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=Iid,softdelete=0).exists():
					data=UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=Iid,softdelete=0)
				else:
					msg="Record Not Found"
	institutedata=InstitutionProfile.objects.all()
	return render(request,"admin/searchuser.html",{"institutedata":institutedata,"data":data,"msg":msg	})






def headssearch(request):
    msg=""
    data=""
    page_obj=""
    page_number=""
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    instituteid=request.session["instituteid"]
    fieldname = request.POST.get("ddlfield","0")
    search = request.POST.get("txtsearch","0")
    if True:
        if AccountHead.objects.filter(softdelete=0).exists():
            data=AccountHead.objects.filter(softdelete=0)
            if fieldname=="headsid":
                if AccountHead.objects.filter(id=search,softdelete=0).exists():
                    data=AccountHead.objects.filter(id=search,softdelete=0).order_by("id")
                else:
                    msg="Record Not Found"
            if fieldname=="headsname":
                if AccountHead.objects.filter(head__icontains=search,softdelete=0).exists():
                    data=AccountHead.objects.filter(head__icontains=search,softdelete=0).order_by("id")
                else:
                    msg="Record Not Found"
        p = Paginator(data,int(maxdata))
        page_number = request.POST.get('page')
        try:
            page_obj = p.get_page(page_number)
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")

    return render(request,"admin/headssearch.html",{"institutedata":institutedata,"data":page_obj,"msg":msg,"institutedata":institutedata,"instituteid":instituteid,"fieldname":fieldname,"search":search})


def facultyreport(request):
	data=""
	msg=""
	if request.method=="POST":
		action=request.POST['btnsubmit']
		if action=="Delete":
			fid=request.POST["facultyid"]
			if UserRegister.objects.filter(id=hid).exists():
				data=UserRegister.objects.filter(id=fid)
				data.update(softdelete=1)
				msg="Faculty Removed Successfully"
				return render(request,"admin/facultyreport.html",{"data":data,"msg":msg})
		else:
			Iid=request.POST['txtinstitutename']	
			search=request.POST['txtsearch']
			fieldname=request.POST['ddlfield']

			if search.isnumeric() and fieldname=="facultyid":
				if UserRegister.objects.filter(id=search,instituteid=Iid,softdelete=0).exists():
					data=UserRegister.objects.filter(id=search,instituteid=Iid,softdelete=0)
				else:
					msg="Record Not Found"
			else:
				if (fieldname=="facultyname"):
					if UserRegister.objects.filter(name__icontains=search,instituteid=Iid,softdelete=0).exists():
						data=UserRegister.objects.filter(name__icontains=search,instituteid=Iid,softdelete=0)
					else:
						msg="Record Not Found"
				elif fieldname=="facultymobilenumber":
					if UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=Iid,softdelete=0).exists():
						data=UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=Iid,softdelete=0)
					else:
						msg="Record Not Found"
	institutedata=InstitutionProfile.objects.all()
	return render(request,"admin/facultyreport.html",{"institutedata":institutedata,"data":data,"msg":msg})

def  searchuser(request):
    msg=""
    instituteid=0
    designationid=0
    data=""
    designationid=""
    page_obj=""
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    designationdata=MstDesignation.objects.all()
    
    instituteid=request.session["instituteid"]
    designationid=request.POST.get("designationid","0")
    if request.method=="POST":
        if UserRegister.objects.filter(instituteid_id=instituteid,softdelete=0,designation_id=designationid).exists():
            data=UserRegister.objects.filter(instituteid_id=instituteid,softdelete=0,designation_id=designationid).order_by("id")
            print(data)
        else:
            msg=" Record Not Found"
        p = Paginator(data,int(maxdata))
        page_number = request.POST.get('page')
        try:
            page_obj = p.get_page(page_number)
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")
    return render(request,"admin/searchuser.html",{"data":page_obj,"instituteid":instituteid,"msg":msg,"institutedata":institutedata,"designationdata":designationdata,"designationid":designationid})





#!/usr/bin/python
# -*- coding: utf-8 -*-


def studentsearch(request):
    msg=""
    classid=0
    sectionid=0
    academicyearid=0
    data=""
    page_obj=""
    staffdata=""
    instituteid=0
    sectiondata=""
    academicyeardata=AcademicMaster.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    institutedata=InstitutionProfile.objects.filter(softdelete=0)

    classdata=Addclass.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    sectiondata=Addsection.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)
    instituteid=request.session["instituteid"]
    search = request.POST.get("txtsearch","")
    fieldname = request.POST.get("ddlfield","")
    if request.method=="POST":     
        if True:
            if  StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid).exists():
                data=StudentRegister.objects.filter(academicyearid_id=academicyearid,instituteid_id=instituteid,softdelete=0,chooseclass_id=classid,section_id=sectionid)
                if  fieldname == 'studentid':
                    if StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(id=search,chooseclass_id=classid,section_id=sectionid)
                    else:
                        msg = 'Record Not Found'
                if fieldname == 'studentname':
                    if StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(studentname__icontains=search,chooseclass_id=classid,section_id=sectionid)
                    else:
                        msg = 'Record Not Found'
                elif fieldname == 'mobilenumber':
                    if StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid).exists():
                        data = StudentRegister.objects.filter(mobilenumber__icontains=search,chooseclass_id=classid,section_id=sectionid)
                    else:
                        msg = 'Record Not Found'
        p = Paginator(data,int(maxdata))
        page_number = request.POST.get('page')
        print("-------------------------")

        print(page_number)
        try:
            page_obj = p.get_page(page_number)
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")
    return render(request,"admin/studentsearch.html",{"data":page_obj,"academicyeardata":academicyeardata,"institutedata":institutedata,"classdata":classdata,"sectiondata":sectiondata,"search":search,"fieldname":fieldname,"academicyearid":academicyearid,"instituteid":instituteid,"classid":classid,"sectionid":sectionid})



def displayfeestype(request):
	data=""
	if MstFeesType.objects.all().exists():
		data=MstFeesType.objects.all()
	return render(request,"accountant/displayfeestype.html",{"data":data})



#!/usr/bin/python
# -*- coding: utf-8 -*-


def academicmaster(request):
    msg = ''
    if request.method == 'POST':
        if AcademicMaster.objects.filter(yeardate=request.POST['currentyear']).exists():
            msg = 'Academic year already created'
        else:
            AcademicMaster.objects.all().update(isactive=0)
            m = AcademicMaster()
            m.yeardate = request.POST['currentyear']
            m.instituteid_id = request.session['instituteid']
            m.createdby_id = request.session['userid']

            m.save()
            msg = 'Academic Year Successfully Created'
    else:
        msg = ''
    cyear = datetime.datetime.today().strftime('%Y')
    newdate = int(cyear) + 1
    academicyear = str(cyear) + '-' + str(newdate)
    return render(request, 'admin/academicmaster.html', {'msg': msg,'academicyear': academicyear})


def adminhead(request):
    msg = ""
    feescategory=""
    if FeesCategory.objects.filter(softdelete=0).exists():
        feescategory=FeesCategory.objects.filter(softdelete=0)

    if request.method == "POST":
        if AccountHead.objects.filter(head=request.POST["head"].upper(),feescategory_id = request.POST["feescategory"]).exists():
            msg = "Template Head already exists"
        else:
            hd = AccountHead()
            hd.head = request.POST["head"].upper()
            hd.feescategory_id = request.POST["feescategory"]
            hd.createdby_id = request.session["userid"]
            hd.save()
            msg = "Template Head Added Successfully"
    return render(request, "admin/adminhead.html", {"msg": msg,"feescategory":feescategory})


#!/usr/bin/python
# -*- coding: utf-8 -*-


def adminuserregister(request):
    msg = ''
    data = ''
    designation = MstDesignation.objects.filter(softdelete=0)
    if request.method == 'POST':
        if UserRegister.objects.filter(mobilenumber=request.POST['Mobile'
                ], instituteid=request.POST['instituteid']).exists():
            msg = 'User already Exists'
        else:
            ur = UserRegister()
            ur.name = request.POST['name']
            ur.mobilenumber = request.POST['Mobile']
            ur.emailid = request.POST['emailid']
            ur.designation_id = request.POST['designation']
            ur.password = request.POST['Password']
            ur.instituteid_id = request.session['instituteid']
            ur.createdby = request.session['userid']
            ur.save()
            msg = 'User Successfully Registered'
    else:
        msg = ''
    data = InstitutionProfile.objects.all()
    return render(request, 'admin/adminuserregister.html', {'msg': msg,
                  'data': data, 'designation': designation})


def managementregister(request):
	msg=""
	data=""
	if request.method=="POST":
		if UserRegister.objects.filter(mobilenumber=request.POST['Mobile']).exists():
			msg="User already Exists"
		else:
			ur=UserRegister()
			ur.name=request.POST['name']
			ur.mobilenumber=request.POST['Mobile']
			ur.emailid=request.POST['emailid']
			ur.designation=request.POST['designation']
			ur.password=request.POST['Password']
			ur.save()
			msg="Registered Successfully"
	else:
		msg=""
	data=InstitutionProfile.objects.all()
	return render(request,"admin/managementregister.html",{"msg":msg,"data":data})





def instituteprofile(request):
    msg = ''
    data = ''
    if request.method == 'POST':
        if InstitutionProfile.objects.filter(institutename=request.POST['IName'].upper()).exists():
            msg = 'Institute already exists'
        else:
            ip = InstitutionProfile()
            ip.nameoftrust = request.POST['Trust'].upper()
            ip.institutename = request.POST['IName'].upper()
            ip.institutecode = request.POST['Code'].upper()
            ip.address = request.POST['Address'].upper()
            ip.mobilenumber = request.POST['Phone']
            ip.cashopeningbalance = request.POST['CashOB']
            file = request.FILES['FileName']
            fs = FileSystemStorage()
            image = fs.save(file.name, file)
            ip.image = fs.url(image)
            ip.currentAyear = request.POST['AYear']
            ip.createdon = datetime.datetime.now().strftime('%d-%m-%Y')
            ip.save()
            msg = 'Institute Added Successfully'
    return render(request, 'admin/instituteprofile.html', {'msg': msg})

