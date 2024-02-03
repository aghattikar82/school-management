from nvsapp.common import * 


def cashierviewinstituteexpectedcollection(request):
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
        data=TempInstituteFeesDetails.objects.filter(fromdate=fromdate,todate=todate,detailstype="INSTITUTEWISE",userid=request.session["userid"])
    return render(
        request,
        "cashier/cashierviewinstituteexpectedcollection.html",
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

def cashierindivisualinstitute(request):
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
        "cashier/cashierindivisualinstitute.html",
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

def cashierindivisualclass(request):
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
        "cashier/cashierindivisualclass.html",
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

def cashierindivisualstudent(request):
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
    return render(request,"cashier/cashierindivisualstudent.html",{"discountamt":float(discountamt),"classname":classname,"institutename":institutename,"feesheads":feesheads,"studentfeesdetails":studentfeesdetails,"balanceamount":balanceamount,"amountpaid":amountpaid,"totalfees":totalfees,'data':data,'msg': msg,"studentfeesdata":studentfeesdata,"amountpaid":amountpaid})


def cashierhome(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    feepaiddataamount=0
    challanpaiddataamount=0
    challanpaiddata=0
    totfeeescollected=0
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    todayscollection=FeesPaidDetails.objects.filter(instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).aggregate(todayscoll=Sum("amountpaid"))
    challancreated=ChallanDetails.objects.filter(instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).count()
    challanscleared=ChallanDetails.objects.filter(instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0,paymentstatus="PAID").count()

    
    if not all(todayscollection.values()):
        todayscollection=0
    else:
        todayscollection=todayscollection["todayscoll"]

    totfeeescollected=FeesPaidDetails.objects.filter(instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"],softdelete=0).aggregate(totfeeescollected=Sum("amountpaid"))
    if not all(totfeeescollected.values()):
        totfeeescollected=0
    else:
        totfeeescollected=totfeeescollected["totfeeescollected"]

    if ChallanDetails.objects.filter(createdon=currentdate,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0,paymentstatus="NEW").exists():
        challanpaiddata = ChallanDetails.objects.filter(createdon=currentdate,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0,paymentstatus="NEW")
        challanpaiddataamount=ChallanDetails.objects.filter(createdon=currentdate,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(Sum("amounttopay"))["amounttopay__sum"]
    else:
        msg="NO New Challans created for today yet"
    return render(request,"cashier/cashierhome.html",{"challanscleared":challanscleared,"totfeeescollected":totfeeescollected,"todayscollection":todayscollection,"challancreated":challancreated,"challanpaiddataamount":challanpaiddataamount,"challanpaiddata":challanpaiddata,"msg":msg})

def cashiersearchchallan(request):
    msg=""
    challanid=0
    challandata=""
    redirectpage="cashier/cashiersearchchallan.html"
    if request.method=="POST":
        operation=request.POST.get("operation","")
        print(operation)
        if operation=="search":
            challanid=request.POST.get("txtchallannumber","")
            print(challanid)
            if ChallanDetails.objects.filter(id=challanid,softdelete=0).exists():
                challandata=ChallanDetails.objects.filter(id=challanid,softdelete=0)
            else:
                msg="Invalid Challan Number"
        elif operation=="printreciept":
            challanid=request.POST.get("challanid","0")
            rid=FeesPaidDetails.objects.filter(challanid=request.POST.get("challanid","0")).order_by("id")[0]
            print(rid.id)
            request.session["recieptid"]=rid.id
            return redirect("printfeesreciept")
        elif operation=="payment":
            fp=FeesPaidDetails()
            fp.challanid_id=request.POST.get("challanid","0")
            fp.studentid_id=request.POST.get("studentid","0")
            fp.amountpaid=request.POST.get("amountpaid","0")
            fp.ddlpaymentmode=request.POST.get("paymentmode","0")
            fp.classid_id=request.POST.get("classid","0")
            fp.sectionid_id=request.POST.get("sectionid","0")
            fp.transactiondetials=request.POST.get("paymentdetails","")
            fp.instituteid_id=request.POST.get("instituteidstudentid","0")
            fp.academicyearid_id=request.POST.get("academicyearid","0")
            fp.createdby_id=request.session["userid"]
            fp.createdon=currentdate
            fp.createdonind=indiandate
            fp.ddlpaymentmode="PAID"
            studentname=request.POST.get("studentname","")
            mobilenumber=request.POST.get("mobilenumber","")
            fp.save()
            challanid=request.POST.get("challanid","0")
            rid=FeesPaidDetails.objects.filter(challanid=request.POST.get("challanid","0")).order_by('-id')[0]
            request.session["recieptid"]=rid.id
            if rid.id!=0:
                i=ChallanDetails.objects.filter(id=challanid,softdelete=0).update(paymentstatus="PAID",collecteddate=currentdate,collecteddateind=indiandate,collecterid=request.session["userid"])
                sms="Hello "+str(studentname)+",\n We have received the fees sum of "+str(request.POST["amountpaid"])+" Rs. for the Admission of Class "+str(request.POST.get("classsection"))+" bearing registerd number "+str(request.POST.get("studentid"))+" with Reciept Number "+str(rid.id)+" \nThank you."
                requests.post("https://wa.intractly.com/api/send?number=91"+str(mobilenumber)+"&type=test&message="+sms+"&instance_id=64F57CE8EC4FB&access_token=64f4985081c3f")
                return redirect("printfeesreciept")
            else:
                msg="Server Error! Please Contact Developer"
                FeesPaidDetails.objects.filter(id=rid.id).delete()
    return render(request,redirectpage,{"challandata":challandata,"msg":msg,"challanid":challanid})

def printfeesreciept(request):
    feepaiddata=""
    msg=""
    institutedata=InstitutionProfile.objects.filter(id=request.session["instituteid"]) 
    if FeesPaidDetails.objects.filter(id=request.session["recieptid"],softdelete=0).exists():
        feepaiddata=FeesPaidDetails.objects.filter(id=request.session["recieptid"],softdelete=0)
    else:
        msg="Invalid Challan Number"
    return render(request,"cashier/printfeesreciept.html",{"institutedata":institutedata, "feepaiddata":feepaiddata,"msg":msg})



def cashierdatewisefeescollection(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    classid=""
    feepaiddatatotal=0
    if request.method == 'POST':
        fromdate=request.POST["fromdate"]
        todate=request.POST["todate"]
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        if FeesPaidDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            feepaiddata=FeesPaidDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
            feepaiddatatotal=FeesPaidDetails.objects.filter(createdon__range=[fromdate,todate],instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(totalcollection=Sum("amountpaid"))
            if not all(feepaiddatatotal.values()):
                feepaiddatatotal=0
            else:
                feepaiddatatotal=feepaiddatatotal["totalcollection"]
        else:
            msg="Record not found"
    return render(request,"cashier/cashierdatewisefeescollection.html",{"msg":msg,"feepaiddata":feepaiddata,"feepaiddatatotal":feepaiddatatotal})


def cashierstudentidwisefeescollection(request):
    classdata=""
    msg=""
    feepaiddata=""
    studentdata=""
    classid=""
    feepaiddatatotal=0
    if request.method == 'POST':
        studentid=request.POST["studentid"]
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        if FeesPaidDetails.objects.filter(studentid=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).exists():
            feepaiddata=FeesPaidDetails.objects.filter(studentid=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0)
            feepaiddatatotal=FeesPaidDetails.objects.filter(studentid=studentid,instituteid_id=instituteid,academicyearid_id=academicyearid,softdelete=0).aggregate(totalcollection=Sum("amountpaid"))
            if not all(feepaiddatatotal.values()):
                feepaiddatatotal=0
            else:
                feepaiddatatotal=feepaiddatatotal["totalcollection"]
        else:
            msg="Record not found"
    return render(request,"cashier/cashierstudentidwisefeescollection.html",{"msg":msg,"feepaiddata":feepaiddata,"feepaiddatatotal":feepaiddatatotal})


def cashiersettingprofile(request):
    return render(request,"cashier/cashiersettingprofile.html")


def cashiersettingpassword(request):
    return render(request,"cashier/cashiersettingpassword.html")



