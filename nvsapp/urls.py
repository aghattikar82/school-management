from django.contrib import admin
from django.urls import path
from nvsapp import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns=[

#BASIC
path("",views.index,name="index"),
path("contactus",views.contactus,name="contactus"),
path("logout",views.logout,name="Logout"),
path("recoverpassword",views.recoverpassword,name="recoverpassword"),

#CASHIER
path("cashierviewinstituteexpectedcollection",views.cashierviewinstituteexpectedcollection,name="cashierviewinstituteexpectedcollection"),
path("cashierindivisualinstitute",views.cashierindivisualinstitute,name="cashierindivisualinstitute"),
path("cashierindivisualclass",views.cashierindivisualclass,name="cashierindivisualclass"),
path("cashierindivisualstudent",views.cashierindivisualstudent,name="cashierindivisualstudent"),
path("cashierhome",views.cashierhome,name="cashierhome"),
path("cashiersearchchallan",views.cashiersearchchallan,name="cashiersearchchallan"),
path("cashierdatewisefeescollection",views.cashierdatewisefeescollection,name="cashierdatewisefeescollection"),
path("cashierstudentidwisefeescollection",views.cashierstudentidwisefeescollection,name="cashierstudentidwisefeescollection"),
path("cashiersettingprofile",views.cashiersettingprofile,name="cashiersettingprofile"),
path("cashiersettingpassword",views.cashiersettingpassword,name="cashiersettingpassword"),
path("printfeesreciept",views.printfeesreciept,name="printfeesreciept"),



#ACCOUTANT
path("createchallan",views.createchallan,name="createchallan"),
path("feesreportdaywise",views.feesreportdaywise,name="feesreportdaywise"),
path("feesreportclasswise",views.feesreportclasswise,name="feesreportclasswise"),
path("feesreportstudentwise",views.feesreportstudentwise,name="feesreportstudentwise"),
path("feesreportinstitutetwise",views.feesreportinstitutetwise,name="feesreportinstitutetwise"),
path("mstfeeshead",views.mstfeeshead,name="mstfeeshead"),
path("getinstitutefeesdetails",views.getinstitutefeesdetails,name="getinstitutefeesdetails"),
path("accountsettingpassword",views.accountsettingpassword,name="accountsettingpassword"),
path("accoutantsettingprofile",views.accoutantsettingprofile,name="accoutantsettingprofile"),
path("feesreport",views.feesreport,name="feesreport"),
path("feesdetails",views.feesdetails,name="feesdetails"),
path("collectfees",views.collectfees,name="collectfees"),
path("accountanthome",views.accountanthome,name="accountanthome"),
path("accountantheads",views.accountantheads,name="accountantheads"),


#STUDENT
path("selectstudentprofile",views.selectstudentprofile,name="selectstudentprofile"),
path("studentcalenderdisplay",views.studentcalenderdisplay,name="studentcalenderdisplay"),
path("studentleavedisplay",views.studentleavedisplay,name="studentleavedisplay"),
path("studentapprovaleleaves",views.studentapprovaleleaves,name="studentapprovaleleaves"),
#path("studentapprovelsleave",views.studentapprovelsleave,name="studentapprovelsleave"),
path("studentrejectleaves",views.studentrejectleaves,name="studentrejectleaves"),
path("studentcancelledleave",views.studentcancelledleave,name="studentcancelledleave"),
#path("studentpendingleaves",views.studentpendingleaves,name="studentpendingleaves"),
#path("studentrejectedleave",views.studentrejectedleave,name="studentrejectedleave"),
#path("studentattendancedisplay",views.studentattendancedisplay,name="studentattendancedisplay"),
path("studentapplyleave",views.studentapplyleave,name="studentapplyleave"),
path("studentnoticecircular",views.studentnoticecircular,name="studentnoticecircular"),
path("studentprofile",views.studentprofile,name="studentprofile"),
path("studentclasswork",views.studentclasswork,name="studentclasswork"),
path("studenthomework",views.studenthomework,name="studenthomework"),
path("studentacademics",views.studentacademics,name="studentacademics"),
path("studentattendancerecord",views.studentattendancerecord,name="studentattendancerecord"),
path("studentfeedback",views.studentfeedback,name="studentfeedback"),
#path("staffviewattendance",views.staffviewattendance,name="staffviewattendance"),
#path("studentlogin",views.studentlogin,name="studentlogin"),
path("studentdisplay",views.studentdisplay,name="studentdisplay"),
path("studentattendance",views.studentattendance,name="studentattendance"),
path("studenthome",views.studenthome,name="studenthome"),




#ADMIN
path("adminpendingleaves",views.adminpendingleaves,name="adminpendingleaves"),
path("adminapprovedleaves",views.adminapprovedleaves,name="adminapprovedleaves"),
path("adminrejectedleaves",views.adminrejectedleaves,name="adminrejectedleaves"),
path("studentsearch",views.studentsearch,name="studentsearch"),
path("headssearch",views.headssearch,name="headssearch"),
path("adminhead",views.adminhead,name="adminhead"),
path("adminuserregister",views.adminuserregister,name="adminuserregister"),
path("instituteprofile",views.instituteprofile,name="instituteprofile"),
path("academicmaster",views.academicmaster,name="academicmaster"),
path("seachinstitutes",views.seachinstitutes,name="seachinstitutes"),
path("searchuser",views.searchuser,name="searchuser"),
path("managementregister",views.managementregister,name="managementregister"),
path("feedback",views.feedback,name="feedback"),
path("adminprofile",views.adminprofile,name="adminprofile"),
path("adminchangepassword",views.adminchangepassword,name="adminsettingpassword"),
path("religion",views.religion,name="religion"),
path("castemaster",views.castemaster,name="castemaster"),
path("subcaste",views.subcaste,name="subcaste"),
path("getcaste",views.getcaste,name="getcaste"),
path("adminhome",views.adminhome,name="adminhome"),
path("viewinstituteexpectedcollection",views.viewinstituteexpectedcollection,name="viewinstituteexpectedcollection"),
path("indivisualinstitute",views.indivisualinstitute,name="indivisualinstitute"),
path("indivisualclass",views.indivisualclass,name="indivisualclass"),
path("indivisualstudent",views.indivisualstudent,name="indivisualstudent"),
path("adminfeesdetails",views.adminfeesdetails,name="adminfeesdetails"),
path("viewinstitutediscount",views.viewinstitutediscount,name="viewinstitutediscount"),
path("viewinstitutecollected",views.viewinstitutecollected,name="viewinstitutecollected"),
path("viewinstitutebalance",views.viewinstitutebalance,name="viewinstitutebalance"),
path("facultyreport",views.facultyreport,name="facultyreport"),
path("displayfeestype",views.displayfeestype,name="displayfeestype"),












#OPERATOR

path("operatorgetnewrollnumber",views.operatorgetnewrollnumber,name="operatorgetnewrollnumber"),
path("operatorstudentdata",views.operator_studentregisterdata,name="studentdata"),

path("operatorchangepassword",views.operatorchangepassword,name="operatorchangepassword"),
path("operatorprofile",views.operatorprofile,name="operatorprofile"),
#path("operatorfeesmaster",views.operatorfeesmaster,name="operatorfeesmaster"),
path("operatorfeessearch",views.operatorfeessearch,name="operatorfeessearch"),
path("operatorstaffcount",views.operatorstaffcount,name="operatorstaffcount"),
path("operatorstudentdocuments",views.operatorstudentdocuments,name="studentdocuments"),
#path("operatorregisterstudentdata",views.operatorregisterstudentdata,name="operatorregisterstudentdata"),	    
path("operatorstudentregister",views.operatorstudentregister,name="studentregister"),        
path("operatorgetfees",views.operatorgetfees,name="getfees"),
path("operatorclassesdisplay",views.operatorclassesdisplay,name="operatorclassesdisplay"),
path("operatorsectiondisplay",views.operatorsectiondisplay,name="operatorsectiondisplay"),
path("operatorassessmentdisplay",views.operatorassessmentdisplay,name="operatorassessmentdisplay"),
path("operatorsubjectsdisplay",views.operatorsubjectsdisplay,name="operatorsubjectsdisplay"),
path("operatorsubstaffmapdisplay",views.operatorsubstaffmapdisplay,name="operatorsubstaffmapdisplay"),
path("operatordisplaystaffleave",views.operatordisplaystaffleave,name="displaystaffleave"),
path("operatortimetable",views.operatortimetable,name="timetable"),
path("operatortimetabledisplay",views.operatortimetabledisplay,name="timetabledisplay"),
path("operatorfacultiesdisplay",views.operatorfacultiesdisplay,name="operatorfacultiesdisplay"),
path("operatorhome",views.operatorhome,name="operatorhome"),
path("operatornoticecircular",views.operatornoticecircular,name="noticecircular"),
path("operatormstsubject",views.operatormstsubject,name="operatormstsubject"),
path("operatorsubjectstaffclassmapping",views.operatorsubjectstaffclassmapping,name="subjectstaffclassmapping"),
path("operatormstassesment",views.operatormstassesment,name="operatormstassesment"),
path("operatorexpensehead",views.operatorexpensehead,name="expensehead"),
path("operatorheads",views.operatorheads,name="operatorheads"),
path("operatorcalender",views.operatorcalender,name="calender"),
path("operatoraddclass",views.operatoraddclass,name="operatoraddclass"),
path("operatoraddsection",views.operatoraddsection,name="addsection"),
path("operatormessage",views.operatormessage,name="message"),
path("operatoraddcaste",views.operatoraddcaste,name="addcaste"),
path("operatoruserregister",views.operatoruserregister,name="operatoruserregister"),
path("operatorlanguagemapping",views.operatorlanguagemapping,name="languagemapping"),
path("operatorgenerateidcard",views.operatorgenerateidcard,name="operatorgenerateidcard"),
path("operatorstudentdisplay",views.operatorstudentdisplay,name="operatorstudentdisplay"),
path("operatorfeestemplate",views.operatorfeestemplate,name="operatorfeestemplate"),

#path("operatorfaculties",views.operatorfaculties,name="operatorfaculties"),
#path("operatormstfeestypedisplay",views.operatormstfeestypedisplay,name="mstfeestypedisplay"),

path("operatorlanguagemappingdisplay",views.operatorlanguagemappingdisplay,name="operatorlanguagemappingdisplay"),






#FACULTY


path("staffviewfeedback",views.staffviewfeedback,name="staffviewfeedback"),
path("facultypendingstudentleaves",views.facultypendingstudentleaves,name="facultypendingstudentleaves"),
path("facultyapprovedstudentleaves",views.facultyapprovedstudentleaves,name="facultyapprovedstudentleaves"),
path("facultyrejectedstudentleaves",views.facultyrejectedstudentleaves,name="facultyrejectedstudentleaves"),
#path("facultycancelledstudentleaves",views.facultycancelledstudentleaves,name="facultycancelledstudentleaves"),
path("facultysettingprofile",views.facultysettingprofile,name="facultysettingprofile"),
path("promotestudents",views.promotestudents,name="promotestudents"),
path("classworkdisplay",views.classworkdisplay,name="classworkdisplay"),
path("homeworkdisplay",views.homeworkdisplay,name="homeworkdisplay"),
path("getclasssubject",views.getclasssubject,name="getclasssubject"),
path("gethomework",views.gethomework,name="gethomework"),
path("classwork",views.classwork,name="classwork"),
path("homework",views.homework,name="homework"),
path("assessmentmarksdisplay",views.assessmentmarksdisplay,name="assessmentmarksdisplay"),
path("facultysettingpassword",views.facultysettingpassword,name="facultysettingpassword"),
path("facultygetsection",views.facultygetsection,name="facultygetsection"),
path("facultygetsubject",views.facultygetsubject,name="facultygetsubject"),
path("facultyhome",views.facultyhome,name="facultyhome"),
path("facultyapplyleave",views.facultyapplyleave,name="facultyapplyleave"),
path("staffpendingleavedisplay",views.staffpendingleavedisplay,name="staffpendingleavedisplay"),
path("facultyapprovedleaves",views.facultyapprovedleaves,name="facultyapprovedleaves"),
path("facultyrejectedleaves",views.facultyrejectedleaves,name="facultyrejectedleaves"),
path("facultycancelledleaves",views.facultycancelledleaves,name="facultycancelledleaves"),
path("facultystudentdisplay",views.facultystudentdisplay,name="facultystudentdisplay"),
path("studentattendancedisplay",views.studentattendancedisplay,name="studentattendancedisplay"),
path("staffstudentattendancedisplay",views.staffstudentattendancedisplay,name="staffstudentattendancedisplay"),
path("assessmentmarks",views.assessmentmarks,name="assessmentmarks"),
path("facultystudentattendance",views.facultystudentattendance,name="facultystudentattendance"),


#LIBRARY

path("librarianhome",views.library_librarianhome,name="librarianhome"),
path("addbooks",views.library_addbooks,name="addbooks"),
path("issuebooks",views.library_issuebooks,name="issuebooks"),
path("returnbooks",views.library_returnbooks,name="returnbooks"),
path("librarycard",views.library_librarycard,name="librarycard"),
path("rptissuedbooks",views.library_issuedbooklist,name="rptissuedbooks"),
path("rptbooks",views.library_booklist,name="rptbooks"),
path("rptreturnbook",views.library_returnbooklist,name='rptreturnbook'),
path("librarysettingprofile",views.librarysettingprofile,name="librarysettingprofile"),
path("librarysettingpassword",views.librarysettingpassword,name="librarysettingprofile"),

]

urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
urlpatterns+=static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)

