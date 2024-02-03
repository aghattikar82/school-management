from nvsapp.common import * 

def operatorstaffcount(request):
    return render(request,"operator/operatorstaffcount.html")

def operatorfeessearch(request):
    msg = ''
    feesdata = ''
    classdata = ''
    if request.method == 'POST':
        action=request.POST['btnsubmit']
        if action=="Delete":
            fid=request.POST["fid"]
            if FeesMaster.objects.filter(id=fid).exists():
                feesdata=FeesMaster.objects.filter(id=fid)
                feesdata.update(softdelete=1)
                msg="Fees Removed Successfully"
            return render(request,"operator/operatorfeessearch.html",{"feesdata":feesdata,"msg":msg})
        else:
            search = request.POST['txtsearch']
            if FeesMaster.objects.filter(id=search,softdelete=0).exists():
                feesdata = FeesMaster.objects.filter(classid_id=search)
            else:
                msg = 'Record Not Found'
    classdata=Addclass.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    return render(request,"operator/operatorfeessearch.html",{"feesdata":feesdata,"msg":msg,"classdata":classdata})

def operatorsubstaffmapdisplay(request):
    msg=""
    data=""
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        iid=request.session["instituteid"]

        if action=="Update":
            mapid=request.POST["substaffmaptid"]
            data=SubjectStaffClassMapping.objects.filter(id=mapid,softdelete=0,instituteid=iid)
            data.update(subject=request.POST["txtsubjectid"],staffid=request.POST["txtstaffid"],Addclass=request.POST["txtclassid"],section=request.POST["txtsectionid"],updatedby=request.session["userid"],upadatedon=datetime.datetime.now())
            msg="Record Updated Successfully"
            return render(request,"operator/operatorsubstaffmapdisplay.html",{"data":data,"msg":msg})
        elif action == 'Delete':
            mapid=request.POST["substaffmaptid"]
            if SubjectStaffClassMapping.objects.filter(id=mapid,softdelete=0,instituteid=iid).exists():
                data = SubjectStaffClassMapping.objects.filter(id=mapid,softdelete=0,instituteid=iid)
                data.update(softdelete=1,deletedby=request.session["userid"],deletedon=datetime.date.now())
                msg = 'Subject Deleted Successfully'
                return render(request, 'operator/operatordisplaysubjects.html',
                              {'data': data, 'msg': msg})    
            
        elif action=="Edit":
            mapid=request.POST["substaffmaptid"]
            data=SubjectStaffClassMapping.objects.filter(id=mapid,softdelete=0,instituteid=iid)
            return render(request,"operator/operatoreditsubstaffmap.html",{"data":data})
        else: 
            classss=request.POST["cname"]
            sectionn=request.POST["sname"]
            if SubjectStaffClassMapping.objects.filter(softdelete=0,instituteid=iid,Addclass=classss,section=sectionn).exists():
                data=SubjectStaffClassMapping.objects.filter(softdelete=0,instituteid=iid,Addclass=classss,section=sectionn)
            else:
                msg="Record Not Found"

    sectiondata=Addsection.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    classdata=Addclass.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"operator/operatorsubstaffmapdisplay.html",{"institutedata":institutedata,"sectiondata":sectiondata,"classdata":classdata,"data":data,"msg":msg})

def operatorsubjectsdisplay(request):
    data = ''
    msg = ''
    if request.method=="POST":
        action = request.POST['btnsubmit']
        iid=request.session["instituteid"]
        if action=='Update':
            subid=request.POST['subid']
            data=MstSubject.objects.filter(id=subid,softdelete=0,instituteid=iid)
            data.update(subjectname=request.POST["subjectname"],subjecttype=request.POST["subtype"],optional=request.POST["op_com"],subjectcategory=request.POST["subcategory"],updatedby=request.session["userid"],upadatedon=datetime.datetime.now())
            msg="Subject Updeted Successfully"
            return render(request,"operator/operatordisplaysubjects.html",{"data":data,"msg":msg})

        elif action=="Edit":
            subid=request.POST['subjectid']
            data=MstSubject.objects.filter(id=subid,softdelete=0,instituteid=iid)
            return render(request,"operator/operatoreditsubjects.html",{"data":data,"mag":msg})

        elif action == 'Delete':
            subid=request.POST['subjectid']
            if MstSubject.objects.filter(id=subid,softdelete=0,instituteid=iid).exists():
                data = MstSubject.objects.filter(id=sectionid,softdelete=0,instituteid=iid)
                data.update(softdelete=1,deletedby=request.session["userid"],deletedon=datetime.date.now())
                msg = 'Subject Deleted Successfully'
                return render(request, 'operator/displaysubjects.html',
                              {'data': data, 'msg': msg})        
        else:
            search = request.POST['txtsearch']
            fieldname = request.POST['ddlfield']
            if search.isnumeric() and fieldname == 'subid':
                if MstSubject.objects.filter(id=search,instituteid=iid,softdelete=0).exists():
                    data = MstSubject.objects.filter(id=search,instituteid=iid,softdelete=0)
                else:
                    msg = 'Subject Not Found'
            else:
                if fieldname == 'subname':
                    if MstSubject.objects.filter(subjectname__icontains=search,instituteid=iid,softdelete=0).exists():
                        data = MstSubject.objects.filter(subjectname__icontains=search,instituteid=iid,softdelete=0)
                    else:
                        msg="Subject Not Found"
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"operator/operatordisplaysubjects.html",{"data":data,"msg":msg,"institutedata":institutedata})



def operatorassessmentdisplay(request):
    data = ''
    msg = ''
    if request.method=="POST":
        action = request.POST['btnsubmit']
        iid=request.session["instituteid"]
        if action=='Update':
            aid=request.POST['assid']
            data=MstAssesment.objects.filter(id=aid,softdelete=0,instituteid=iid)
            data.update(assesment_name=request.POST["asssname"],minimum_marks=request.POST["minmark"],maximum_marks=request.POST["maxmark"],updatedby=request.session["userid"],upadatedon=datetime.datetime.now())
            msg="Assesment Updeted Successfully"
            return render(request,"operator/operatorassessmentdisplay.html",{"data":data,"msg":msg})

        elif action=="Edit":
            aid=request.POST['assid']
            data=MstAssesment.objects.filter(id=aid,softdelete=0,instituteid=iid)
            return render(request,"operator/operatoreditassessment.html",{"data":data,"mag":msg})

        elif action == 'Delete':
            aid=request.POST['assid']
            if MstAssesment.objects.filter(id=aid,softdelete=0,instituteid=iid).exists():
                data = MstAssesment.objects.filter(id=sectionid,softdelete=0,instituteid=iid)
                data.update(softdelete=1,deletedby=request.session["userid"],deletedon=datetime.date.now())
                msg = 'Assessments Deleted Successfully'
                return render(request, 'operator/operatorassessmentdisplay.html',
                              {'data': data, 'msg': msg})        
        else:
            search = request.POST['txtsearch']
            fieldname = request.POST['ddlfield']
            if search.isnumeric() and fieldname == 'assid':
                if MstAssesment.objects.filter(id=search,instituteid=iid,softdelete=0).exists():
                    data = MstAssesment.objects.filter(id=search,instituteid=iid,softdelete=0)
                else:
                    msg = 'Assesments Not Found'
            else:
                if fieldname == 'assname':
                    if MstAssesment.objects.filter(assesment_name__icontains=search,instituteid=iid,softdelete=0).exists():
                        data = MstAssesment.objects.filter(assesment_name__icontains=search,instituteid=iid,softdelete=0)
                    else:
                        msg="Assessments Not Found"
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"operator/operatorassessmentdisplay.html",{"data":data,"msg":msg,"institutedata":institutedata})

def operatorsectiondisplay(request):
    data = ''
    msg = ''
    if request.method=="POST":
        iid=request.session["instituteid"]
        action = request.POST['btnsubmit']
        if action=='Update':
            sectionid=request.POST['secid']
            data=Addsection.objects.filter(id=sectionid,softdelete=0,instituteid=iid)
            data.update(sectionName=request.POST["sname"],upadatedby=request.session["userid"],updatedon=datetime.datetime.now())
            msg="Section Updeted Successfully"
            return render(request,"operator/operatordisplaysection.html",{"data":data,"msg":msg})

        elif action=="Edit":
            sectionid=request.POST["secid"]
            data=Addsection.objects.filter(id=sectionid,softdelete=0,instituteid=iid)
            return render(request,"operator/operatoreditsection.html",{"data":data,"mag":msg})

        elif action == 'Delete':
            sectionid = request.POST['secid']
            if Addsection.objects.filter(id=sectionid,softdelete=0,instituteid=iid).exists():
                data = Addsection.objects.filter(id=sectionid,softdelete=0,instituteid=iid)
                data.update(softdelete=1,deletedby=request.session["userid"],deletedon=datetime.date.now())
                msg = 'Section Deleted Successfully'
                return render(request, 'operator/displaysection.html',
                              {'data': data, 'msg': msg})        
        else:
            search = request.POST['txtsearch']
            fieldname = request.POST['ddlfield']
            if search.isnumeric() and fieldname == 'sectionid':
                if Addsection.objects.filter(id=search,softdelete=0,instituteid=iid).exists():
                    data = Addsection.objects.filter(id=search,softdelete=0,instituteid=iid)
                else:
                    msg = 'Section Not Found'
            else:
                if fieldname == 'sectionname':
                    if Addsection.objects.filter(sectionName__icontains=search,softdelete=0,instituteid=iid).exists():
                        data = Addsection.objects.filter(sectionName__icontains=search,instituteid=iid)
                    else:
                        msg="Section Not Found"


    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"operator/operatordisplaysection.html",{"data":data,"msg":msg,"institutedata":institutedata})


def operatorclassesdisplay(request):
    data = ''
    msg = ''
    if request.method=="POST":
        iid=request.session["instituteid"]
        action = request.POST['btnsubmit']
        if action=='Update':
            cid=request.POST['classid']
            data=Addclass.objects.filter(id=cid,softdelete=0,instituteid=iid)
            data.update(className=request.POST["classname"],upadatedby =request.session["userid"],updatedon=datetime.datetime.now())
            msg="Class Updeted Successfully"
            return render(request,"operator/operatorclassesdisplay.html",{"data":data,"msg":msg})

        elif action=="Edit":
            classid=request.POST["cid"]
            data=Addclass.objects.filter(id=classid)
            return render(request,"operator/operatoreditclass.html",{"data":data,"mag":msg})

        elif action == 'Delete':
            classid = request.POST['cid']
            if Addclass.objects.filter(id=classid,softdelete=0,instituteid=iid).exists():
                data = Addclass.objects.filter(id=classid,softdelete=0,instituteid=iid)
                data.update(softdelete=1,deletedby=request.session["userid"],deletedon=datetime.date.now())
                msg = 'Class Deleted Successfully'
                return render(request, 'operator/operatorclassesdisplay.html',
                              {'data': data, 'msg': msg})        
        else:
            search = request.POST['txtsearch']
            fieldname = request.POST['ddlfield']
            if search.isnumeric() and fieldname == 'classid':
                if Addclass.objects.filter(id=search,softdelete=0,instituteid=iid).exists():
                    data = Addclass.objects.filter(id=search,softdelete=0,instituteid=iid)
                else:
                    msg = 'Class Not Found'
            else:
                if fieldname == 'classname':
                    if Addclass.objects.filter(className__icontains=search,softdelete=0,instituteid=iid).exists():
                        data = Addclass.objects.filter(className__icontains=search,softdelete=0,instituteid=iid)
                    else:
                        msg="Class Not Found"

    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"operator/operatorclassesdisplay.html",{"data":data,"msg":msg,"institutedata":institutedata})

def operatorchangepassword(request):
    msg=""
    if request.method=="POST":
        usernumber=request.session["mobilenumber"]
        currentpassword=request.POST["txtcurrentpassword"]
        newpassword=request.POST["txtnewpassword"]
        confirmpassword=request.POST["txtconfirmpassword"]
        if newpassword != confirmpassword:
            msg="New Password & Confirm New Password must be Same"
        else:
            if UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0).exists():
                data=UserRegister.objects.filter(mobilenumber=usernumber,password=currentpassword,softdelete=0)
                data.update(password=newpassword)
                msg="Password Changed Successfully"
            else:
                msg="Invalid Current Password"
    return render(request,"operator/operatorchangepassword.html",{"msg":msg})

def operatorgetnewrollnumber(request):
    if request.method == 'POST':
        instituteid = request.session['instituteid']
        academicyearid = request.session['academicyearid']
        ClassNameid = request.POST["ClassNameid"]
        Section=request.POST["Section"]
        newrollnumber=StudentRegister.objects.filter(softdelete=0,section=Section,chooseclass=ClassNameid,instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).count()+1
        print(newrollnumber)
    return JsonResponse({'newrollnumber': list(str(newrollnumber))})


def operatorgetfees(request):
    if request.method == 'POST':
        instituteid = request.session['instituteid']
        academicyearid = request.session['academicyearid']
        ClassNameid = request.POST["ClassNameid"]
        Category=request.POST["Category"]
        feesdata=0
        feestemplate="ADMISSION"
        if FeesMaster.objects.filter(classid=request.POST["ClassNameid"],feesterm=12,category=request.POST["Category"],feestemplate=feestemplate,instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).exists():
            feesdata=FeesMaster.objects.filter(classid=request.POST["ClassNameid"],feesterm=12,category=request.POST["Category"],feestemplate="ADMISSION",instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).values_list("fees")[0]
    return JsonResponse({'feesdata': list(feesdata)})


def operatorhome(request):
    Staffcount = ""
    Sdatacount = ""
    hdatacount = ""
    Subjectcount = ""
    Adtacount = ""
    instituteid = request.session["instituteid"]
    Staffcount = UserRegister.objects.filter(
        softdelete=0,
        instituteid=instituteid,
    ).count()
    Sdatacount = StudentRegister.objects.filter(
        softdelete=0,
        instituteid=instituteid,
    ).count()
    hdatacount = AccountHead.objects.filter(softdelete=0).count()
    Subjectcount = MstSubject.objects.filter(
        softdelete=0,
        instituteid=instituteid,
    ).count()
    Adtacount = MstAssesment.objects.filter(
        softdelete=0,
        instituteid=instituteid,
    ).count()
    return render(
        request,
        "operator/operatorhome.html",
        {
            "Staffcount": Staffcount,
            "Sdatacount": Sdatacount,
            "hdatacount": hdatacount,
            "Subjectcount": Subjectcount,
            "Adtacount": Adtacount,
        },
    )

def operatorprofile(request):
    userprofildata=""
    userId=request.session["userid"]
    userprofildata=UserRegister.objects.filter(id=userId)
    return render(request,"operator/operatorprofile.html",{"userprofildata":userprofildata})

def operatordisplaystaffleave(request):
    datas=""
    instituteid=request.session["instituteid"]
    createdby=request.session["userid"]
    if LeaveStaff.objects.filter(instituteid=instituteid,createdby=createdby).exists():
        datas=LeaveStaff.objects.filter(instituteid=instituteid,createdby=createdby)
        msg=""
        
    else:
        msg="Record Not Found"
    return render(request,"operator/operatordisplaystaffleave.html",{"datas":datas,"msg":msg})




def operatorexpensehead(request):
    msg=""
    heads=""
    if request.method=="POST":
        eh=ExpenseHead()
        eh.expenseheadid_id=request.POST["expensehead"]
        eh.paidto=request.POST["paidto"]
        eh.paymentdate=request.POST["paymentdate"]
        eh.amountpaid=request.POST["amountpaid"]
        eh.paymentmode=request.POST["paymentmode"]
        eh.paymentdetails=request.POST["paymentdetails"]
        eh.instituteid_id=request.session["instituteid"]
        eh.academicyearid=request.session["academicyearid"]
        eh.createdby_id=request.session["userid"]
        eh.save()
        msg="Expense Head Added"
    else:
            msg=""
            heads=AccountHead.objects.filter(softdelete=0,instituteid_id=request.session["instituteid"])
    return render(request,"operator/operatorexpensehead.html",{"msg":msg,"heads":heads})



def operatorstudentattendance(request):
    attendancedata=""
    data=""
    datas=""
    student=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid).exists():
        attendancedata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid)
    if StudentRegister.objects.all().exists():
        studentdata=StudentRegister.objects.get(id=1)
        studentnamedata=studentdata.studentname
    return render(request,"operator/operatorstudentattendance.html",{"studentnamedata":studentnamedata,"attendancedata":attendancedata,"data":data,"datas":datas})


def operatormstsubject(request):
	msg=""
	if request.method=="POST":
		ms=MstSubject()
		ms.subjectname=request.POST["addsubject"]
		ms.subjecttype=request.POST["subjecttype"]
		ms.optional=request.POST["optional"]
		ms.subjectcategory=request.POST["subjectcategory"]
		ms.instituteid=request.session["instituteid"]
		ms.save()
		msg="Subject Added Successfully"
	return render(request,"operator/operatormstsubject.html",{"msg":msg})

def operatorfacultiesdisplay(request):
    data=""
    msg=""
    instituteid=0
    page_obj=""
    page_number=""
    institutedata=InstitutionProfile.objects.all()
    instituteid=request.POST.get("institutename","0")
    fieldname = request.POST.get("ddlfield","")
    search = request.POST.get("txtsearch","")

    if request.method=="POST":
        if  UserRegister.objects.filter(instituteid_id=instituteid,softdelete=0).exists():
            data=UserRegister.objects.filter(instituteid_id=instituteid,softdelete=0)

            if (fieldname=="facultyid"):
                if UserRegister.objects.filter(id=search,instituteid_id=instituteid,softdelete=0).exists():
                    data=UserRegister.objects.filter(id=search,instituteid_id=instituteid,softdelete=0)
                else:
                    msg="Record Not Found"
            
            if (fieldname=="facultyname"):
                if UserRegister.objects.filter(name__icontains=search,instituteid_id=instituteid,softdelete=0).exists():
                    data=UserRegister.objects.filter(name__icontains=search,instituteid_id=instituteid,softdelete=0)
                else:
                    msg="Record Not Found"
            elif fieldname=="facultymobilenumber":
                if UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=instituteid,softdelete=0).exists():
                    data=UserRegister.objects.filter(mobilenumber__icontains=search,instituteid=instituteid,softdelete=0)
                else:
                    msg="Record Not Found"
        p = Paginator(data,int(maxdata))
        page_number = request.POST.get('page')
        try:
            page_obj = p.get_page(page_number)
            print(page_obj)
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")
    return render(request,"operator/operatorfacultiesdisplay.html",{"institutedata":institutedata,"data":page_obj,"msg":msg,"instituteid":instituteid,"fieldname":fieldname,"search":search})


def operatorstudentdisplay(request):
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
    instituteid=request.session["instituteid"]
    classid=request.POST.get("classid","")
    sectionid=request.POST.get("sectionid","")
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
    return render(request,"operator/operatorstudentdisplay.html",{"data":page_obj,"academicyeardata":academicyeardata,"institutedata":institutedata,"classdata":classdata,"sectiondata":sectiondata,"search":search,"fieldname":fieldname,"academicyearid":academicyearid,"instituteid":instituteid,"classid":classid,"sectionid":sectionid})



def operatormstassesment(request):
	msg=""
	if request.method=="POST":
		ma=MstAssesment()
		ma.assesment_name=request.POST["assesment_name"]
		ma.minimum_marks=request.POST["minimum_marks"]
		ma.maximum_marks=request.POST["maximum_marks"]
		ma.instituteid_id=request.session["instituteid"]
		ma.createdby_id=request.session["userid"]
		ma.academicyearid_id=request.session["academicyearid"]
		ma.save()
		msg="Assesment Added Successfully"

	return render(request,"operator/operatormstassesment.html" ,{"msg":msg})

def operatorlanguagemapping(request):
	msg=""
	subject=""
	if request.method=="POST":
		if LanguageMapping.objects.filter(fl_id=request.POST["fl"],sl_id=request.POST["sl"],tl_id=request.POST["tl"]).exists():
			msg="Languages are already mapped"
		else:
			lm=LanguageMapping()
			lm.fl_id=request.POST['fl']
			lm.sl_id=request.POST['sl']
			lm.tl_id=request.POST['tl']
			lm.instituteid_id=request.session["instituteid"]
			lm.createdby_id=request.session["userid"]
			lm.save()
			msg="Language Mapped Successfully"
	else:
		msg=""
	subject=MstSubject.objects.filter(subjectcategory=1)
	return render(request,"operator/operatorlanguagemapping.html",{ "msg":msg,"subject":subject})

def operatorlanguagemappingdisplay(request):
    return render(request,"operator/operatorsubstaffmapdisplay.html")
def operatornoticecircular(request):
    msg=""
    data=""
    datas=""
    if request.method=="POST":
        d=NoticeCircular()
        d.classs_id=request.POST["textclass"]
        d.section_id=request.POST["textsection"]
        d.subject=request.POST["textsubject"]
        d.matter=request.POST["textmater"]
        d.instituteid_id=request.session["instituteid"]
        d.academicyearid_id=request.session["academicyearid"]
        d.createdby_id=request.session["userid"]
        file=request.FILES["myfile"]
        fs=FileSystemStorage()
        image=fs.save(file.name,file)
        d.image=fs.url(file)
        d.save()
        msg="Circular Saved Successfully"
    else:
        msg=""
    datas=Addclass.objects.all()
    data=Addsection.objects.all()
    return render(request,"operator/operatornoticecircular.html",{"msg":msg,"data":data,"datas":datas})

def operatorsubjectstaffclassmapping(request):
	msg=""
	staff=""
	subject=""
	mclass=""
	section=""
	if request.method=="POST":
		if SubjectStaffClassMapping.objects.filter(staffid_id=request.POST['select_staff'],subject_id=request.POST['select_subject'],Addclass_id=request.POST['select_mclass'],section_id=request.POST['select_section']).exists():
			msg="Subject Already Mapped"
		else:
			sm=SubjectStaffClassMapping()
			sm.staffid_id=request.POST['select_staff']
			sm.subject_id=request.POST['select_subject']
			sm.Addclass_id=request.POST['select_mclass']
			sm.section_id=request.POST['select_section']
			sm.instituteid_id=request.session["instituteid"]
			sm.academicyearid_id=request.session["academicyearid"]
			sm.createdby_id=request.session["userid"]
			sm.classteacher=request.POST['classteacher']
			sm.save()
			msg="Subject Successfully Mapped"
	else:
		msg=""
	staff=UserRegister.objects.filter(designation=10)
	subject=MstSubject.objects.all()
	mclass=Addclass.objects.all()
	section=Addsection.objects.all()
	return render(request,"operator/operatorsubjectstaffclassmapping.html",{ "msg":msg,"staff":staff,"subject":subject,"section":section,"mclass":mclass})





def operatormstsubject(request):
	msg=""
	if request.method=="POST":
		ms=MstSubject()
		ms.subjectname=request.POST["addsubject"]
		ms.subjecttype=request.POST["subjecttype"]
		ms.optional=request.POST["optional"]
		ms.subjectcategory=request.POST["subjectcategory"]
		ms.instituteid_id=request.session["instituteid"]
		ms.createdby_id=request.session["userid"]
		ms.academicyearid_id=request.session["academicyearid"]
		ms.save()
		msg="Subject Successfully Added "
	return render(request,"operator/operatormstsubject.html",{"msg":msg})



def operatorfeestemplate(request):
    msg = ""
    data = ""
    caste = ""
    headstype = ""
    templatehead=""
    classdata=Addclass.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    if Addclass.objects.filter(softdelete=0, instituteid_id=request.session["instituteid"]).exists():
        data = Addclass.objects.filter(softdelete=0, instituteid_id=request.session["instituteid"])
    if AccountHead.objects.filter(softdelete=0).exists():
        templatehead = AccountHead.objects.filter(softdelete=0)
    if request.method == "POST":
        if FeesMaster.objects.filter(classid=request.POST["class"],feesterm=request.POST["feesterm"],category=request.POST["category"],feestemplate=request.POST["feestemplate"].upper(),instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).exists():
            msg="Fees Template already Exists"
        else:
            ft = FeesMaster()
            ft.classid_id = request.POST["class"]
            ft.feesterm = request.POST["feesterm"]
            ft.category = request.POST["category"]
            ft.feestemplate = request.POST["feestemplate"].upper()
            ft.fees = request.POST["fees"]
            ft.instituteid_id=request.session["instituteid"]
            ft.createdby_id=request.session["userid"]
            ft.createdon=currentdate
            ft.academicyearid_id=request.session["academicyearid"]
            ft.save()
            msg = "Fees Template Created"
    return render(request,"operator/operatorfeestemplate.html",{"templatehead":templatehead,"msg": msg, "data": data, "caste": caste, "headstype": headstype,"classdata":classdata})


#!/usr/bin/python
# -*- coding: utf-8 -*-


def operatorcalender(request):
    msg = ''
    data = ''
    datas = ''
    if request.method == 'POST':
        if Calender.objects.filter(date=request.POST['date'],event=request.POST['txtevent']).exists():
            msg = 'Event Date Already exists'
        else:
            f = Calender()
            f.event = request.POST['txtevent']
            f.date = request.POST['date']
            f.instituteid_id = request.session['instituteid']
            f.academicyearid_id = request.session['academicyearid']
            f.createdby_id = request.session['userid']
            f.save()
            msg = 'Event Successfully Saved'
    else:
        msg = ''
    datas = Addclass.objects.filter(softdelete=0,instituteid_id=request.session['instituteid'])
    data = Addsection.objects.filter(softdelete=0,instituteid_id=request.session['instituteid'])
    return render(request, 'operator/operatorcalender.html',{'msg': msg, 'data': data, 'datas': datas})






def operatoraddcaste(request):
	msg=""
	if request.method=="POST":
		cst=Castes()
		cst.caste=request.POST["addcaste"]
		cst.instituteid=request.session["instituteid"];
		cst.save()
		msg="Caste Successfully Added"
	else:
		msg=""
	return render(request,"operator/operatormstaddcaste.html",{"msg":msg})


def operatorheads(request):
	msg=""
	if request.method=="POST":
		hd=AccountHead()
		hd.head=request.POST["head"]
		hd.select_liabilities=request.POST["select_liabilities"]
		hd.instituteid_id=request.session["instituteid"];
		hd.createdby_id=request.session["userid"]
		hd.save()
		msg="Accounts Head Successfully Added"
	return render(request,"operator/operatorheads.html",{"msg":msg} )


def operatoruserregister(request):
	msg=""
	data=""
	if request.method=="POST":
		if UserRegister.objects.filter(mobilenumber=request.POST['Mobile']).exists():
			msg="Mobile Number already exists"
		else:
			ur=UserRegister()
			ur.name=request.POST['name']
			ur.mobilenumber=request.POST['Mobile']
			ur.emailid=request.POST['emailid']
			ur.designation_id=request.POST['designation']
			ur.password=request.POST['Password']
			ur.instituteid_id=request.session["instituteid"];
			ur.createdby_id=request.session["userid"];
			if int(request.POST['designation'])==10:
				ur.homepage="facultyhome"
			elif int(request.POST['designation'])==11:
				ur.homepage="accountanthome"
			ur.save()
			msg="Registered Successfully"
	else:
		msg=""
	data=InstitutionProfile.objects.all()
	return render(request,"operator/operatoruserregister.html",{"msg":msg,"data":data})


def operatornewuser(request):
    msg = ""
    if request.method == "POST":
        s = UserRegister()
        s.FullName = request.POST["FullName"]
        s.Mobile = request.POST["Mobile"]
        s.Password = request.POST["Password"]
        s.UserRole = request.POST["UserRole"]
        s.registerdate = datetime.datetime.now().strftime("%d-%m-%Y")
        if int(request.POST["UserRole"]) == 100:
            s.homepage = "facultyhome"
        elif request.POST["UserRole"] == 101:
            s.homepage = "accountanthome"
        s.save()
        msg = "Save user Successfully"
    return render(request, "operator/newuserp.html", {"msg": msg})

def operatorcalenderevent(request):
	msg=""
	data=""
	datas=""
	if request.method=="POST":
		f=Calender()
		f.event=request.POST["txtevent"]
		f.date=request.POST["date"]
		f.instituteid_id=request.session["instituteid"];
		f.createdby_id=request.session["userid"];
		f.academicyearid_id=request.session["academicyearid"];

		f.save()
		msg="Event Added Successfully"
	else:
		msg=""
	datas = Addclass.objects.all()
	data = Addsection.objects.all()
	return render(request,"operator/operatorcalender.html",{"msg":msg,"data":data,"datas":datas})

def operatorstudentregister(request):
    msg = ''
    Castedata = ''
    Classdata = ''
    Sectiondata = ''
    religion = ''
    languagedata = ''
    subjectdata = ''
    instituteid=''
    Academic=''
    institutecode=InstitutionProfile.objects.filter(softdelete=0,id=request.session['instituteid']).values_list("institutecode")[0][0]
    cyear=datetime.datetime.now().strftime("%Y")
    admnumber=StudentRegister.objects.filter(softdelete=0,instituteid=request.session["instituteid"]).count()+1
    if admnumber<10:
        admnumber="00"+str(admnumber)
    elif admnumber>=10 and admnumber<100:
        admnumber="0"+str(admnumber)
    srn=institutecode+str(cyear)+str(admnumber)
    print(srn)
    if request.method == 'POST':
        sr = StudentRegister()
        sr.instituteid_id = request.session['instituteid']
        sr.createdby_id = request.session['userid']
        sr.academicyearid_id = request.POST['AYear']
        sr.admissiondate = request.POST['ADate']
        sr.chooseclass_id = request.POST['ClassName']
        sr.section_id = request.POST['Section']
        sr.admissionno=StudentRegister.objects.filter(softdelete=0,instituteid=request.session["instituteid"]).count()+1
        sr.rollno = StudentRegister.objects.filter(softdelete=0,section=request.POST['Section'],chooseclass=request.POST['ClassName'],instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).count()+1
        sr.srnumber=srn
        sr.studentname = request.POST['StudentName']
        sr.surname = request.POST['Surname']
        sr.aadhaarno = request.POST['Aadhaar']
        sr.gender = request.POST['Gender']
        sr.dateofbirth = request.POST['BirthDate']
        sr.category = request.POST['Category']
        sr.religion_id = request.POST['Religion']
        sr.caste_id = 1;#request.POST['Caste']
        sr.subcaste_id = 1;#request.POST['SubCaste']
        sr.nationality = request.POST['Nationality']
        sr.address = request.POST['Address']
        sr.state = request.POST['State']
        sr.mobileno = request.POST['MobileNo']
        sr.phoneno = request.POST['PhoneNo']
        sr.amount = request.POST['Amount']
        sr.discount = request.POST['Discount']
        sr.hostelfacility = request.POST['hostelfacility']
        sr.busfacility = request.POST['busfacility']
        sr.buscharge=request.POST['buscharge']
        sr.fathername = request.POST['FatherName']
        sr.fathereducation = request.POST['FatherEducation']
        sr.fatherdesignation = request.POST['FatherDesignation']
        sr.mothername = request.POST['MotherName']
        sr.mothereducation = request.POST['MotherEducation']
        sr.motherdesignation = request.POST['MotherDesignation']
        sr.mothertongue = request.POST['MotherTongue']
        sr.dependents = request.POST['Dependents']
        sr.annualincome = request.POST['AnnualIncome']
        sr.lastschool = request.POST['LastSchool']
        sr.tcno = request.POST['TCNo']
        sr.schoolbusroute = request.POST['schoolbusroute']
        sr.SchoolBus = request.POST['SchoolBus']
        sr.latitude = request.POST['Latitude']
        sr.longitude = request.POST['Longitude']
        sr.password = randrange(100000, 999999)

        studentphotos = request.FILES['studentphoto']
        fs = FileSystemStorage()
        studentphoto = fs.save(studentphotos.name, studentphotos)
        sr.studentphoto = fs.url(studentphoto)

        sr.bloodgroup = request.POST['bloodgroup']
        sr.save()

        sss = StudentSelectedSubject()

        sss.language = request.POST['language']
        sss.classid_id = request.POST['ClassName']
        sss.sectionid_id = request.POST['Section']
        sss.studentid_id = StudentRegister.objects.last().id  # selects the max id fromthe studentregister table
        sss.subjectid_id = request.POST['language']
        sss.subjecttype = 2
        sss.academicyearid_id = request.session['academicyearid']
        sss.instituteid_id = request.session['instituteid']
        sss.createdby_id = request.session['userid']
        sss.save()

        subdata = MstSubject.objects.filter(subjectcategory=2)
        for sb in subdata:
            sss = StudentSelectedSubject()
            sss.classid_id = request.POST['ClassName']
            sss.sectionid_id = request.POST['Section']
            sss.studentid_id = StudentRegister.objects.last().id  # selects the max id fromthe studentregister table
            sss.subjectid_id = request.POST.get(sb.subjectname, False)
            sss.subjecttype = 1
            sss.academicyearid_id = request.session['academicyearid']
            sss.instituteid_id = request.session['instituteid']
            sss.createdby_id = request.session['userid']
            sss.save()
            request.session['laststudentid']=StudentRegister.objects.last().id
        return redirect('studentdata')

        msg = 'Registered Successfully'

    if Castes.objects.all().exists():
        Castedata = Castes.objects.all()

    if Addclass.objects.all().exists():
        Classdata = Addclass.objects.all()

    if Addsection.objects.all().exists():
        Sectiondata = Addsection.objects.all()

    if Religion.objects.filter(softdelete=0).exists():
        religion = Religion.objects.filter(softdelete=0)

    if LanguageMapping.objects.all().exists():
        languagedata = LanguageMapping.objects.all()

    if MstSubject.objects.filter(subjectcategory=2).exists():
        subjectdata = MstSubject.objects.filter(subjectcategory=2)

    if AcademicMaster.objects.filter(isactive=1,softdelete=0).exists():
        Academic=AcademicMaster.objects.filter(isactive=1,softdelete=0)

    
    
    return render(request, 'operator/operatorstudentregister.html', {
        'msg': msg,
        'subjectdata': subjectdata,
        'Castedata': Castedata,
        'Classdata': Classdata,
        'Sectiondata': Sectiondata,
        'languagedata': languagedata,
        'religion': religion,
        'Academic':Academic,
        'srn':srn,
        })


def operatorstudentdocuments(request):
    if request.method=='POST':
        sd=StudentDocument()
        sd.studentid=request.session['laststudentid']

        Holticket=request.FILES["Holticket"]
        fs=FileSystemStorage()
        Holticket=fs.save(Holticket.name,Holticket)
        sd.Holticket=fs.url(Holticket)

        tc = request.FILES['tc']
        fs = FileSystemStorage()
        tc = fs.save(tc.name, tc)
        sd.tc = fs.url(tc)

        MarksCard = request.FILES['5thMarksCard']
        fs = FileSystemStorage()
        MarksCard = fs.save(MarksCard.name, MarksCard)
        sd.MarksCard = fs.url(MarksCard)

        CasteCertificate = request.FILES['CasteCertificate']
        fs = FileSystemStorage()
        CasteCertificate = fs.save(CasteCertificate.name, CasteCertificate)
        sd.CasteCertificate = fs.url(CasteCertificate)

        IncomeCertificate = request.FILES['IncomeCertificate']
        fs = FileSystemStorage()
        IncomeCertificate = fs.save(IncomeCertificate.name, IncomeCertificate)
        sd.IncomeCertificate = fs.url(IncomeCertificate)

        

        Aadhaar = request.FILES['Aadhaar']
        fs = FileSystemStorage()
        Aadhaar = fs.save(Aadhaar.name, Aadhaar)
        sd.Aadhaar = fs.url(Aadhaar)

        BankPassbook = request.FILES['BankPassbook']
        fs = FileSystemStorage()
        BankPassbook = fs.save(BankPassbook.name, BankPassbook)
        sd.BankPassbook = fs.url(BankPassbook)

        Rationcard = request.FILES['Rationcard']
        fs = FileSystemStorage()
        Rationcard = fs.save(Rationcard.name, Rationcard)
        sd.Rationcard = fs.url(Rationcard)

        Photho = request.FILES['Photho']
        fs = FileSystemStorage()
        Photho = fs.save(Photho.name, Photho)
        sd.Photho = fs.url(Photho)

        Handicappedcertificate = request.FILES['Handicappedcertificate']
        fs = FileSystemStorage()
        Handicappedcertificate = fs.save(Handicappedcertificate.name, Handicappedcertificate)
        sd.Handicappedcertificate = fs.url(Handicappedcertificate)

        Medicalcertificate = request.FILES['Medicalcertificate']
        fs = FileSystemStorage()
        Medicalcertificate = fs.save(Medicalcertificate.name, Medicalcertificate)
        sd.Medicalcertificate = fs.url(Medicalcertificate)

        Bond = request.FILES['Bond']
        fs = FileSystemStorage()
        Bond = fs.save(Bond.name, Bond)
        sd.Bond = fs.url(Bond)
        return redirect('operatorregisterstudentdata')
    return render(request,'operator/studentdocuments.html')






def operatorgenerateidcard(request):
	msg=""	
	data=""
	Classdata=""
	Sectiondata=""
	studentclassdata=""
	studentclassdataclass="NA"
	Institutiondata="NA"
	studentsectiondatasection=""
	if Addclass.objects.all().exists():
		Classdata=Addclass.objects.all()

	if Addsection.objects.all().exists():
		Sectiondata=Addsection.objects.all()

	if request.method=="POST":
		classes=request.POST["class"]
		section=request.POST["section"]
		if StudentRegister.objects.filter(chooseclass=classes,section=section).exists():
			data=StudentRegister.objects.filter(chooseclass=classes,section=section)
			if Addclass.objects.filter(id=classes).exists():
				studentclassdata=Addclass.objects.get(id=classes)
				studentclassdataclass=studentclassdata.className
			if Addsection.objects.filter(id=classes).exists():
				studentsectiondata=Addsection.objects.get(id=classes)
				studentsectiondatasection=studentsectiondata.sectionName
			else:
				studentsectiondatasection=""
			Institutiondata=InstitutionProfile.objects.get(id=request.session["instituteid"])
		else:
			msg="Record Not Found"
		return render(request,"operator/operatorgenerateidcard.html",{"msg":msg, "data":data,"Classdata":Classdata,"Sectiondata":Sectiondata,"studentclassname":studentclassdataclass,"studentsectionname":studentsectiondatasection,"Institutioncode":Institutiondata})
	return render(request,"operator/operatorgenerateidcard.html",{"msg":msg, "data":data,"Classdata":Classdata,"Sectiondata":Sectiondata})




def operatormessage(request):
	msg=""
	dataclass=""
	datasection=""
	studentdata=""
	if request.method=="POST":
		s=message()
		s.messagedate=request.POST["txtMessageDate"]
		s.messagetitle=request.POST["Title"]
		s.messagedetails=request.POST["Details"]
		s.academicyearid=request.session["academicyearid"]
		s.save()
		msg="Messages Sent Successfully"
	else:
		msg=""
	dataclass= Addclass.objects.all()
	datasection= Addsection.objects.all()
	studentdata=studentregister.objects.all()
	return render(request,"operator/operatormessage.html",{"msg":msg,"dataclass":dataclass,"datasection":datasection,"studentdata":studentdata})


def operatoraddclass(request):
	msg=""
	if request.method=="POST":
		if Addclass.objects.filter(className=request.POST['txtAddclass']).exists():
			msg="Calss Already Exists"
		else:
			a=Addclass()
			a.className=request.POST['txtAddclass']
			a.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
			a.instituteid_id=request.session["instituteid"]
			a.createdby_id=request.session["userid"]
			a.save()
			msg="Class Added Successfully"
	else:
		msg=""
	return render(request,"operator/operatoraddclass.html",{"msg":msg})

def operatoraddsection(request):
	msg=""
	if request.method=="POST":
		if Addsection.objects.filter(sectionName=request.POST['txtAddsection']).exists():
			msg="already save"
		else:
			a=Addsection()
			a.sectionName=request.POST['txtAddsection']
			a.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
			a.instituteid_id=request.session["instituteid"]
			a.createdby_id=request.session["userid"]
			a.save()
			msg="Section Added Successfully"
	else:
		msg=""
	return render(request,"operator/operatoraddsection.html",{"msg":msg})

def operatortimetabledisplay(request):
    data=""
    mp1=""
    data=""
    timetabledata=""
    staffname=""
    classname=""
    sectioname=""
    subjectstaffmap=""
    classdata=Addclass.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0);
    sectiondata=Addsection.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0);
    if request.method=="POST":
        classid=request.POST["class"]
        sectionid=request.POST["section"]
        classname=Addclass.objects.filter(id=classid,softdelete=0,instituteid_id=request.session["instituteid"])
        for c in classname:
            classname=c.className
        sectionname=Addsection.objects.filter(id=sectionid,softdelete=0,instituteid_id=request.session["instituteid"])
        for s in sectionname:
            sectioname=s.sectionName
        subjectstaffmap=SubjectStaffClassMapping.objects.filter(Addclass=classid,section=sectionid,instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"])
        staffname=UserRegister.objects.filter(instituteid_id=request.session["instituteid"])
        timetabledata=TimeTableSchedule.objects.filter(classid=classid,sectionid=sectionid,instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"])    
    else:
        data=""
        p_subjectstaffmapid=""
    return render(request,"operator/operatortimetabledisplay.html",{"timetabledata":timetabledata,"classdata":classdata,"sectiondata":sectiondata,"subjectstaffmap":subjectstaffmap,"classname":classname,"sectioname":sectioname,"staffname":staffname})


def operatortimetable(request):
    msg=""
    ddlclassid=""
    ddlsectionid=""
    ddlclasses=""
    ddlsectiones=""
    subject=""
    staffname=""
    sectiondata=""
    classdata=""
    subjectdata=""
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        if action=="Create TimeTable":
            ddlsectiones =request.POST["section"]
            ddlclasses =request.POST["classid"]
            ddlclassid=ddlclasses
            ddlsectionid=ddlsectiones
            if SubjectStaffClassMapping.objects.filter(Addclass=ddlclasses,section=ddlsectiones,instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"]).exists():
                subjectdata=SubjectStaffClassMapping.objects.filter(Addclass=ddlclasses,section=ddlsectiones,instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"])
                ddlclasses=Addclass.objects.filter(id=ddlclasses).values("className")
                for d in ddlclasses:
                    ddlclasses=d["className"]
                ddlsectiones=Addsection.objects.filter(id=ddlsectiones).values("sectionName")
                for d in ddlsectiones:
                    ddlsectiones=d["sectionName"]
                staff=SubjectStaffClassMapping.objects.filter(Addclass=request.POST["classid"],section=request.POST["section"],instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"])
        elif action=="Save TimeTable":
            ts=TimeTableSchedule()
            ts.classid_id=request.POST["classid"]
            ts.sectionid_id=request.POST["section"]
            ts.mp1_id=request.POST["mp1"]
            ts.mp2_id=request.POST["mp2"]
            ts.mp3_id=request.POST["mp3"]
            ts.mp4_id=request.POST["mp4"]
            ts.mp5_id=request.POST["mp5"]
            ts.mp6_id=request.POST["mp6"]
            ts.mp7_id=request.POST["mp7"]
            ts.tup1_id=request.POST["tup1"]
            ts.tup2_id=request.POST["tup2"]
            ts.tup3_id=request.POST["tup3"]
            ts.tup4_id=request.POST["tup4"]
            ts.tup5_id=request.POST["tup5"]
            ts.tup6_id=request.POST["tup6"]
            ts.tup7_id=request.POST["tup7"]
            ts.wp1_id=request.POST["wp1"]
            ts.wp2_id=request.POST["wp2"]
            ts.wp3_id=request.POST["wp3"]
            ts.wp4_id=request.POST["wp4"]
            ts.wp5_id=request.POST["wp5"]
            ts.wp6_id=request.POST["wp6"]
            ts.wp7_id=request.POST["wp7"]
            ts.thp1_id=request.POST["thp1"]
            ts.thp2_id=request.POST["thp2"]
            ts.thp3_id=request.POST["thp3"]
            ts.thp4_id=request.POST["thp4"]
            ts.thp5_id=request.POST["thp5"]
            ts.thp6_id=request.POST["thp6"]
            ts.thp7_id=request.POST["thp7"]
            ts.fp1_id=request.POST["fp1"]
            ts.fp2_id=request.POST["fp2"]
            ts.fp3_id=request.POST["fp3"]
            ts.fp4_id=request.POST["fp4"]
            ts.fp5_id=request.POST["fp5"]
            ts.fp6_id=request.POST["fp6"]
            ts.fp7_id=request.POST["fp7"]
            ts.sap1_id=request.POST["sap1"]
            ts.sap2_id=request.POST["sap2"]
            ts.sap3_id=request.POST["sap3"]
            ts.sap4_id=request.POST["sap4"]
            ts.instituteid_id=request.session["instituteid"]
            ts.academicyearid_id=request.session["academicyearid"]
            ts.createdby_id=request.session["userid"]
            ts.save()
            msg="TimeTable Created Successfully"
        else:
            msg=""
    classdata=Addclass.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    sectiondata=Addsection.objects.filter(softdelete=0,instituteid=request.session["instituteid"])
    classdatas=SubjectStaffClassMapping.objects.filter(instituteid=request.session["instituteid"],academicyearid=request.session["academicyearid"],)
    return render(request,"operator/operatortimetable.html",{"sectiondata":sectiondata,"subjectdata":subjectdata,"classdata":classdata,"staffname":staffname,"subject":subject,"msg":msg,"classdata":classdata,"ddlclasses":ddlclasses,"ddlsectiones":ddlsectiones,"ddlclassid":ddlclassid,"ddlsectionid":ddlsectionid})




def operator_studentregisterdata(request):
    msg=""
    data=""
    studentid=request.session['laststudentid']
    data=StudentRegister.objects.filter(id=studentid)
    msg="Registered Successfully"

    return render(request,'operator/operatorstudentdata.html',
        {
        "msg":msg,
        "data":data,
        })
