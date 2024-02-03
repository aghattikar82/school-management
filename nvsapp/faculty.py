from nvsapp.common import * 

def staffviewfeedback(request):
    return render(request,"faculty/staffviewfeedback.html")

def promotestudents(request):
    msg=""
    attendancedata=""
    data=""
    datas=""
    student=""
    studentdata=""
    txtclass=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        if action=="Get Student":
            txtclass=request.POST["class"]
            subjectstaffmappingid=request.POST["class"]
            classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"],classteacher='Yes')
            studentdata=StudentRegister.objects.filter(chooseclass=classsectiondata.Addclass,section=classsectiondata.section)
            passedstudents=studentdata.objects.filter()
            promotedstudents=AssessmentMarks.objects.filter(instituteid_id=instituteid,classs_id=classid,studentid_id=studentid,assessmentid_id=6,subjectresult="F").count()
        elif action=="Submit":
            msg="WRITE PROMOTION CODE HERE"
    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes').exists():
        attendancedata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes')
    return render(request,"faculty/promotestudents.html",{"attendancedata":attendancedata,"data":studentdata,"sclass":txtclass,"msg":msg})



def facultypendingstudentleaves(request):
    msg=""
    data=""
    leavedata=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    studentid=""
    classid=""
    sectionsid=""
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        if action=="Approve":
            lid=request.POST["leaveid"]
            leavedata=StudentLeave.objects.filter(id=lid,academicyearid=academicyearid,softdelete=0, instituteid=instituteid)
            leavedata.update(leavestatus="APPROVED",updatedby=request.session["userid"],upadatedon=datetime.datetime.now().strftime("%d-%m-%Y"))
            msg="Leave Approved"
        elif action=="Reject":
            lid=request.POST["leaveid"]
            leavedata=StudentLeave.objects.filter(id=lid,academicyearid=academicyearid,softdelete=0,instituteid=instituteid)
            leavedata.update(leavestatus="REJECTED",updatedby=request.session["userid"],upadatedon=datetime.datetime.now().strftime("%d-%m-%Y"))
            msg="Leave Rejected"
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,leavestatus="PENDING",staffid=request.session["userid"])
    return render(request,"faculty/facultystudentpendingleaves.html",{"leavedata":leavedata,"msg":msg})    


def facultyapprovedstudentleaves(request):
    msg=""
    leavedata=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,softdelete=0,instituteid=instituteid,leavestatus="APPROVED")
    return render(request,"faculty/facultyapprovedstudentleaves.html",{"leavedata":leavedata,"msg":msg})


def facultyrejectedstudentleaves(request):
    msg=""
    leavedata=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,softdelete=0,instituteid=instituteid,leavestatus="REJECTED")
    return render(request,"faculty/facultyrejectedstudentleaves.html",{"leavedata":leavedata,"msg":msg})


def staffpendingleavedisplay(request):
    msg=""
    data=""
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        iid=request.session['instituteid']
        if action=="Cancel":
            lid=request.POST["leaveid"]
            leavedata=LeaveStaff.objects.filter(id=lid,softdelete=0,instituteid=iid)
            leavedata.update(softdelete=1,leavestatus="CANCELLED",updatedby=request.session["userid"],updatedon=datetime.datetime.now())
            msg="Leave Cancelled"
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="PENDING")
    
    return render(request,"faculty/staffpendingleavedisplay.html",{"leavedata":leavedata,"msg":msg})


def facultyapprovedleaves(request):
    msg=""
    data=""
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="APPROVED")
    return render(request,"faculty/facultyapprovedleaves.html",{"leavedata":leavedata,"msg":msg})

def facultyrejectedleaves(request):
    msg=""
    data=""
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=0,instituteid=iid,leavestatus="REJECTED")
    return render(request,"faculty/facultyrejectedleaves.html",{"leavedata":leavedata,"msg":msg})

def facultycancelledleaves(request):
    msg=""
    data=""
    acid=request.session["academicyearid"]
    iid=request.session['instituteid']
    leavedata=LeaveStaff.objects.filter(academicyearid=acid,softdelete=1,instituteid=iid,leavestatus="Cancelled")
    return render(request,"faculty/facultycancelledleaves.html",{"leavedata":leavedata,"msg":msg})


def staffstudentattendancedisplay(request):
    data=""
    datas=""
    displaydata=""
    attendancedata=""
    selectedsubject=""
    selectedclass="" 
    selectedsection=""
    taughtdate=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if request.method=="POST":
        print("am in function")
    
        subjectstaffmappingid=request.POST["class"]
        selecteddate=request.POST["textdate"]
        datearr=selecteddate.split("-")
        newdate=datearr[2]+"-"+datearr[1]+"-"+datearr[0  ]

        classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"])
        selectedclass=classsectiondata.Addclass
        selectedsection=classsectiondata.section
        attendancedata=studentAttendance.objects.filter(classid_id=classsectiondata.Addclass,sectionid_id=classsectiondata.section,createdby_id=request.session["userid"],createdon=newdate)
        for dd in attendancedata:
            print(dd.attendancestatus)
    if SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"]).exists():
        sectiondata=SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"]) 
    return render(request,"faculty/staffstudentattendancedisplay.html",{"sectiondata":sectiondata,"attendancedata":attendancedata,"class":selectedclass,"section":selectedsection})

def studentattendancedisplay(request):
    msg=""
    Attendance=""
    classes=""
    newdate=""
    Iid=""
    classes=Addclass.objects.all()
    if request.method=="POST":
        classid=request.POST["class"]
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        #studentid=request.session["studentid"]
        Staffid=request.session["userid"]
        if studentAttendance.objects.filter(classid=classid,instituteid=instituteid,academicyearid=academicyearid,staffid=Staffid).exists():
            Attendance=studentAttendance.objects.filter(classid=classid,instituteid=instituteid,academicyearid=academicyearid,staffid=Staffid)
    return render(request,"faculty/studentattendancedisplay.html",{"msg":msg,"Attendance":Attendance,"classes":classes})

def facultysettingpassword(request):
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
    return render(request,"faculty/cngpassword.html",{"msg":msg})







def facultysettingprofile(request):
    userprofildata=""
    userId=request.session["userid"]
    userprofildata=UserRegister.objects.filter(id=userId)
    return render(request,"faculty/facultyprofiledisplay.html",{"userprofildata":userprofildata})




def gethomework(request):
    if request.method=="POST":
        subjectid=request.POST["subjectid"]
        subjectdata=MstSubject.objects.filter(id=subjectid)
    return JsonResponse({"subjectdata":list(subjectdata.values())})

def getclasssubject(request):
    if request.method=="POST":
        tag=request.POST["subjectid"].split("_")
        subjectid=tag[0]
        subjectdata=MstSubject.objects.filter(id=subjectid)
    
    return JsonResponse({"subjectdata":list(subjectdata.values())})

def facultyapplyleave(request):
    msg=""
    if request.method=="POST":
        sd=LeaveStaff()
        sd.subject=request.POST["textsubject"]
        sd.leavedate=request.POST["leavedate"]
        sd.end_date=request.POST["enddate"]
        sd.text=request.POST["textsa"]
        sd.instituteid_id=request.session["instituteid"]
        sd.academicyearid_id=request.session["academicyearid"]
        sd.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
        sd.createdby_id=request.session["userid"]
        sd.save()
        msg="Leave applied successfully"
    else:
        msg=""
    return render(request,"faculty/facultyapplyleave.html",{"msg":msg})



def facultystudentattendance(request):
    msg=""
    attendancedata=""
    data=""
    datas=""
    student=""
    studentdata=""
    txtclass=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if request.method=="POST":
        action=request.POST["btnsubmit"]
        if action=="Get Student":
            txtclass=request.POST["class"]
            subjectstaffmappingid=request.POST["class"]
            classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"],classteacher='Yes')
            studentdata=StudentRegister.objects.filter(chooseclass=classsectiondata.Addclass,section=classsectiondata.section)
        elif action=="Submit Attendance":
                subjectstaffmappingid=request.POST["txtclass"]
                classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"],classteacher='Yes')
                if studentAttendance.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classid=classsectiondata.Addclass,sectionid=classsectiondata.section,createdon=datetime.datetime.now().strftime("%d-%m-%Y")).count()>0:
                    msg="Attendance already Submitted"
                else:
                    studentdata=StudentRegister.objects.filter(chooseclass=classsectiondata.Addclass,section=classsectiondata.section)
                    if request.method=="POST":
                        if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes').exists():
                            attendancedata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes')
                            for sd in studentdata:
                                tag="SID"+str(sd.id)
                                att= request.POST[tag].split("_")
                                hs=studentAttendance()
                                hs.staffid_id=request.session["userid"]
                                if att[1]=="1" :
                                    hs.attendancestatus="P"
                                else:
                                    hs.attendancestatus="A"

                                hs.studentid_id=sd.id
                                hs.classid_id=classsectiondata.Addclass_id
                                hs.sectionid_id=classsectiondata.section_id
                                hs.academicyearid_id=request.session["academicyearid"]
                                hs.instituteid_id=request.session["instituteid"]
                                hs.createdby_id=request.session["userid"]
                                hs.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
                                hs.save()
                                studentdata=""
                                txtclass=""
                                msg="Attendance Submitted Successfully" 
                        else:
                            msg=""
    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes').exists():
        attendancedata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],classteacher='Yes')
    return render(request,"faculty/facultystudentattendance.html",{"attendancedata":attendancedata,"data":studentdata,"sclass":txtclass,"msg":msg})

def facultyhome(request):
    HomeWorkcount = ""
    Staffcount = ""
    Classworkcount = ""
    Sdatacount = ""
    Subjectcount = ""
    academicyearid = request.session["academicyearid"]
    mobilenumber = request.session["userid"]
    instituteid = request.session["instituteid"]
    Sdatacount = StudentRegister.objects.filter(
        softdelete=0,
        instituteid=instituteid,
        academicyearid=academicyearid,
    ).count()
    Staffcount = SubjectStaffClassMapping.objects.filter(
        softdelete=0, instituteid=instituteid, academicyearid=academicyearid
    ).count()
    Classworkcount = Classwork.objects.filter(
        softdelete=0, instituteid=instituteid, academicyearid=academicyearid
    ).count()
    HomeWorkcount = HomeWork.objects.filter(
        softdelete=0, instituteid=instituteid, academicyearid=academicyearid
    ).count()
    leavecount = LeaveStaff.objects.filter(
        softdelete=0,
        instituteid=instituteid,
    ).count()
    Subjectcount = SubjectStaffClassMapping.objects.filter(
        softdelete=0, instituteid=instituteid, academicyearid=academicyearid
    ).count()
    return render(
        request,
        "faculty/facultyhome.html",
        {
            "Sdatacount": Sdatacount,
            "Staffcount": Staffcount,
            "Classworkcount": Classworkcount,
            "HomeWorkcount": HomeWorkcount,
            "Subjectcount": Subjectcount,
            "leavecount": leavecount,
        },
    )





def facultygetsubject(request):
    if request.method == 'POST':
        mappingid = request.POST['classid']
        instituteid = request.session['instituteid']
        academicyearid = request.session['academicyearid']
        subjectdata = \
            SubjectStaffClassMapping.objects.filter(id=mappingid,
                instituteid=instituteid, academicyearid=academicyearid,
                softdelete=0)
        print(subjectdata.values())
    return JsonResponse({'subjectdata': list(subjectdata.values())})


def facultygetsection(request):
    section = ''
    if request.method == 'POST':
        classid = request.POST['classid']
        instituteid = request.session['instituteid']
        academicyearid = request.session['academicyearid']
        section = \
            SubjectStaffClassMapping.objects.filter(Addclass_id=classid,
                instituteid_id=instituteid,
                academicyearid_id=academicyearid)
    for ss in section:
        print (ss_section_id)

    return JsonResponse({'section': list(section.values())})






def homework(request):
    msg=""
    classdata=""
    studentdata=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    currentdate=datetime.datetime.today().strftime('%d-%m-%Y')
    academicyear=str(currentdate)

    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"]).exists():
        classdata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"])

    if request.method=="POST":
        tagdata=request.POST["className"].split("_");
        subjectid=tagdata[0];
        classid=tagdata[1]
        sectionid=tagdata[2]
        if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"]).exists():
            studentdata=StudentRegister.objects.filter(chooseclass_id=classid,section_id=sectionid)
            if HomeWork.objects.filter(workdate=request.POST["txtDate"],ChooseClass_id=classid,ChooseSection_id=sectionid,subjects_id=subjectid).exists():
                msg="HomeWork Already Add "
            else:
                c=HomeWork()
                c.Staffid_id=request.session["userid"]
                c.workdate=request.POST["txtDate"]
                c.workdetail=request.POST["txtWorkData"]
                c.ChooseClass_id=classid
                c.ChooseSection_id=sectionid
                c.subjects_id=subjectid
                c.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
                c.createdby_id=request.session["userid"]
                c.instituteid_id=request.session["instituteid"]
                c.academicyearid_id=request.session["academicyearid"]
                c.save()
                msg="Home Work Saved Successfully"
        else:
            msg=""
    return render(request,"faculty/homework.html",{"msg":msg,"classdata":classdata,"academicyear":academicyear,"studentdata":studentdata})



def classwork(request):
    msg=""
    classdata=""
    studentdata=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    currentdate=datetime.datetime.today().strftime('%d-%m-%Y')
    academicyear=str(currentdate)
    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"]).exists():
        classdata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"])
    if request.method=="POST":
        tagdata=request.POST["className"].split("_");
        subjectid=tagdata[0];
        classid=tagdata[1]
        sectionid=tagdata[2]
        if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"]).exists():
            studentdata=StudentRegister.objects.filter(chooseclass_id=classid,section_id=sectionid)
            if Classwork.objects.filter(classconducted_date=request.POST["WDate"],ChooseClass_id=classid,ChooseSection_id=sectionid,subjects_id=subjectid).exists():
                msg="Classwork Already Add "
            else:
                h=Classwork()
                h.Staffid_id=request.session["userid"]
                h.classconducted_date=request.POST["WDate"]
                h.workdetails=request.POST["WorkDetails"]
                h.ChooseClass_id=classid
                h.ChooseSection_id=sectionid
                h.subjects_id=subjectid
                h.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
                h.createdby_id=request.session["userid"]
                h.instituteid_id=request.session["instituteid"]
                h.academicyearid_id=request.session["academicyearid"]
                h.save()
                msg="Class Work Saved Successfully"
        else:
            msg=""  
    return render(request,"faculty/classwork.html",{"msg":msg,"classdata":classdata,"academicyear":academicyear,"studentdata":studentdata})







def homeworkdisplay(request):
    data=""
    datas=""
    displaydata=""
    homeworkdata=""
    selectedsubject=""
    selectedclass="" 
    selectedsection=""
    taughtdate=""
    classsectiondata=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if request.method=="POST":
        subjectstaffmappingid=request.POST["class"]
        selecteddate=request.POST["textdate"]
        datearr=selecteddate.split("-")
        newdate=datearr[2]+"-"+datearr[1]+"-"+datearr[0]
        classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"],softdelete=0,instituteid_id=request.session["instituteid"],academicyearid_id=request.session["academicyearid"])
        selectedsubject=classsectiondata.subject
        selectedclass=classsectiondata.Addclass
        selectedsection=classsectiondata.section
        homeworkdata=HomeWork.objects.filter(subjects_id=classsectiondata.subject, ChooseClass=classsectiondata.Addclass,ChooseSection=classsectiondata.section,createdby=request.session["userid"],workdate=newdate)
    if SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],softdelete=0).exists():
        sectiondata=SubjectStaffClassMapping.objects.filter(instituteid=instituteid,academicyearid=academicyearid,staffid=request.session["userid"],softdelete=0)
    return render(request,"faculty/homeworkdisplay.html",{"sectiondata":sectiondata,"homeworkdata":homeworkdata,"class":selectedclass,"section":selectedsection,"subject":selectedsubject})     


def classworkdisplay(request):
    data=""
    datas=""
    displaydata=""
    classworkdata=""
    selectedsubject=""
    selectedclass="" 
    selectedsection=""
    taughtdate=""
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    if request.method=="POST":
        subjectstaffmappingid=request.POST["class"]
        selecteddate=request.POST["textdate"]
        datearr=selecteddate.split("-")
        newdate=datearr[2]+"-"+datearr[1]+"-"+datearr[0  ]

        classsectiondata=SubjectStaffClassMapping.objects.get(id=subjectstaffmappingid,staffid=request.session["userid"])
        selectedsubject=classsectiondata.subject
        selectedclass=classsectiondata.Addclass
        selectedsection=classsectiondata.section

        classworkdata=Classwork.objects.filter(subjects_id=classsectiondata.subject, ChooseClass_id=classsectiondata.Addclass,ChooseSection_id=classsectiondata.section,createdby_id=request.session["userid"],classconducted_date=newdate)
    if SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"]).exists():
        sectiondata=SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"])
    return render(request,"faculty/classworkdisplay.html",{"sectiondata":sectiondata,"classworkdata":classworkdata,"class":selectedclass,"section":selectedsection,"subject":selectedsubject})      




def assessmentmarksdisplay(request):
    instituteid=request.session["instituteid"]
    academicyearid=request.session["academicyearid"]
    msg = ''
    action=""
    assessment=''
    sectionid=""
    assementtypeid=""
    classesid=""
    subjectid=""
    assementtype=""
    Assessmentdata=""
    classname=""
    sectionname=""
    subjectname=""
    classsection = \
    SubjectStaffClassMapping.objects.filter(staffid_id=request.session['userid'], academicyearid_id=request.session['academicyearid'],instituteid_id=request.session['instituteid'])
    if request.method=='POST':
        tagdata = request.POST['className'].split('_')
        sectionid = tagdata[2]
        classesid = tagdata[1]
        subjectid = tagdata[0]
        classname=Addclass.objects.filter(softdelete=0,instituteid_id=request.session['instituteid'],id=classesid)
        for cn in classname:
            classname=cn.className
        sectionname=Addsection.objects.filter(softdelete=0,instituteid_id=request.session['instituteid'],id=sectionid)
        for sc in sectionname:
            sectionname=sc.sectionName

        subjectname=MstSubject.objects.filter(softdelete=0,instituteid_id=request.session['instituteid'],id=subjectid)
        for sn in subjectname:
            subjectname=sn.subjectname

        assementtypeid = request.POST['assissmentname']
        Assessmentdata=AssessmentMarks.objects.filter(classs_id=classesid,section_id=sectionid,subject_id=subjectid,assessmentid_id=assementtypeid,createdby_id=request.session["userid"])
        for  ast in Assessmentdata:
            if int(assementtypeid)==int(ast.assessmentid_id):
                assementtype=str(ast.assessmentid)
    if SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"]).exists():
        classsection=SubjectStaffClassMapping.objects.filter(instituteid_id=instituteid,academicyearid_id=academicyearid,staffid_id=request.session["userid"])
        assessment=MstAssesment.objects.filter(softdelete=0)
    return render(request, 'faculty/assessmentmarksdisplay.html', {
        'msg': msg,
        'assessment':assessment,
        'classsection':classsection,
        'Assessmentdata':Assessmentdata,
        "sectionid":sectionname,
        "assementtypeid":assementtype,
        "classesid":classname,
        "subjectid":subjectname,
        })



def assessmentmarks(request):
    msg = ''
    subject = ''
    classsection = ''
    student = ''
    ddlclasses = ''
    ddlsectiones = ''
    ddlsubject = ''
    asssementtype = ''
    classname=""
    sectionname=""
    assesmentname=""
    subjectname=""
    assessment = MstAssesment.objects.filter(softdelete=0)
    classsection = \
        SubjectStaffClassMapping.objects.filter(staffid_id=request.session['userid'
            ], academicyearid_id=request.session['academicyearid'],
            instituteid_id=request.session['instituteid'])
    if request.method == 'POST':
        action = request.POST['btnsubmit']
        if action == 'Get Student':
            tagdata = request.POST['className'].split('_')
            ddlsectiones = tagdata[2]
            ddlclasses = tagdata[1]
            ddlsubject = tagdata[0]
            asssementtype = request.POST['assissmentname']
            
            sectionname=Addsection.objects.get(id=ddlsectiones).sectionName
            classname=Addclass.objects.get(id=ddlclasses).className
            assesmentname=MstAssesment.objects.get(id=asssementtype)
            subjectname=MstSubject.objects.get(id=ddlsubject).subjectname


            student = \
                StudentRegister.objects.filter(chooseclass_id=ddlclasses,
                    section_id=ddlsectiones)
        elif action == 'Save Marks':
            ddlclasses = request.POST['ddlclassid']
            ddlsectiones = request.POST['ddlsectionid']
            ddlsubject = request.POST['ddlsubjectid']
            asssementtype = request.POST['ddlassesmentid']
            count=AssessmentMarks.objects.filter(subject_id=ddlsubject,classs_id=ddlclasses,section_id=ddlsectiones,assessmentid_id=asssementtype,instituteid=request.session['instituteid'],academicyearid=request.session['academicyearid']).count()
            if  count> 0:
                msg="Assesment Marks already submitted"
            else:
                student =StudentRegister.objects.filter(chooseclass_id=ddlclasses,section_id=ddlsectiones,instituteid_id=request.session['instituteid'],academicyearid_id=request.session['academicyearid'])
                for sd in student:
                    am = AssessmentMarks()
                    tag = 'SMARKS' + str(sd.id)
                    att = request.POST[tag]
                    am.assessmentid_id = asssementtype
                    am.classs_id = ddlclasses
                    am.section_id = ddlsectiones
                    am.subject_id = ddlsubject
                    am.studentid_id = sd.id
                    am.assessmentmarks = att
                    am.instituteid_id = request.session['instituteid']
                    am.academicyearid_id = \
                        request.session['academicyearid']
                    am.createdby_id = request.session['userid']
                    if int(asssementtype)==6:
                        if int(att)>=int(finalexampassingmarks):
                            am.subjectresult="P"
                        else:
                            am.subjectresult="F"
                    elif int(asssementtype)==5:
                        if int(att)>=int(midtempassingmarks):
                            am.subjectresult="P"
                        else:
                            am.subjectresult="F"
                    else:
                        if int(att)>=int(iapassingmarks):
                            am.subjectresult="P"
                        else:
                            am.subjectresult="F"


                    am.save()
                student=""
                asssementtype=""
                ddlclasses=""
                ddlsectiones=""
                ddlsubject=""
                subjectname=""
                assesmentname=""

                msg = 'Marks Submitted Successfully'
    return render(request, 'faculty/assessmentmarks.html', {
        'msg': msg,
        'assessment': assessment,
        'classsection': classsection,
        'student': student,
        'asssementtype': asssementtype,
        'ddlclasses': ddlclasses,
        'ddlsectiones': ddlsectiones,
        'ddlsubject': ddlsubject,
        'subjectname':subjectname,
        'assesmentname':assesmentname,
        'classname':classname,
        'sectionname':sectionname,
        })



def facultystudentdisplay(request):    
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
        print(page_number)
        try:
            page_obj = p.get_page(page_number)
       
        except PageNotAnInteger:
            page_obj = p.page(1)
            print("am in exception-1")
        except EmptyPage:
            page_obj = p.page(p.num_pages)
            print("am in empty page")
    return render(request,"faculty/facultystudentdisplay.html",{"data":page_obj,"academicyeardata":academicyeardata,"institutedata":institutedata,"classdata":classdata,"sectiondata":sectiondata,"search":search,"fieldname":fieldname,"academicyearid":academicyearid,"instituteid":instituteid,"classid":classid,"sectionid":sectionid})
