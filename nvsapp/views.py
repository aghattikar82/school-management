from nvsapp.common import * 
from django.conf import settings
from nvsapp.cashier import * 
from nvsapp.accoutant import * 
from nvsapp.operator import * 
from nvsapp.adminapp import * 
from nvsapp.faculty import * 
from nvsapp.student import * 
from nvsapp.librarian import * 


def index(request):
    msg = ''
    cookieval=request.COOKIES.get('epatmobilenumber',"")
    if cookieval!="":
        print("YES ITS SET BUDDY "+cookieval)
    else:
        print("ur fucked")
    usertype=""
    userpassword=""
    if request.method == 'POST':
        usertype = request.POST['rduser']
        usermobilenumber = request.POST['txtmobilenumber']
        userpassword = request.POST['txtpassword']
        request.session["mobilenumber"]=request.POST['txtmobilenumber']
        response = HttpResponse("hello")
        response.set_cookie('epatmobilenumber', request.POST['txtmobilenumber'],max_age=3600)
        cookievalue=request.COOKIES.get('epatmobilenumber',"")
        print("cookievalue----- in index:"+cookievalue)
        print("iin post object"+request.POST['txtmobilenumber'])
        if usertype == 'college':
            if UserRegister.objects.filter(mobilenumber=usermobilenumber,password=userpassword, softdelete=0).exists():
                data = UserRegister.objects.get(mobilenumber=usermobilenumber,password=userpassword, softdelete=0)
                request.session['instituteid'] = data.instituteid_id
                request.session['mobilenumber'] = usermobilenumber
                request.session['designation'] = data.designation_id
                academicyrdata = AcademicMaster.objects.get(softdelete=0,isactive=1)
                print("----------------------")

                print(academicyrdata.id);
                request.session['academicyearid'] = academicyrdata.id
                request.session['userid'] = data.id
                return redirect(data.designation.homepage)
            else:
                msg="Invalid Login Details"

        elif usertype == 'student':
            if StudentRegister.objects.filter(mobileno=usermobilenumber,softdelete=0).exists():
                studentcount=StudentRegister.objects.filter(mobileno=usermobilenumber,softdelete=0).count()
                request.session["parentmobilenumber"]=usermobilenumber
                response = HttpResponse('patshalamobile')  
                response.set_cookie('patshalamobile', usermobilenumber)
                cookievalue  =request.COOKIES.get('patshalamobile',"")
                print("SET COOKIE:----"+cookievalue)  
                if studentcount==1:
                    data = StudentRegister.objects.get(mobileno=usermobilenumber,password=userpassword, softdelete=0)
                    request.session['instituteid'] = data.instituteid_id
                    request.session['studentid'] = data.id
                    print("--------------")
                    print(data.chooseclass_id)
                    request.session['classid'] = data.chooseclass_id
                    request.session['sectionid'] = data.section_id
                    request.session["academicyearid"]=data.academicyearid_id
                    return redirect('studenthome')
                elif studentcount>1:
                    return redirect('selectstudentprofile')
            else:
                msg = 'Invalid Login Details'
        else:
            msg = 'Invalid Login Details'
    return render(request, 'index.html', {'msg': msg})


def selectstudentprofile(request):
    if request.method=="POST":
        request.session['instituteid'] = request.POST["iid"]
        request.session['studentid'] = request.POST["sid"]
        request.session['classid'] = request.POST["cid"]
        request.session['sectionid'] = request.POST["seid"]
        request.session["academicyearid"]=request.POST["aid"]
        return redirect('studenthome')
    else:
        studentdata=StudentRegister.objects.filter(mobileno=request.session["parentmobilenumber"],softdelete=0)
        return render(request,"student/selectstudentprofile.html",{"studentdata":studentdata})

def recoverpassword(request):
    fullname=""
    password=""
    msg=""

    if request.method=="POST":
        mobilenumber=request.POST.get("txtmobilenumber","")
        if mobilenumber!="":
            if UserRegister.objects.filter(mobilenumber=mobilenumber,softdelete=0).exists():
                userdata=UserRegister.objects.filter(mobilenumber=mobilenumber,softdelete=0)
                for nm in userdata:
                    fullname=nm.name
                    password=nm.password
            elif StudentRegister.objects.filter(mobileno=mobilenumber,softdelete=0).exists():
                studentdata=StudentRegister.objects.filter(mobileno=mobilenumber,softdelete=0)
                for sd in studentdata:
                    fullname=sd.studentname
                    password=sd.password
            else:
                msg="Invalid Mobile Number"
        else:
            msg="Please Enter Mobile number"
        if fullname!="" and password!="":
            sms="Hello "+str(fullname)+",\n As requested by you , your registered Mobile Number is "+str(mobilenumber)+" and Password is "+str(password)+"\nThank you."
            msg="Password has been sent to your Whatsapp Number"
            sendmessage(request,mobilenumber,sms)
    return render(request,"recoverpassword.html",{"msg":msg})

def contactus(request):
	return render(request,"contactus.html")

def sendmessage(request,message,mobilenumber):
    requests.post("https://wa.intractly.com/api/send?number=91"+str(mobilenumber)+"&type=text&message="+message+"&instance_id=650311D0EAA77&access_token=64f4985081c3f")
    return



def getinstitutefeesdetails(request):
    if request.method=="POST":
        instituteddata=InstitutionProfile.objects.filter(softdelete=0)
        if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").exists():
            totalfeestobecollection = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").annotate(totfees=Sum("amount"))
            if not all(totalfeestobecollection.values()):
                totalfeestobecollection=0
            else:
                for d in totalfeestobecollection:
                    totalfeestobecollection=d.get("totfees")
        else:
            totalfeestobecollection=0

        if StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").exists():
            totaldiscountfees = StudentRegister.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").annotate(totdisc=Sum("discount"))
            if not all(totaldiscountfees.values()):
                totaldiscountfees=0
            else:
                for d in totaldiscountfees:
                    totaldiscountfees=d.get("totdisc")
        else:
            totaldiscountfees=0
        if FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").exists():
            totalfeescollectedtilldate = FeesPaidDetails.objects.filter(softdelete=0,academicyearid_id=request.session["academicyearid"],instituteid_id=sid).values("instituteid").annotate(totpaid=Sum("amountpaid"))
            if not all(totalfeescollectedtilldate.values()):
                totalfeescollectedtilldate=0
            else:
                for d in totalfeescollectedtilldate:
                    totalfeescollectedtilldate=d.get("totpaid")
        else:
            totalfeescollectedtilldate=0
        totfalfeesbalance = float(totalfeestobecollection) - (float(totaldiscountfees) + float(totalfeescollectedtilldate))
        feesresult={"totalfeestobecollection":totalfeestobecollection,"totalfeescollectedtilldate":totalfeescollectedtilldate,"totaldiscountfees":totaldiscountfees,"totfalfeesbalance":totfalfeesbalance}
        data=[feesresult.values()]
        print(data)
    return JsonResponse({"feesresult":list(data.values())})

def student_studentlogin(request):
	msg=""
	if request.method=="POST":
		userstudentid=request.POST["txtmobilenumber"]
		userpassword=request.POST["txtpassword"]
		if StudentRegister.objects.filter(studentid=userstudentid,password=userpassword).exists():
			data=StudentRegister.objects.get(studentid=userstudentid,password=userpassword,softdelete=0)
			request.session["instituteid"]=data.instituteid
			return redirect("studenthome")
		else:
			msg="Login Faild"
	return render(request,"studentlogin.html",{"msg":msg})

def managementhome(request):
	return render(request,"management/managementhome.html")

def logout(request):
	return redirect("index")

def getcaste(request):
    if request.method=="POST":
        religionid=request.POST["religionid"]
        print(religionid);
        castes=CasteOperator.objects.filter(selectreligion=religionid)
    return JsonResponse({"castes":list(castes.values())})

