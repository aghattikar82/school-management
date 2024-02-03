from nvsapp.common import * 

def librarysettingpassword(request):
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
    return render(request,"library/changepassword.html",{"msg":msg})


def librarysettingprofile(request):
    userprofildata=""
    userId=request.session["userid"]
    userprofildata=UserRegister.objects.filter(id=userId)
    return render(request,"library/libraryprofiledisplay.html",{"userprofildata":userprofildata})

def library_returnbooklist(request):
    returnedbookdata=""
    msg=""
    if request.method == 'POST':
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        fromdate=request.POST["fromdate"]
        todate=request.POST["todate"]
        bookname=LibraryAddBook.objects.get(bookname=request.POST["txtbookname"])
        ISBN_BY_BOOKNAME=bookname.ISBNnumber
        if LibraryIssueBook.objects.filter(issuedon__range=[fromdate,todate],instituteid_id=instituteid,issued_ISBN_number=ISBN_BY_BOOKNAME,softdelete=0,returnstatus="ISSUED").exists():
            returnedbookdata = LibraryIssueBook.objects.filter(issuedon__range=[fromdate,todate],issued_ISBN_number=ISBN_BY_BOOKNAME,instituteid_id=instituteid,softdelete=0,returnstatus="ISSUED")
        else:
            msg="Record Not Found"
    
    return render(request,"library/returnbooksreport.html",{"returnedbookdata":returnedbookdata,"msg":msg})

def library_booklist(request):
    booklist = ''
    msg = ''
    if request.method=="POST":
        instituteid=request.session["instituteid"]
        action = request.POST['btnsubmit']
        search = request.POST['txtsearch']
        fieldname = request.POST['ddlfield']
        if search.isnumeric() and fieldname=="bookisbn":
            if LibraryAddBook.objects.filter(id=search,softdelete=0,instituteid=instituteid).exists():
                booklist = LibraryAddBook.objects.filter(id=search,softdelete=0,instituteid=instituteid)
            else:
                msg = 'Books Not  Found'
        else:
            if fieldname == 'bookname':
                if LibraryAddBook.objects.filter(bookname__icontains=search,softdelete=0,instituteid=instituteid).exists():
                    booklist = LibraryAddBook.objects.filter(bookname__icontains=search,instituteid=instituteid)
                else:
                    msg="Books  Not Found"
            elif fieldname == "publicationyear":
                if LibraryAddBook.objects.filter(publishedyear__icontains=search,softdelete=0,instituteid=instituteid).exists():
                    booklist = LibraryAddBook.objects.filter(publishedyear__icontains=search,instituteid=instituteid)
                else:
                    msg="Books  Not Found"
    
    return render(request,"library/booklist.html",{"booklist":booklist,"msg":msg})



def library_issuedbooklist(request):
    issuedbookdata=""
    msg=""
    if request.method == 'POST':
        instituteid=request.session["instituteid"]
        academicyearid=request.session["academicyearid"]
        fromdate=request.POST["fromdate"]
        todate=request.POST["todate"]
        if LibraryIssueBook.objects.filter(issuedon__range=[fromdate,todate],instituteid_id=instituteid,softdelete=0,returnstatus="ISSUED").exists():
            issuedbookdata = LibraryIssueBook.objects.filter(issuedon__range=[fromdate,todate],instituteid_id=instituteid,softdelete=0,returnstatus="ISSUED")
        else:
            msg="Record Not Found"
    return render(request,"library/issuedbooksreport.html",{"issuedbookdata":issuedbookdata,"msg":msg})


def library_librarycard(request):
    issuedata = ''
    msg = ''
    institutecode=""
    institutedata=""
    if request.method=="POST":
        action = request.POST['btnsubmit']
        iid=request.session["instituteid"]
        search = request.POST['txtsearch']
        fieldname = request.POST['ddlfield']
        if search.isnumeric() and fieldname == 'studentid':
            if StudentRegister.objects.filter(id=search,instituteid=iid,softdelete=0).exists():
                issuedata = StudentRegister.objects.filter(id=search,instituteid=iid,softdelete=0)
            else:
                msg = 'Student Record Not Found'
        else:
            if fieldname == 'studentname':
                if StudentRegister.objects.filter(studentname__icontains=search,instituteid=iid,softdelete=0).exists():
                    issuedata = StudentRegister.objects.filter(studentname__iconseatains=rch,instituteid=iid,softdelete=0)
                else:
                    msg="Student Record Not Found"
            elif fieldname=='mobilenumber':
                if StudentRegister.objects.filter(mobileno__icontains=search,instituteid=iid,softdelete=0).exists():
                    issuedata = StudentRegister.objects.filter(mobileno__icontains=search,instituteid=iid,softdelete=0)
                
                else:
                    msg="Student Record Not Found"
    institutedata=InstitutionProfile.objects.filter(softdelete=0,id=request.session["instituteid"])
    for ins in institutedata:
        print(ins.institutename)
        print(ins.address)
        print(ins.mobilenumber)

    return render(request,"library/librarycard.html",{"msg":msg,"institutedata":institutedata,"issuedata":issuedata,"institutecode":institutecode})


def library_returnbooks(request):
    returndata = ''
    msg = ''
    if request.method=="POST":
        action = request.POST['btnsubmit']
        iid=request.session["instituteid"]
        if action=="Return Book":
            if LibraryIssueBook.objects.filter(issued_ISBN_number=request.POST["isbnnumber"]).exists():
               LibraryIssueBook.objects.filter(returnstatus="RETURNED",returnissuedby_id=request.session["userid"],indianbookreturndate=indiandate,finepaid=0).update()
               msg="Book Returned Successfully"
            else:
                msg="Book Not Issued"
        elif action=="Damaged":
            if LibraryIssueBook.objects.filter(issued_ISBN_number=request.POST["isbnnumber"]).exists():
               LibraryIssueBook.objects.filter(returnstatus="DAMAGED",returnissuedby_id=request.session["userid"],indianbookreturndate=indiandate,finepaid=0).update()
               msg="Book Returned Successfully"
            else:
                msg="Book Not Issued"
        elif action=="Lost":
            if LibraryIssueBook.objects.filter(issued_ISBN_number=request.POST["isbnnumber"]).exists():
               LibraryIssueBook.objects.filter(returnstatus="LOST",returnissuedby_id=request.session["userid"],indianbookreturndate=indiandate,finepaid=0).update()
               msg="Book Returned Successfully"
            else:
                msg="Book Not Issued"
        else:
            search = request.POST['txtsearch']
            if search.isnumeric():
                if StudentRegister.objects.filter(id=search,instituteid=iid,softdelete=0).exists():
                    returndata = StudentRegister.objects.filter(id=search,instituteid=iid,softdelete=0)
                else:
                    msg = 'Student Record Not Found'
            else:
                msg="Enter Valid Student Id"
    bookdata=LibraryAddBook.objects.filter(softdelete=0)
    institutedata=InstitutionProfile.objects.filter(softdelete=0)
    return render(request,"library/returnbooks.html",{"msg":msg,"returndata":returndata,'institutedata':institutedata,"bookdata":bookdata})

from datetime import datetime, timedelta
from .models import LibraryAddBook, LibraryIssueBook, StudentRegister

def calculate_fine(actual_return_date, return_date):
    fine_per_day = 5
    delay_days = (actual_return_date - return_date).days

    if delay_days > 0:
        fine = delay_days * fine_per_day
    else:
        fine = 0

    return fine

def library_issuebooks(request):
    issuedata = ''
    msg = ''

    if request.method == "POST":
        action = request.POST['btnsubmit']
        iid = request.session["instituteid"]

        if action == "Issue Book":
            isbn_number = request.POST["isbnnumber"]
            book_id = request.POST["bookid"]
            student_id = request.POST["studentid"]

            if LibraryAddBook.objects.filter(ISBNnumber=isbn_number).exists():
                ib = LibraryIssueBook()
                ib.instituteid_id = request.session["instituteid"]
                ib.bookid_id = book_id
                ib.studentid_id = student_id
                ib.issued_ISBN_number = isbn_number
                ib.issuedby_id = request.session["userid"]
                ib.issuedon = datetime.now()
                ib.indianissuedon = indiandate  
                ib.returndate = datetime.now() + timedelta(days=15)
                ib.indianreturndate = indiandate  
                ib.actualreturndate = ib.returndate
                ib.indianactualreturndate = ib.indianreturndate
                ib.finepaid = calculate_fine(ib.actualreturndate, ib.returndate)
                ib.academicyearid_id = request.session["academicyearid"]
                ib.returnstatus = "ISSUED"
                ib.save()
                msg = "Book Issued Successfully"
            else:
                msg = "Entered Book Not Available"

        else:
            search = request.POST['txtsearch']
            if search.isnumeric():
                if StudentRegister.objects.filter(id=search, instituteid=iid, softdelete=0).exists():
                    issuedata = StudentRegister.objects.filter(id=search, instituteid=iid, softdelete=0)
                else:
                    msg = 'Student Record Not Found'
            else:
                msg = "Enter Valid Student ID"

    studentdata = StudentRegister.objects.filter(softdelete=0)
    bookdata = LibraryAddBook.objects.filter(softdelete=0)
    return render(request, "library/issuebooks.html", {"msg": msg, "issuedata": issuedata, 'studentdata': studentdata, 'bookdata': bookdata})


def library_librarianhome(request):
    bookscount=""
    issuedbookscount=""
    returnbookscount=""
    pendingbookscount=""
    Sdatacount=""
    academicyearid=request.session["academicyearid"]
    mobilenumber=request.session["userid"]
    instituteid=request.session["instituteid"]
    Sdatacount = StudentRegister.objects.filter(softdelete=0).count()
    bookscount=LibraryAddBook.objects.filter(softdelete=0).count()
    issuedbookscount=LibraryIssueBook.objects.filter(softdelete=0,returnstatus="ISSUED").count()
    returnbookscount=LibraryIssueBook.objects.filter(softdelete=0,returnstatus="RETURNED").count()
    pendingbookscount=""
    return render(request,"library/librarianhome.html",{"Sdatacount":Sdatacount,"bookscount":bookscount,"issuedbookscount":issuedbookscount,"returnbookscount":returnbookscount,"pendingbookscount":pendingbookscount})

def library_addbooks(request):
    msg=""
    if request.method=="POST":
        if LibraryAddBook.objects.filter(ISBNnumber=request.POST['isbn_no']).exists():
            msg="Book Already Exists"
        else:
            ab=LibraryAddBook()
            ab.booktype=request.POST['booktype']
            ab.bookname=request.POST['bookname']
            ab.booktitle=request.POST["title"]
            ab.ISBNnumber=request.POST["isbn_no"]
            ab.publisher=request.POST['publisher']
            ab.author=request.POST['author']
            ab.publishedyear=request.POST["published_yr"]
            ab.edition=request.POST['edition']
            ab.publicationcost=request.POST['publication_cost']
            ab.numberofbooks=request.POST['numberofbooks']
            ab.row=request.POST["row"]
            ab.shelf=request.POST["shelf"]
            ab.rack=request.POST["rack"]
            ab.bookaddedby=request.session["userid"]
            ab.bookaddedon=datetime.now().strftime("%d-%m-%Y")
            ab.updatedon=datetime.now().strftime("%d-%m-%Y")
            ab.updatedby=request.session["userid"]
            ab.save()
            msg="Book Added Successfully"
    else:
        msg=""
    return render(request,"library/addbook.html",{"msg":msg})