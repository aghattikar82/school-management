from nvsapp.common import * 

def studentcalenderdisplay(request):
    msg=""
    data=""
    if Calender.objects.filter(academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"],softdelete=0).exists():
        data=Calender.objects.filter(academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"],softdelete=0)
    else:
        msg="Academic Year Calender not updated yet"
    return render(request,"student/studentcalenderdisplay.html",
        {
        "msg":msg,
        "data":data,
        })


def studentdisplay(request):
    mindata=0
    maxdata=0
    msg=""
    staffdata=""
    if request.method=="POST":
        mindata=int(request.POST["txtmin"])
        maxdata=int(request.POST["txtmax"])
    else:
        mindata=1
        maxdata=4
    data=StudentRegister.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)[mindata:maxdata]
    mindata=int(mindata)+3
    maxdata=int(maxdata)+3
    if StudentRegister.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)[mindata:maxdata].exists():
        msg=""
    else:
        mindata=int(mindata)-3
        maxdata=int(maxdata)-3
        data=StudentRegister.objects.filter(instituteid_id=request.session["instituteid"],softdelete=0)[mindata:maxdata]
        msg="End of Records"
    return render(request,"student/studentdisplay.html",{"data":data,"min":mindata,"max":maxdata,"msg":msg})



def studentcancelledleave(request):
    msg=""
    data=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    studentid=request.session["studentid"]
    classid=request.session['classid']
    sectionsid=request.session['sectionid']
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,leavestatus="Cancelled",classid=classid,sectionsid=sectionsid)
    return render(request,"student/studentcancelledleave.html",{"leavedata":leavedata,"msg":msg})


def studentapprovaleleaves(request):
    msg=""
    data=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    studentid=request.session["studentid"]
    classid=request.session['classid']
    sectionsid=request.session['sectionid']
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,leavestatus="APPROVED",classid=classid,sectionsid=sectionsid)
    return render(request,"student/studentapprovaleleaves.html",{"leavedata":leavedata,"msg":msg})


def studentrejectleaves(request):
    msg=""
    data=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    studentid=request.session["studentid"]
    classid=request.session['classid']
    sectionsid=request.session['sectionid']
    leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,leavestatus="REJECTED",classid=classid,sectionsid=sectionsid)
    return render(request,"student/studentrejectleaves.html",{"leavedata":leavedata,"msg":msg})



def studentleavedisplay(request):
    leavedata=""
    data=""
    msg=""
    academicyearid = request.session['academicyearid']
    instituteid=request.session["instituteid"]
    studentid=request.session["studentid"]
    classid=request.session['classid']
    sectionsid=request.session['sectionid']
    if request.method=="POST":
        action=request.POST["btnsubmit"]    
        if action=="Cancel":
            lid=request.POST["leaveid"]
            leavedata=StudentLeave.objects.filter(id=lid,academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,classid=classid,sectionsid=sectionsid)
            leavedata.update(softdelete=1,leavestatus="CANCELLED",id=lid,createdby=studentid)
            msg="Leave Cancelled"
    if StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,leavestatus="PENDING",classid=classid,sectionsid=sectionsid).exists():
        leavedata=StudentLeave.objects.filter(academicyearid=academicyearid,instituteid=instituteid,createdby=studentid,leavestatus="PENDING",classid=classid,sectionsid=sectionsid)
    return render(request,"student/studentleavedisplay.html",{"leavedata":leavedata,"msg":msg})





def studentapplyleave(request):
    msg=""
    if request.method=="POST":
        leavedatenew=request.POST["leavedate"].split("-") 
        enddatenew=request.POST["enddate"].split("-") 
        if SubjectStaffClassMapping.objects.filter(Addclass_id=request.session["classid"],section_id=request.session["sectionid"],softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"],classteacher='Yes').exists():
            ssmpstaffid=SubjectStaffClassMapping.objects.filter(Addclass_id=request.session["classid"],section_id=request.session["sectionid"],softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=request.session["instituteid"])
            print(ssmpstaffid)
            p_staffid=0
            for ss in ssmpstaffid:
                p_staffid=ss.staffid_id
            sd=StudentLeave()
            sd.subject=request.POST["textsubject"]
            sd.leavedate=leavedatenew[2]+"-"+leavedatenew[1]+"-"+leavedatenew[0]
            sd.end_date=enddatenew[2]+"-"+enddatenew[1]+"-"+enddatenew[0]
            sd.text=request.POST["textsa"]
            sd.classid_id=request.session['classid']
            sd.sectionsid_id=request.session['sectionid']
            sd.staffid_id=p_staffid
            sd.instituteid_id=request.session["instituteid"]
            sd.academicyearid_id=request.session["academicyearid"]
            sd.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
            sd.createdby_id=request.session['studentid']
            sd.save()
            msg="Leave request applied successfully"
        else:
            sd=StudentLeaveToAdmin()
            sd.subject=request.POST["textsubject"]
            sd.leavedate=leavedatenew[2]+"-"+leavedatenew[1]+"-"+leavedatenew[0]
            sd.end_date=enddatenew[2]+"-"+enddatenew[1]+"-"+enddatenew[0]
            sd.text=request.POST["textsa"]
            sd.classid_id=request.session['classid']
            sd.sectionsid_id=request.session['sectionid']
            sd.instituteid_id=request.session["instituteid"]
            print("----------------ACADEMIC YEAR ID")

            print(request.session["academicyearid"])
            sd.academicyearid_id=request.session["academicyearid"]
            sd.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
            sd.createdby_id=request.session['studentid']
            sd.save()
            msg="Leave request applied successfully"
    else:
        msg=""
    return render(request,"student/studentapplyleave.html",{"msg":msg})





def studentnoticecircular(request):
    NoticeCirculardata=""
    instituteid=request.session["instituteid"]
    classid=request.session["classid"]
    sectionid=request.session["sectionid"]
    NoticeCirculardata=NoticeCircular.objects.filter(instituteid_id=instituteid,classs_id=classid,section_id=sectionid)
    return render(request,"student/studentnotice.html",{"NoticeCirculardata":NoticeCirculardata})



def studentprofile(request):
    studentprofiledata=""
    instituteid=request.session["instituteid"]
    studentid=request.session["studentid"]
    classid=request.session["classid"]
    sectionid=request.session["sectionid"]
    studentprofiledata=StudentRegister.objects.filter(instituteid_id=instituteid,chooseclass_id=classid,id=studentid)
    return render(request,"student/studentprofile.html",{"studentprofiledata":studentprofiledata})



def studentclasswork(request):
    msg=""
    work=""
    academicyear=""
    currentdate=datetime.datetime.today().strftime('%d-%m-%Y')
    academicyear=str(currentdate)
    if request.method=="POST":
        date=request.POST["date"]
        instituteid=request.session["instituteid"]
        classid=request.session["classid"]
        sectionid=request.session["sectionid"]
        work=Classwork.objects.filter(instituteid_id=instituteid,ChooseClass_id=classid,ChooseSection_id=sectionid,classconducted_date=date,)
        msg=""
    else:
        msg="Class Work is not conducted/Updated yet"
    return render(request,"student/studentclasswork.html",{"work":work,"academicyear":academicyear,"msg":msg})


def studenthomework(request):
    msg=""
    work=""
    academicyear=""
    currentdate=datetime.datetime.today().strftime('%d-%m-%Y')
    academicyear=str(currentdate)
    if request.method=="POST":
        date=request.POST["date"]
        instituteid=request.session["instituteid"]
        classid=request.session["classid"]
        sectionid=request.session["sectionid"]
        work=HomeWork.objects.filter(instituteid_id=instituteid,ChooseClass_id=classid,ChooseSection_id=sectionid,workdate=date,)
        msg=""
    else:
        msg="No Home Work is assigned"
    return render(request,"student/studenthomework.html",{"work":work,"academicyear":academicyear,"msg":msg})


def studentacademics(request):
    classes=""
    msg=""
    MstAssesments=""
    Assesments=""
    Marks=""
    remarks="Fail"
    totalmarks=0
    classes=Addclass.objects.filter(softdelete=0,instituteid_id=request.session["instituteid"])
    MstAssesments=MstAssesment.objects.all()
    if request.method=="POST":
        Assesmenttype=request.POST["assesment"]
        classid=request.POST["class"]
        instituteid=request.session["instituteid"]
        studentid=request.session["studentid"]
        if AssessmentMarks.objects.filter(instituteid_id=instituteid,classs_id=classid,studentid_id=studentid,assessmentid_id=Assesmenttype).exists():
            Marks=AssessmentMarks.objects.filter(instituteid_id=instituteid,classs_id=classid,studentid_id=studentid,assessmentid_id=Assesmenttype)
            totalmarks=AssessmentMarks.objects.filter(instituteid_id=instituteid,classs_id=classid,studentid_id=studentid,assessmentid_id=Assesmenttype).aggregate(tm=Sum("assessmentmarks"))
            remarks=AssessmentMarks.objects.filter(instituteid_id=instituteid,classs_id=classid,studentid_id=studentid,assessmentid_id=Assesmenttype,subjectresult="F").count()
            if int(remarks)==0:
                remarks="PASS"
            else:
                remarks="FAIL"
            if not all(totalmarks.values()):
                totalmarks=0
            else:
                totalmarks=totalmarks["tm"]
        else:
            msg="Marks not Updated"
    return render(request,"student/studentacademics.html",{"remarks":remarks,"MstAssesments":MstAssesments,"classes":classes,"Assesments":Assesments,"Marks":Marks,"totalmarks":totalmarks,"msg":msg})


def studentattendancerecord(request):
    msg=""
    Attendance=""
    classes=""
    newdate=""
    classes=Addclass.objects.all()
    if request.method=="POST":
        classid=request.POST["class"]
        instituteid=request.session["instituteid"]
        studentid=request.session["studentid"]
        if studentAttendance.objects.filter(instituteid_id=instituteid,classid_id=classid,studentid_id=studentid).exists():
            Attendance=studentAttendance.objects.filter(instituteid_id=instituteid,classid_id=classid,studentid_id=studentid)
        else:
            msg=""
    return render(request,"student/studentattendancerecord.html",{"classes":classes,"Attendance":Attendance,"msg":msg})




def studentfeedback(request):
    msg=""
    subjectid=""
    feedback=""
    subject=""
    if request.method=="POST":
        #print("am in post")
        subjectid=request.POST["subject"].split("_")
        classid=request.session["classid"]
        section=request.session["sectionid"]
        feedback=MstFeedback.objects.filter(softdelete=0)
        #print("abt to enter for");
        for fd in feedback:
            #print("am in for")
            tag="SID"+str(fd.id)
            #print(tag)
            att=request.POST[tag].split("_")
            #print(att)
            sf=StudentFeeback()
            #print(att[1])
            sf.studentid_id=att[1]
            sf.classid_id=request.session["classid"]
            sf.sectionid_id=request.session["sectionid"]
            sf.subjectid_id=subjectid[0]
            sf.staffid_id=subjectid[1]
            sf.feedbackstatus=att[0]
            #print(att[0])
            sf.instituteid_id=request.session["instituteid"]
            sf.academicyearid_id=request.session["academicyearid"]
            sf.createdby_id=request.session["userid"]
            sf.createdon=datetime.datetime.now().strftime("%d-%m-%Y")
            sf.save()
            #print("all fine")
            msg="Feedback Submitted Successfully"
    else:
        msg=""
    feedback=MstFeedback.objects.filter(softdelete=0)
    #print("----------------")
    #print(request.session["classid"])
    subject=SubjectStaffClassMapping.objects.filter(Addclass_id=request.session["classid"],section_id=request.session["sectionid"])
    return render(request,"student/studentfeedback.html",{"msg":msg,"subject":subject,"feedback":feedback,"subjectid":subjectid})


def studenthome(request):
	return render(request,"student/studenthome.html")




def studentattendance(request):
	return render(request,"operator/studentattendance.html")


