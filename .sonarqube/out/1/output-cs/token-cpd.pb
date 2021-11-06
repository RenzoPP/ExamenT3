�
@C:\Users\renzo\Desktop\appT3\appT3\Controllers\HomeController.cs
	namespace

 	
appT3


 
.

 
Controllers

 
{ 
public 

class 
HomeController 
:  !

Controller" ,
{
private 
readonly 
ILogger  
<  !
HomeController! /
>/ 0
_logger1 8
;8 9
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
public 

Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 

Privacy $
($ %
)% &
{ 	
return 
View 
( 
) 
; 
} 	
[ 	

( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public   

Error   "
(  " #
)  # $
{!! 	
return"" 
View"" 
("" 
new"" 
ErrorViewModel"" *
{""+ ,
	RequestId""- 6
=""7 8
Activity""9 A
.""A B
Current""B I
?""I J
.""J K
Id""K M
??""N P
HttpContext""Q \
.""\ ]
TraceIdentifier""] l
}""m n
)""n o
;""o p
}## 	
}$$ 
}%% �*
@C:\Users\renzo\Desktop\appT3\appT3\Controllers\NoteController.cs
	namespace		 	
appT3		
 
.		 
Controllers		 
{

 
public 

class 
NoteController 
:  !

Controller" ,
{ 
private
readonly
INoteRepository

repository
;
public 
NoteController 
( 
INoteRepository -

repository. 8
)8 9
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
[ 	
HttpGet	 
] 
public 

Index "
(" #
)# $
{ 	
ViewBag 
. 
Message 
= 
$str :
;: ;
return 
View 
( 

repository "
." #
GetAll# )
() *
)* +
)+ ,
;, -
} 	
[ 	
HttpGet	 
] 
public 

Create #
(# $
)$ %
{ 	
return 
View 
( 
new 
Note  
(  !
)! "
)" #
;# $
} 	
[!! 	
HttpPost!!	 
]!! 
public"" 

Create"" #
(""# $
Note""$ (
note"") -
)""- .
{## 	 
ValidateNoteCreation$$  
($$  !
note$$! %
)$$% &
;$$& '
if&& 
(&& 
!&& 

ModelState&& 
.&& 
IsValid&& #
)&&# $
return'' 
View'' 
('' 
$str'' $
,''$ %
note''& *
)''* +
;''+ ,

repository)) 
.)) 
Create)) 
()) 
note)) "
)))" #
;))# $
TempData++ 
[++ 
$str++ %
]++% &
=++' (
$str++) H
;++H I
return-- 
RedirectToAction-- #
(--# $
$str--$ +
)--+ ,
;--, -
}.. 	
[00 	
HttpGet00	 
]00 
public11 

Edit11 !
(11! "
int11" %
Id11& (
)11( )
{22 	
var33 
currentNote33 
=33 

repository33 (
.33( )
GetNote33) 0
(330 1
Id331 3
)333 4
;334 5
currentNote44 
.44 
	UpdatedAt44 !
=44" #
DateTime44$ ,
.44, -
Now44- 0
;440 1
return55 
View55 
(55 
currentNote55 #
)55# $
;55$ %
}66 	
[88 	
HttpPost88	 
]88 
public99 

Edit99 !
(99! "
Note99" &
note99' +
)99+ ,
{:: 	 
ValidateNoteCreation;;  
(;;  !
note;;! %
);;% &
;;;& '
if== 
(== 
!== 

ModelState== 
.== 
IsValid== #
)==# $
return>> 
View>> 
(>> 
$str>> "
,>>" #
note>>$ (
)>>( )
;>>) *

repository@@ 
.@@ 
Update@@ 
(@@ 
note@@ "
)@@" #
;@@# $
TempDataBB 
[BB 
$strBB %
]BB% &
=BB' (
$strBB) I
;BBI J
returnDD 
RedirectToActionDD #
(DD# $
$strDD$ +
)DD+ ,
;DD, -
}EE 	
[GG 	
HttpGetGG	 
]GG 
publicHH 

DeleteHH #
(HH# $
intHH$ '
IdHH( *
)HH* +
{II 	

repositoryJJ 
.JJ 
DeleteJJ 
(JJ 
IdJJ  
)JJ  !
;JJ! "
TempDataKK 
[KK 
$strKK %
]KK% &
=KK' (
$strKK) G
;KKG H
returnMM 
RedirectToActionMM #
(MM# $
$strMM$ +
)MM+ ,
;MM, -
}NN 	
privatePP 
voidPP  
ValidateNoteCreationPP )
(PP) *
NotePP* .
notePP/ 3
)PP3 4
{QQ 	
ifRR 
(RR 
stringRR 
.RR 

(RR$ %
noteRR% )
.RR) *
TitleRR* /
)RR/ 0
)RR0 1

ModelStateSS 
.SS 

(SS( )
$strSS) 0
,SS0 1
$strSS2 L
)SSL M
;SSM N
ifTT 
(TT 
stringTT 
.TT 

(TT$ %
noteTT% )
.TT) *
ContentTT* 1
)TT1 2
)TT2 3

ModelStateUU 
.UU 

(UU( )
$strUU) 2
,UU2 3
$strUU4 \
)UU\ ]
;UU] ^
}VV 	
}XX 
}YY �
5C:\Users\renzo\Desktop\appT3\appT3\Db\Maps\NoteMap.cs
	namespace 	
appT3
 
. 
Db 
. 
Map 
{ 
public 

class 
NoteMap 
: $
IEntityTypeConfiguration 3
<3 4
Note4 8
>8 9
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Note		0 4
>		4 5
builder		6 =
)		= >
{

 	
builder 
. 
ToTable 
( 
$str "
)" #
;# $
builder 
. 
HasKey 
( 
o 
=> 
o  !
.! "
Id" $
)$ %
;% &
}
} 
} �

5C:\Users\renzo\Desktop\appT3\appT3\Db\T3AppContext.cs
	namespace 	
appT3
 
. 
Db 
{ 
public 

class 
T3AppContext 
: 
	DbContext (
{ 
public		 
virtual		 
DbSet		 
<		 
Note		 !
>		! "
Notes		# (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
public 
T3AppContext 
( 
DbContextOptions ,
<, -
T3AppContext- 9
>9 :
options; B
)B C
: 
base 
( 
options 
) 
{ 
} 
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
ApplyConfiguration +
(+ ,
new, /
NoteMap0 7
(7 8
)8 9
)9 :
;: ;
} 	
} 
} �
;C:\Users\renzo\Desktop\appT3\appT3\Models\ErrorViewModel.cs
	namespace 	
appT3
 
. 
Models 
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
bool		 

=>		" $
!		% &
string		& ,
.		, -

(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} �
1C:\Users\renzo\Desktop\appT3\appT3\Models\Note.cs
	namespace 	
appT3
 
. 
Models 
{ 
public 

class 
Note 
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
DatabaseGenerated	 
( #
DatabaseGeneratedOption 2
.2 3
Computed3 ;
); <
]< =
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �

-C:\Users\renzo\Desktop\appT3\appT3\Program.cs
	namespace

 	
appT3


 
{ 
public 

class 
Program 
{
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} �(
AC:\Users\renzo\Desktop\appT3\appT3\Repositories\NoteRepository.cs
	namespace 	
appT3
 
. 
Repositories 
{ 
public		 

	interface		 
INoteRepository		 $
{

 
List 
< 
Note
> 
GetAll 
( 
) 
; 
Note 
GetNote
( 
int 
Id 
) 
; 
void
Create
(
Note
note
)
;
List 
< 
Note
> 
GetNotesByQuery "
(" #
	NoteQuery# ,
query- 2
)2 3
;3 4
void 
Update
( 
Note 
note 
) 
; 
void 
Delete
( 
int 
Id 
) 
; 
} 
public 

class 
NoteRepository 
:  !
INoteRepository" 1
{ 
private 
readonly 
T3AppContext %
context& -
;- .
public 
NoteRepository 
( 
T3AppContext *
context+ 2
)2 3
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
void 
Create 
( 
Note 
note  $
)$ %
{ 	
context 
. 
Notes 
. 
Add 
( 
note "
)" #
;# $
context 
. 
SaveChanges 
(  
)  !
;! "
} 	
public!! 
void!! 
Delete!! 
(!! 
int!! 
Id!! !
)!!! "
{"" 	
var## 
note## 
=## 
GetNote## 
(## 
Id## !
)##! "
;##" #
context$$ 
.$$ 
Remove$$ 
($$ 
note$$ 
)$$  
;$$  !
context%% 
.%% 
SaveChanges%% 
(%%  
)%%  !
;%%! "
}&& 	
public(( 
List(( 
<(( 
Note(( 
>(( 
GetAll((  
(((  !
)((! "
{)) 	
return** 
context** 
.** 
Notes**  
.**  !
ToList**! '
(**' (
)**( )
;**) *
}++ 	
public-- 
Note-- 
GetNote-- 
(-- 
int-- 
Id--  "
)--" #
{.. 	
return// 
context// 
.// 
Notes//  
.//  !
Find//! %
(//% &
Id//& (
)//( )
;//) *
}00 	
public22 
List22 
<22 
Note22 
>22 
GetNotesByQuery22 )
(22) *
	NoteQuery22* 3
query224 9
)229 :
{33 	
var44 
	queryable44 
=44 
context44 #
.44# $
Notes44$ )
.44) *
AsQueryable44* 5
(445 6
)446 7
;447 8
if66 
(66 
!66 
string66 
.66 

(66% &
query66& +
.66+ ,
Title66, 1
)661 2
)662 3
{663 4
	queryable77 
=77 
	queryable77 %
.77% &
Where77& +
(77+ ,
n77, -
=>77. 0
n771 2
.772 3
Title773 8
.778 9
Contains779 A
(77A B
query77B G
.77G H
Title77H M
)77M N
)77N O
;77O P
}88 
if:: 
(:: 
!:: 
string:: 
.:: 

(::% &
query::& +
.::+ ,
Content::, 3
)::3 4
)::4 5
{;; 
	queryable<< 
=<< 
	queryable<< %
.<<% &
Where<<& +
(<<+ ,
n<<, -
=><<. 0
n<<1 2
.<<2 3
Content<<3 :
.<<: ;
Contains<<; C
(<<C D
query<<D I
.<<I J
Content<<J Q
)<<Q R
)<<R S
;<<S T
}== 
return?? 
	queryable?? 
.?? 
ToList?? #
(??# $
)??$ %
;??% &
}@@ 	
publicBB 
voidBB 
UpdateBB 
(BB 
NoteBB 
noteBB  $
)BB$ %
{CC 	
contextDD 
.DD 
UpdateDD 
(DD 
noteDD 
)DD  
;DD  !
contextEE 
.EE 
SaveChangesEE 
(EE  
)EE  !
;EE! "
}FF 	
}GG 
}HH �
-C:\Users\renzo\Desktop\appT3\appT3\Startup.cs
	namespace 	
appT3
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %

)3 4
{ 	

= 

;) *
} 	
public 
IConfiguration 

{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. #
AddControllersWithViews ,
(, -
)- .
;. /
services 
. 
AddDbContext !
<! "
T3AppContext" .
>. /
(/ 0
options   
=>   
options   "
.  " #
UseSqlServer  # /
(  / 0

.  = >
GetConnectionString  > Q
(  Q R
$str  R W
)  W X
)  X Y
)!! 
;!!
services## 
.## 
AddTransient## !
<##! "
INoteRepository##" 1
,##1 2
NoteRepository##3 A
>##A B
(##B C
)##C D
;##D E
}$$ 	
public'' 
void'' 
	Configure'' 
('' 
IApplicationBuilder'' 1
app''2 5
,''5 6
IWebHostEnvironment''7 J
env''K N
)''N O
{(( 	
if)) 
()) 
env)) 
.)) 

())! "
)))" #
)))# $
{** 
app++ 
.++ %
UseDeveloperExceptionPage++ -
(++- .
)++. /
;++/ 0
},, 
else-- 
{.. 
app// 
.// 
UseExceptionHandler// '
(//' (
$str//( 5
)//5 6
;//6 7
app11 
.11 
UseHsts11 
(11 
)11 
;11 
}22 
app33 
.33 
UseHttpsRedirection33 #
(33# $
)33$ %
;33% &
app44 
.44 
UseStaticFiles44 
(44 
)44  
;44  !
app66 
.66 

UseRouting66 
(66 
)66 
;66 
app88 
.88 
UseAuthorization88  
(88  !
)88! "
;88" #
app:: 
.:: 
UseEndpoints:: 
(:: 
	endpoints:: &
=>::' )
{;; 
	endpoints<< 
.<< 
MapControllerRoute<< ,
(<<, -
name== 
:== 
$str== #
,==# $
pattern>> 
:>> 
$str>> E
)>>E F
;>>F G
}?? 
)??
;?? 
}@@ 	
}AA 
}BB �
FC:\Users\renzo\Desktop\appT3\appT3\ViewModels\QueryModels\NoteQuery.cs
	namespace 	
appT3
 
. 

ViewModels 
. 
QueryModels &
{ 
public 

class 
	NoteQuery 
{		 
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}