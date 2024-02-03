from django.db import models



class MstDesignation(models.Model):
	designationname=models.CharField(max_length=100)
	createdon=models.CharField(max_length=50,default="")
	createdby=models.IntegerField(default=1)
	softdelete=models.IntegerField(default=0)
	homepage=models.CharField(max_length=50,default="")
	def __str__(self):
		return self.designationname


class InstitutionProfile(models.Model):
	nameoftrust=models.CharField(max_length=200)
	institutename=models.CharField(max_length=200)
	institutecode=models.CharField(max_length=200)
	address=models.CharField(max_length=500)
	mobilenumber=models.CharField(max_length=15)
	cashopeningbalance=models.CharField(max_length=30)
	logo=models.CharField(max_length=255,default="noimage.png")
	currentAyear=models.CharField(max_length=100)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="")
	createdby=models.CharField(max_length=50,default="ADMIN")
	upadated=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	def _str_(self):
		return self.institutename

class UserRegister(models.Model):
	name=models.CharField(max_length=200)
	mobilenumber=models.CharField(max_length=15,default="")
	emailid=models.CharField(max_length=100)
	designation=models.ForeignKey(MstDesignation,on_delete=models.PROTECT)
	password=models.CharField(max_length=50)
	softdelete=models.IntegerField(default=0)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.CharField(max_length=50,default="")
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	def __str__(self):
		return self.name

class FeesCategory(models.Model):
	category=models.CharField(max_length=200)
	softdelete=models.IntegerField(default=0)

class AccountHead(models.Model):
	head=models.CharField(max_length=200)
	feescategory=models.ForeignKey(FeesCategory,on_delete=models.PROTECT,null=True )
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,default=1)	

	def __str__(self):
		return self.head

class Addclass(models.Model):
	className=models.CharField(max_length=100)
	sectionName=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50)
	updatedby=models.CharField(max_length=100)
	deletedon=models.CharField(max_length=50)
	deletedby=models.CharField(max_length=100)
	def __str__(self):
		return self.className

class Addsection(models.Model):
	sectionName=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	def __str__(self):
		return self.sectionName


class AcademicMaster(models.Model):
	yeardate=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	isactive=models.IntegerField(default=1)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	def __str__(self):
		return self.yeardate


class ExpenseHead(models.Model):
	expenseheadid=models.ForeignKey(AccountHead,on_delete=models.PROTECT)
	paidto=models.CharField(max_length=100)
	paymentdate=models.CharField(max_length=100)
	amountpaid=models.FloatField(max_length=100)
	paymentmode=models.CharField(max_length=100)
	paymentdetails=models.CharField(max_length=255)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.IntegerField(default="")


class Religion(models.Model):
	religion=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.religion


class CasteOperator(models.Model):
	castes=models.CharField(max_length=100)
	selectreligion=models.ForeignKey(Religion,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.castes
	
	

class MstAssesment(models.Model):
	assesment_name=models.CharField(max_length=200,default="")
	minimum_marks=models.CharField(max_length=50,default="")
	maximum_marks=models.CharField(max_length=50,default="")
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.IntegerField(default=1)
	def __str__(self):
		return self.assesment_name


class MstSubCaste(models.Model):
	subcaste=models.CharField(max_length=100)
	Category=models.CharField(max_length=100)
	selectreligion=models.ForeignKey(Religion,on_delete=models.PROTECT)
	selectcastes=models.ForeignKey(CasteOperator,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.subcaste


class MstFeesHead(models.Model):
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,related_name="feesheadclass")
	feeshead=models.CharField(max_length=100)
	amount=models.FloatField(max_length=50)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,related_name="instituteidfeeshead") 
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name="academicyearidfeeshead")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="userregisterfeeshead")
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)

class FeesMaster(models.Model):
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,related_name="fmcid")
	feesterm=models.IntegerField(default=0)
	category=models.CharField(max_length=200,default="")
	feestemplate=models.CharField(max_length=200,default="")
	fees=models.FloatField()
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name="fmaid")
	


class MstFeedback(models.Model):
	feedback=models.CharField(max_length=5000)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50)
	updatedby=models.CharField(max_length=100)
	upadatedon=models.CharField(max_length=50)
	deletedby=models.CharField(max_length=100)
	deletedon=models.CharField(max_length=50)
	softdelete=models.IntegerField(default=0)

class MstSubject(models.Model):
	subjectname=models.CharField(max_length=200)
	subjecttype=models.CharField(max_length=200,default="")
	optional=models.CharField(max_length=200,default="")
	subjectcategory=models.CharField(max_length=200,default="")
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.subjectname


class NoticeCircular(models.Model):
	classs=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	section=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	subject=models.CharField(max_length=2000,default="")
	matter=models.CharField(max_length=2000,default="")
	image=models.CharField(max_length=225,default="onimage.png")
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)

class StudentRegister(models.Model):
	
	admissionno=models.IntegerField(default=0)
	admissiondate=models.CharField(max_length=100)
	chooseclass=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	section=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	rollno=models.IntegerField(default=0)
	srnumber=models.CharField(max_length=15,default="")
	studentid=models.CharField(max_length=15,default="")
	studentname=models.CharField(max_length=100)
	surname=models.CharField(max_length=100)
	aadhaarno=models.CharField(max_length=100)
	gender=models.CharField(max_length=100)
	dateofbirth=models.CharField(max_length=100)
	category=models.CharField(max_length=100)
	religion=models.ForeignKey(Religion,on_delete=models.PROTECT)
	caste=models.ForeignKey(CasteOperator,on_delete=models.PROTECT)
	subcaste=models.ForeignKey(MstSubCaste,on_delete=models.PROTECT)
	nationality=models.CharField(max_length=100)
	address=models.CharField(max_length=100)
	state=models.CharField(max_length=100)
	mobileno=models.CharField(max_length=100)
	phoneno=models.CharField(max_length=100)
	amount=models.FloatField(max_length=100)
	discount=models.FloatField(max_length=100,default="")
	hostelfacility=models.CharField(max_length=100,default="")
	busfacility=models.CharField(max_length=100,default="")
	buscharge=models.CharField(max_length=100,default="")
	fathername=models.CharField(max_length=100)
	fathereducation=models.CharField(max_length=100)
	fatherdesignation=models.CharField(max_length=100)
	mothername=models.CharField(max_length=100)
	mothereducation=models.CharField(max_length=100)
	motherdesignation=models.CharField(max_length=100)
	mothertongue=models.CharField(max_length=100)
	dependents=models.CharField(max_length=100)
	annualincome=models.CharField(max_length=100)
	lastschool=models.CharField(max_length=100)
	tcno=models.CharField(max_length=100)
	schoolbusroute=models.CharField(max_length=100,default="")
	SchoolBus=models.CharField(max_length=100,default="")
	latitude=models.CharField(max_length=100)
	longitude=models.CharField(max_length=100)
	createdon=models.CharField(max_length=100,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=100,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=100,default="")
	softdelete=models.IntegerField(default=0)
	studentphoto=models.CharField(max_length=100,default="noimage.png")
	aadharimage=models.CharField(max_length=100,default="noimage.png")
	bloodgroup=models.CharField(max_length=100,default="")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	password=models.CharField(max_length=100,default="123456")
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name='academicid',null=True)



class StudentDocument(models.Model):
	studentid=models.CharField(max_length=100)
	Holticket=models.CharField(max_length=100,default="noimage.png")
	tc=models.CharField(max_length=100,default="noimage.png")
	MarksCard=models.CharField(max_length=100,default="noimage.png")
	CasteCertificate=models.CharField(max_length=100,default="noimage.png")
	IncomeCertificate=models.CharField(max_length=100,default="noimage.png")
	Aadhaar=models.CharField(max_length=100,default="noimage.png")
	BankPassbook=models.CharField(max_length=100,default="noimage.png")
	Rationcard=models.CharField(max_length=100,default="noimage.png")
	Photho=models.CharField(max_length=100,default="noimage.png")
	Handicappedcertificate=models.CharField(max_length=100,default="noimage.png")
	Medicalcertificate=models.CharField(max_length=100,default="noimage.png")
	Bond=models.CharField(max_length=100,default="noimage.png")




class AssessmentMarks(models.Model):
	assessmentid=models.ForeignKey(MstAssesment,on_delete=models.PROTECT)
	classs=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	section=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	subject=models.ForeignKey(MstSubject,on_delete=models.PROTECT)
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT)
	studentname=models.CharField(max_length=200,default="")
	assessmentmarks=models.CharField(max_length=200,default="")
	subjectcase=models.CharField(max_length=200,default="P")
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.IntegerField(default=1)
	subjectresult=models.CharField(max_length=100,default="NA")


class studentAttendance(models.Model):
	staffid=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name='staffid')
	attendancestatus=models.CharField(max_length=100,default=0)
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name='Createdby')
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)




class LanguageMapping(models.Model):
	fl=models.ForeignKey(MstSubject,on_delete=models.PROTECT,related_name='slf')
	sl=models.ForeignKey(MstSubject,on_delete=models.PROTECT,related_name='ssl')
	tl=models.ForeignKey(MstSubject,on_delete=models.PROTECT,related_name='stl')
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name='created')
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)

class SubjectStaffClassMapping(models.Model):
	staffid=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="staff")
	subject=models.ForeignKey(MstSubject,on_delete=models.PROTECT,related_name="sub")
	Addclass=models.ForeignKey(Addclass,on_delete=models.PROTECT,default=1,related_name="cls")
	section=models.ForeignKey(Addsection,on_delete=models.PROTECT,related_name="sec")
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,related_name="inst")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="cby")
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name="ayr")
	classteacher=models.CharField(max_length=200,default="")



class Castes(models.Model):
	caste=models.CharField(max_length=200)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.caste

class HomeWork(models.Model):
	workdate=models.CharField(max_length=100)
	workdetail=models.CharField(max_length=100)
	ChooseClass=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	ChooseSection=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	subjects=models.ForeignKey(MstSubject,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-000")
	deletedby=models.CharField(max_length=100,default="")
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)

class Classwork(models.Model):
	classconducted_date=models.CharField(max_length=100)
	workdetails=models.CharField(max_length=100)
	ChooseClass=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	ChooseSection=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	subjects=models.ForeignKey(MstSubject,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)

class Message(models.Model):
	messagedate=models.CharField(max_length=100)
	messagetitle=models.CharField(max_length=100)
	messagedetails=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)


class ManagementMembers(models.Model):
	name=models.CharField(max_length=200)
	mobilenumber=models.CharField(max_length=15)
	emailid=models.CharField(max_length=15)
	designation=models.CharField(max_length=15)
	password=models.CharField(max_length=15)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50)
	createdby=models.CharField(max_length=50)
	upadated=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	def __str__(self):
		return self.name

class Calender(models.Model):
	event=models.CharField(max_length=100)
	date=models.CharField(max_length=100)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	softdelete=models.IntegerField(default=0)
	createdon=models.CharField(max_length=50,default="00-00-0000")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT)
	upadated=models.CharField(max_length=50,default="00-00-0000")
	updatedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="00-00-0000")
	deletedby=models.CharField(max_length=100,default="")
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)



	
class StudentSelectedSubject(models.Model):
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT)
	subjectid=models.ForeignKey(MstSubject,on_delete=models.PROTECT)
	subjecttype=models.IntegerField()
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)	


class StudentFeeback(models.Model):
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT)
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT)
	subjectid=models.ForeignKey(MstSubject,on_delete=models.PROTECT)
	staffid=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="sid")
	feedbackstatus=models.CharField(max_length=100)
	instituteid=models.IntegerField(default=1)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="cid")
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)

class TimeTableSchedule(models.Model):
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,default=1)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT,default=1)
	mp1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp1")
	mp2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp2")
	mp3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp3")
	mp4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp4")
	mp5=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp5")
	mp6=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp6")
	mp7=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="mp7")
	tup1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup1")
	tup2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup2")
	tup3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup3")
	tup4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup4")
	tup5=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup5")
	tup6=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup6")
	tup7=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="tup7")
	wp1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp1")
	wp2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp2")
	wp3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp3")
	wp4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp4")
	wp5=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp5")
	wp6=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp6")
	wp7=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="wp7")
	thp1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp1")
	thp2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp2")
	thp3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp3")
	thp4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp4")
	thp5=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp5")
	thp6=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp6")
	thp7=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="thp7")
	fp1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp1")
	fp2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp2")
	fp3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp3")
	fp4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp4")
	fp5=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp5")
	fp6=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp6")
	fp7=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="fp7")
	sap1=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="sap1")
	sap2=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="sap2")
	sap3=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="sap3")
	sap4=models.ForeignKey(SubjectStaffClassMapping,on_delete=models.PROTECT,null=True,related_name="sap4")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,null=True,related_name="ur")
	createdon=models.CharField(max_length=50)
	updatedby=models.CharField(max_length=100)
	upadatedon=models.CharField(max_length=50)
	deletedby=models.CharField(max_length=100)
	deletedon=models.CharField(max_length=50)
	softdelete=models.IntegerField(default=0)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,null=True,related_name="iid") 
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,null=True,related_name="aid")
	def __str__(self):
		return self.createdon 



class StudentLeave(models.Model):
	leavestatus=models.CharField(max_length=100,default="1")
	subject=models.CharField(max_length=1000,default="")
	leavedate=models.CharField(max_length=20)
	end_date=models.CharField(max_length=100)
	staffid=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="slstaffid",default=1)
	text=models.CharField(max_length=10000)
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,default=1)
	sectionsid=models.ForeignKey(Addsection,on_delete=models.PROTECT,default=1)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(StudentRegister,on_delete=models.PROTECT,related_name='cbid',default=1)
	createdon=models.CharField(max_length=50,default="")
	leavestatus=models.CharField(max_length=50,default="PENDING")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)	

class StudentLeaveToAdmin(models.Model):
	subject=models.CharField(max_length=1000,default="")
	leavedate=models.CharField(max_length=20)
	end_date=models.CharField(max_length=100)
	text=models.CharField(max_length=10000)
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,default=1)
	sectionsid=models.ForeignKey(Addsection,on_delete=models.PROTECT,default=1)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT)
	createdby=models.ForeignKey(StudentRegister,on_delete=models.PROTECT,related_name='sltaid',default=1)
	createdon=models.CharField(max_length=50,default="")
	leavestatus=models.CharField(max_length=50,default="PENDING")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT)	


class LeaveStaff(models.Model):
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name='lsacademicid',default=1)
	subject=models.CharField(max_length=1000,default="")
	leavedate=models.CharField(max_length=20)
	end_date=models.CharField(max_length=100)
	text=models.CharField(max_length=10000)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,related_name='lsiid',default=1)
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name='cbid',default=1)
	createdon=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	updatedon=models.CharField(max_length=100,default="")
	leavestatus=models.CharField(max_length=50,default="PENDING")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)


class TempInstituteFeesDetails(models.Model):
	instituteid=models.IntegerField(default=0)
	institutename=models.CharField(max_length=1000,default="")
	totalcollection=models.FloatField(default=0)
	totalcollected=models.FloatField(default=0)
	totaldiscount=models.FloatField(default=0)
	pendingamount=models.FloatField(default=0)
	fromdate=models.CharField(max_length=1000,default="")
	todate=models.CharField(max_length=1000,default="")
	detailstype=models.CharField(max_length=1000,default="")
	userid=models.IntegerField(default=0)



class TempClassFeesDetails(models.Model):
	instituteid=models.IntegerField(default=0)
	institutename=models.CharField(max_length=1000,default="")
	classname=models.CharField(max_length=1000,default="")
	classid=models.CharField(max_length=1000,default="")
	totalcollection=models.FloatField(default=0)
	totalcollected=models.FloatField(default=0)
	totaldiscount=models.FloatField(default=0)
	pendingamount=models.FloatField(default=0)
	fromdate=models.CharField(max_length=1000,default="")
	todate=models.CharField(max_length=1000,default="")
	detailstype=models.CharField(max_length=1000,default="")
	userid=models.IntegerField(default=0)


class TempStudentsFeesDetails(models.Model):
	instituteid=models.IntegerField(default=0)
	institutename=models.CharField(max_length=1000,default="")
	classname=models.CharField(max_length=1000,default="")
	classid=models.CharField(max_length=1000,default="")
	studentname=models.CharField(max_length=1000,default="")
	studentid=models.CharField(max_length=1000,default="")
	totalcollection=models.FloatField(default=0)
	totalcollected=models.FloatField(default=0)
	totaldiscount=models.FloatField(default=0)
	pendingamount=models.FloatField(default=0)
	fromdate=models.CharField(max_length=1000,default="")
	todate=models.CharField(max_length=1000,default="")
	detailstype=models.CharField(max_length=1000,default="")
	userid=models.IntegerField(default=0)

class ChallanDetails(models.Model):
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT,related_name="cdsid")
	amounttopay=models.FloatField(default=0)
	totalamounttopay=models.FloatField(default=0)
	servicefees=models.FloatField(default=0)

	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,related_name="cdclassid",default=1)
	feestypeid=models.ForeignKey(FeesMaster,on_delete=models.PROTECT,related_name="cdfeesheadid",default=1)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT,related_name="cdsectionid",default=1)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,related_name="cdinstituteidfeespaid") 
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name="cdacademicyearidfeespaid")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="cduserregisterfeespaid")
	createdon=models.CharField(max_length=50,default="")
	createdonind=models.CharField(max_length=50,default="")
	updatedby=models.ForeignKey(UserRegister,null=True,on_delete=models.PROTECT,related_name="cdupdatedby")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,null=True,related_name="cddeletedby")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)
	paymentstatus=models.CharField(max_length=50,default="NEW")
	collecteddate=models.CharField(max_length=50,default="")
	collecteddateind=models.CharField(max_length=50,default="")
	collecterid=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="cduserregistercollected",null=True)
	collectorcancelchallan=models.IntegerField(default=0)
	collectorcancelchallanreason=models.CharField(max_length=5000,default="")

class FeesPaidDetails(models.Model):
	challanid=models.ForeignKey(ChallanDetails,on_delete=models.PROTECT,related_name="fpcd",null=True)
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT,related_name="fpdsid")
	amountpaid=models.FloatField()
	ddlpaymentmode=models.CharField(max_length=100)
	classid=models.ForeignKey(Addclass,on_delete=models.PROTECT,related_name="fpdclassid",default=1)
	sectionid=models.ForeignKey(Addsection,on_delete=models.PROTECT,related_name="fpdsectionid",default=1)
	transactiondetials=models.CharField(max_length=255)
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,related_name="instituteidfeespaid") 
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,related_name="academicyearidfeespaid")
	createdby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,related_name="userregisterfeespaid")
	createdon=models.CharField(max_length=50,default="")
	createdonind=models.CharField(max_length=50,default="")
	updatedby=models.CharField(max_length=100,default="")
	upadatedon=models.CharField(max_length=50,default="")
	deletedby=models.CharField(max_length=100,default="")
	deletedon=models.CharField(max_length=50,default="")
	softdelete=models.IntegerField(default=0)





class LibraryAddBook(models.Model):
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,null=True,related_name="labiid" )
	booktype=models.CharField(max_length=100,default="")
	bookname=models.CharField(max_length=200,default="")
	booktitle=models.CharField(max_length=200,default="")
	ISBNnumber=models.CharField(max_length=100,default="")
	publisher=models.CharField(max_length=100,default="")
	author=models.CharField(max_length=200,default="")
	publishedyear=models.CharField(max_length=200,default="")
	edition=models.CharField(max_length=200,default="")
	publicationcost=models.IntegerField(default=0)
	numberofbooks=models.CharField(max_length=200,default="")
	row=models.CharField(max_length=100,default="")
	shelf=models.CharField(max_length=100,default="")
	rack=models.CharField(max_length=100,default="")
	bookaddedby=models.CharField(max_length=200,default="")
	bookaddedon=models.CharField(max_length=100,default="")
	updatedon=models.CharField(max_length=100,default="")
	updatedby=models.CharField(max_length=100,default="")
	softdelete=models.IntegerField(default=0)
	def __str__(self):
		return self.bookname


class LibraryIssueBook(models.Model):
	instituteid=models.ForeignKey(InstitutionProfile,on_delete=models.PROTECT,null=True,related_name="liidinstid")
	bookid=models.ForeignKey(LibraryAddBook,on_delete=models.PROTECT,null=True,related_name="libadbook")
	studentid=models.ForeignKey(StudentRegister,on_delete=models.PROTECT,related_name="liidsid")
	issued_ISBN_number=models.CharField(max_length=20,default="")
	issuedby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,null=True,related_name="liidissedby")
	issuedon=models.CharField(max_length=100,default="")
	indianissuedon=models.CharField(max_length=100,default="")
	actualreturndate=models.CharField(max_length=100,default="")
	indianactualreturndate=models.CharField(max_length=100,default="")
	returndate=models.CharField(max_length=100,default='')
	returnstatus=models.CharField(max_length=100,default="")
	returnissuedby=models.ForeignKey(UserRegister,on_delete=models.PROTECT,null=True,related_name="liidretissedby")
	indianbookreturndate=models.CharField(max_length=100,default="")
	finepaid=models.IntegerField(default=0)
	academicyearid=models.ForeignKey(AcademicMaster,on_delete=models.PROTECT,null=True,related_name="iibyacademicid")
	softdelete=models.IntegerField(default=0)
