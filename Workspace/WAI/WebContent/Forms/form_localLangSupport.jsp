<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="forms.*;" %>
<%@page session="true"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="Resources/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Resources/grid.css" media="screen" />
<link rel="stylesheet" type="text/css" href="Resources/styles.css" media="screen" />
<link href="default.css" rel="stylesheet" type="text/css" />
<%
	FormLang l=new FormLang();
	String str=request.getParameter("lang");
	int i=Integer.parseInt(str);
	l.lang_choice(i);
%>
<style>
#myContent
{
	margin: 50px 0 0 270px;
    width: 740px;
}
a.dashboard-module, 
a.dashboard-module:visited { 
	width: 142px; 
	height: 142px; 
	display: block; 
	float: left; 
	background: url(Resources/dashboard-module.gif) top left no-repeat; 
	margin: 0 6px 8px 0;  
	text-align: center; 
	color: #444444; 
	}
	
a.dashboard-module:hover, 
a.dashboard-module:active { 
	background-position: bottom left;
	text-decoration: none; 
	color:#0063be; 
	}

a.dashboard-module img { 
	margin-top: 20px; 
	}
	
a.dashboard-module span { 
	margin-top: 10px; 
	display: block; 
	}
</style>
<script type="text/javascript" src="https://www.google.com/jsapi?key=INSERT-YOUR-KEY">
</script>
<script type="text/javascript">
function loadSubmitForm(formId,to,replaceDivision)
{
	var data=new FormData();
	var x=document.getElementById(formId);
	for(i=0;i<x.length;i++){
		if(x.elements[i].type=="file"){
			if(x.elements[i].multiple){
				var lengthOfFile=x.elements[i].files.length;
				for(j=0;j<lengthOfFile;j++){
					var nameOfFile=x.elements[i].files[j].name;
					var lastDigit=nameOfFile.charAt(nameOfFile.lastIndexOf(".")-1);
					var fileName=x.elements[i].name;
					fileName=(fileName.substring(0,fileName.length - 2))+lastDigit;
					data.append(fileName, x.elements[i].files[j]);
				}				
			}else{				
				data.append(x.elements[i].name, x.elements[i].files[0]);
			}
		}else if(x.elements[i].type=="radio"){
			if(x.elements[i].checked){
				data.append(x.elements[i].name, x.elements[i].value);
			}
		}else{
			data.append(x.elements[i].name, x.elements[i].value);
		}
	}	
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(replaceDivision).innerHTML=xmlhttp.responseText;    
    }
  }
xmlhttp.open("POST",to);
xmlhttp.send(data);
}
</script>

<script type="text/javascript">
function loadFaq()
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='' title=''>Forms</a></li><li><a href=# onclick='loadHelp();return false;'>Help</a></li><li class='active'><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","FAQ.html",true);
xmlhttp.send();
}

function loadHelp()
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='' title=''>Forms</a></li><li class='active'><a href=# onclick='loadHelp();return false;'>Help</a></li><li><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","usrMan.jsp",true);
xmlhttp.send();
}

function loadContactUs()
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myContent").innerHTML=xmlhttp.responseText;
    document.getElementById("menu").innerHTML="<ul><li><a href='modLink.jsp'>Homepage</a></li><li><a href='' title=''>Forms</a></li><li><a href=# onclick='loadHelp();return false;'>Help</a></li><li><a href=# onclick='loadFaq();return false;'>FAQs</a></li><li class='active'><a href=# onclick='loadContactUs();return false;'>Contact Us</a></li></ul>";
    }
  }
xmlhttp.open("GET","contact.html",true);
xmlhttp.send();
}
</script>

<script language="javascript" type="text/javascript">
function dropdownlist(listindex)
{	
document.form1.district.options.length = 0;
switch (listindex)
{

case 1 :	
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Anantapur","Anantapur");
document.form1.district.options[2]=new Option("Guntur","");
document.form1.district.options[3]=new Option("Hyderabad","");
document.form1.district.options[4]=new Option("Kakinada","");
document.form1.district.options[5]=new Option("Kurnool");
document.form1.district.options[6]=new Option("Other");
break;

case 3 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Guwahati");
document.form1.district.options[2]=new Option("Silchar");
document.form1.district.options[3]=new Option("Other");

break;

case 2 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Hawai");
document.form1.district.options[2]=new Option("Seppa");
document.form1.district.options[3]=new Option("Other");
break;
case 4 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Arrah");
document.form1.district.options[2]=new Option("Bhagalpur");
document.form1.district.options[3]=new Option("Bihar Sharif");
document.form1.district.options[4]=new Option("Darbhanga");
document.form1.district.options[5]=new Option("Gaya");
document.form1.district.options[6]=new Option("Muzaffarpur");
document.form1.district.options[7]=new Option("Patna");
document.form1.district.options[8]=new Option("Purnia");
document.form1.district.options[9]=new Option("Other");
break;
case 5 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bhilai");
document.form1.district.options[2]=new Option("Bilaspur");
document.form1.district.options[3]=new Option("Durg");
document.form1.district.options[4]=new Option("Korba");
document.form1.district.options[5]=new Option("Raipur");
document.form1.district.options[6]=new Option("Other");

break;
case 6 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Panaji");
document.form1.district.options[2]=new Option("Margao");
document.form1.district.options[3]=new Option("Other");
break;
case 7 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Ahmedabhad");
document.form1.district.options[2]=new Option("Bhavnagar");
document.form1.district.options[3]=new Option("Gandhinagar");
document.form1.district.options[4]=new Option("Jamnagar");
document.form1.district.options[5]=new Option("Rajkot");
document.form1.district.options[6]=new Option("Surat");
document.form1.district.options[7]=new Option("Vadodara");
document.form1.district.options[8]=new Option("Other");
break;
case 8 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Faridabad");
document.form1.district.options[2]=new Option("Hisar");
document.form1.district.options[3]=new Option("Panipat");
document.form1.district.options[4]=new Option("Rohtak");
document.form1.district.options[5]=new Option("Sonipat");
document.form1.district.options[6]=new Option("Other");
break;
case 9 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Dharmasala");
document.form1.district.options[2]=new Option("Mandi");
document.form1.district.options[3]=new Option("Simla");
document.form1.district.options[4]=new Option("Other");
break;
case 10 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Jammu");
document.form1.district.options[2]=new Option("Srinagar");
document.form1.district.options[3]=new Option("Other");
break;
case 11 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bokaro");
document.form1.district.options[2]=new Option("Daltonganj");
document.form1.district.options[3]=new Option("Dhanbad")
document.form1.district.options[4]=new Option("Jamshedpur");
document.form1.district.options[5]=new Option("Ranchi");
document.form1.district.options[6]=new Option("Other");
break;
case 12 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bangalore");
document.form1.district.options[2]=new Option("Belgaum");
document.form1.district.options[3]=new Option("Bellary")
document.form1.district.options[4]=new Option("Bidar");
document.form1.district.options[5]=new Option("Bijapur");
document.form1.district.options[6]=new Option("Chikmagalur");
document.form1.district.options[7]=new Option("Chitradurga");
document.form1.district.options[8]=new Option("Davanagere");
document.form1.district.options[9]=new Option("Gulbarga");
document.form1.district.options[10]=new Option("Hassan");
document.form1.district.options[11]=new Option("Hosapet");
document.form1.district.options[12]=new Option("Hubli");
document.form1.district.options[13]=new Option("Mandya");
document.form1.district.options[14]=new Option("Mangalore");
document.form1.district.options[15]=new Option("Mysore");
document.form1.district.options[16]=new Option("Raichur");
document.form1.district.options[17]=new Option("Shimoga");
document.form1.district.options[18]=new Option("Tumkur");
document.form1.district.options[19]=new Option("Other");
break;
case 13 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Alappuzha");
document.form1.district.options[2]=new Option("Kakkanad");
document.form1.district.options[3]=new Option("Kollam")
document.form1.district.options[4]=new Option("Kannur");
document.form1.district.options[5]=new Option("Kottayam");
document.form1.district.options[6]=new Option("Kozhikode");
document.form1.district.options[7]=new Option("Calicut");
document.form1.district.options[8]=new Option("Malappuram");
document.form1.district.options[9]=new Option("Thrissur");
document.form1.district.options[10]=new Option("Thiruvananthapuram");
document.form1.district.options[11]=new Option("Other");
break;
case 14 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bhopal");
document.form1.district.options[2]=new Option("Burhanpur");
document.form1.district.options[3]=new Option("Dewas")
document.form1.district.options[4]=new Option("Gwalior");
document.form1.district.options[5]=new Option("Indore");
document.form1.district.options[6]=new Option("Jhabalpur");
document.form1.district.options[7]=new Option("Ratlam");
document.form1.district.options[8]=new Option("Rewa");
document.form1.district.options[9]=new Option("Sagar");
document.form1.district.options[10]=new Option("Satna");
document.form1.district.options[11]=new Option("Singrauli");
document.form1.district.options[12]=new Option("Ujjain");
document.form1.district.options[13]=new Option("Other");
break;
case 15 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Ahmednagar");
document.form1.district.options[2]=new Option("Akola");
document.form1.district.options[3]=new Option("Ambernath")
document.form1.district.options[4]=new Option("Amarvati");
document.form1.district.options[5]=new Option("Aurangabad");
document.form1.district.options[6]=new Option("Bhiwandi");
document.form1.district.options[7]=new Option("Chandrapur");
document.form1.district.options[8]=new Option("Dhule");
document.form1.district.options[9]=new Option("Ichalkaranji");
document.form1.district.options[10]=new Option("Jalgaon");
document.form1.district.options[11]=new Option("Jalna");
document.form1.district.options[12]=new Option("Kalyan-Dombivali");
document.form1.district.options[13]=new Option("Kohlapur");
document.form1.district.options[14]=new Option("Latur");
document.form1.district.options[15]=new Option("Malegaon");
document.form1.district.options[16]=new Option("Mira-Bhayandar");
document.form1.district.options[17]=new Option("Mumbai");
document.form1.district.options[18]=new Option("Nagpur");
document.form1.district.options[19]=new Option("Nanded");
document.form1.district.options[20]=new Option("Nashik");
document.form1.district.options[21]=new Option("Navi Mumbai");
document.form1.district.options[22]=new Option("Panvel");
document.form1.district.options[23]=new Option("Parbhani");
document.form1.district.options[24]=new Option("Pimpri-Chinchwad");
document.form1.district.options[25]=new Option("Pune");
document.form1.district.options[26]=new Option("Sangli-Miraj&amp;Kupwad");
document.form1.district.options[27]=new Option("Solapur");
document.form1.district.options[28]=new Option("Thane");
document.form1.district.options[29]=new Option("Ulhasnagar");
document.form1.district.options[30]=new Option("Vasai-Vrar");
document.form1.district.options[31]=new Option("Other");
break;
case 16 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bishnupur");
document.form1.district.options[2]=new Option("Imphal");
document.form1.district.options[3]=new Option("Other");
break;
case 17 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Shillong");
document.form1.district.options[2]=new Option("Tura");
document.form1.district.options[3]=new Option("Other");
break;
case 18 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Aizawl");
document.form1.district.options[2]=new Option("Lunglei");
document.form1.district.options[3]=new Option("Other");
break;
case 19 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Dimapur");
document.form1.district.options[2]=new Option("Kohima");
document.form1.district.options[3]=new Option("Mon");
document.form1.district.options[4]=new Option("Other");
break;
case 20 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Bhubaneswar");
document.form1.district.options[2]=new Option("Brahmapur");
document.form1.district.options[3]=new Option("Cuttack");
document.form1.district.options[4]=new Option("Puri");
document.form1.district.options[5]=new Option("Other");
break;
case 21 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Amritsar");
document.form1.district.options[2]=new Option("Bathinda");
document.form1.district.options[3]=new Option("Jalandhar");
document.form1.district.options[4]=new Option("Ludhiana");
document.form1.district.options[5]=new Option("Patiala");
document.form1.district.options[6]=new Option("Other");
break;
case 22 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Ajmer");
document.form1.district.options[2]=new Option("Alwar");
document.form1.district.options[3]=new Option("Bharatpur")
document.form1.district.options[4]=new Option("Bhilwara");
document.form1.district.options[5]=new Option("Bikaner");
document.form1.district.options[6]=new Option("Jaipur");
document.form1.district.options[7]=new Option("Jodhpur");
document.form1.district.options[8]=new Option("Kota");
document.form1.district.options[9]=new Option("Pali");
document.form1.district.options[10]=new Option("Sri Ganganagar");
document.form1.district.options[11]=new Option("Sikar");
document.form1.district.options[12]=new Option("Udaipur");
document.form1.district.options[13]=new Option("Other");
break;
case 23 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Gangtok");
document.form1.district.options[2]=new Option("Namchi");
document.form1.district.options[3]=new Option("Other");
break;
case 24 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Ambattur");
document.form1.district.options[2]=new Option("Avadi");
document.form1.district.options[3]=new Option("Chennai")
document.form1.district.options[4]=new Option("Coimbatore");
document.form1.district.options[5]=new Option("Madurai");
document.form1.district.options[6]=new Option("Salem");
document.form1.district.options[7]=new Option("Tiruchirappalli");
document.form1.district.options[8]=new Option("Tirunelveli");
document.form1.district.options[9]=new Option("Tirupur");
document.form1.district.options[10]=new Option("Tiruvottiyur");
document.form1.district.options[11]=new Option("Other");
break;
case 36 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Agartala");
document.form1.district.options[2]=new Option("Udaipur");
document.form1.district.options[3]=new Option("Other");
break;
case 25 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Dehradun");
document.form1.district.options[2]=new Option("Haridwar");
document.form1.district.options[3]=new Option("Rudrapur");
document.form1.district.options[4]=new Option("Other");
break;
case 26 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Agra");
document.form1.district.options[2]=new Option("Aligar");
document.form1.district.options[3]=new Option("Allahabad")
document.form1.district.options[4]=new Option("Bareilly");
document.form1.district.options[5]=new Option("Etawah");
document.form1.district.options[6]=new Option("Farrukhabad");
document.form1.district.options[7]=new Option("Firozabad");
document.form1.district.options[8]=new Option("Ghaziabad");
document.form1.district.options[9]=new Option("Gorakhpur");
document.form1.district.options[10]=new Option("Hapur");
document.form1.district.options[11]=new Option("Jhansi");
document.form1.district.options[12]=new Option("Kanpur");
document.form1.district.options[13]=new Option("Loni");
document.form1.district.options[14]=new Option("Lucknow");
document.form1.district.options[15]=new Option("Mathura");
document.form1.district.options[16]=new Option("Mau");
document.form1.district.options[17]=new Option("Meerut");
document.form1.district.options[18]=new Option("Mirzapur");
document.form1.district.options[19]=new Option("Moradabad");
document.form1.district.options[20]=new Option("Muzaffarnagar");
document.form1.district.options[21]=new Option("Noida");
document.form1.district.options[22]=new Option("Rampur");
document.form1.district.options[23]=new Option("Saharanpur");
document.form1.district.options[24]=new Option("Shahjahanpur");
document.form1.district.options[25]=new Option("Varanasi");
document.form1.district.options[26]=new Option("Other");
break;
case 27 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Asansol");
document.form1.district.options[2]=new Option("Bally");
document.form1.district.options[3]=new Option("Baranagar")
document.form1.district.options[4]=new Option("Bardhaman");
document.form1.district.options[5]=new Option("Bhatpara");
document.form1.district.options[6]=new Option("Bidhan Nagar");
document.form1.district.options[7]=new Option("Durgapur");
document.form1.district.options[8]=new Option("Gopalpur");
document.form1.district.options[9]=new Option("Howrah");
document.form1.district.options[10]=new Option("Kamarhati");
document.form1.district.options[11]=new Option("Kolkata");
document.form1.district.options[12]=new Option("Kulti");
document.form1.district.options[13]=new Option("Maheshtala");
document.form1.district.options[14]=new Option("Naihati");
document.form1.district.options[15]=new Option("North Dumdum");
document.form1.district.options[16]=new Option("Panihati");
document.form1.district.options[17]=new Option("Rajpur Sonarpur");
document.form1.district.options[18]=new Option("Siliguri");
document.form1.district.options[19]=new Option("South Dumdum");
document.form1.district.options[20]=new Option("Srirampur");
document.form1.district.options[21]=new Option("Uluberia");
document.form1.district.options[22]=new Option("Other");
break;
case 28 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Andaman");
document.form1.district.options[2]=new Option("Nicobar");
document.form1.district.options[3]=new Option("Other");
break;
case 29 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Chandigarh");
document.form1.district.options[2]=new Option("Other");
break;
case 30 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Dadar");
document.form1.district.options[2]=new Option("Nagar Haweli");
document.form1.district.options[3]=new Option("Other");
break;
case 31 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Diu");
document.form1.district.options[2]=new Option("Daman");
document.form1.district.options[3]=new Option("Other");
break;
case 32 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Delhi");
document.form1.district.options[2]=new Option("Deoli");
document.form1.district.options[3]=new Option("Nangloi Jat");
document.form1.district.options[4]=new Option("New Delhi");
document.form1.district.options[5]=new Option("Other");
break;
case 33 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Laksadweep");
document.form1.district.options[2]=new Option("Other");
break;
case 34 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("National Capital Territory of Delhi");
document.form1.district.options[2]=new Option("Other");
break;
case 35 :
document.form1.district.options[0]=new Option("Select City","");
document.form1.district.options[1]=new Option("Ozhukarai");
document.form1.district.options[2]=new Option("Other");
break;
}
return true;
}
</script>

<script language="javascript" type="text/javascript">
function dropdownlistp(listindex)
{

document.form1.pdistrict.options.length = 0;
switch (listindex)
{

case 1 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Anantapur","Anantapur");
document.form1.pdistrict.options[2]=new Option("Guntur","");
document.form1.pdistrict.options[3]=new Option("Hyderabad","");
document.form1.pdistrict.options[4]=new Option("Kakinada","");
document.form1.pdistrict.options[5]=new Option("Kurnool");
document.form1.pdistrict.options[6]=new Option("Other");
break;

case 3 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Guwahati");
document.form1.pdistrict.options[2]=new Option("Silchar");
document.form1.pdistrict.options[3]=new Option("Other");

break;

case 2 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Hawai");
document.form1.pdistrict.options[2]=new Option("Seppa");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 4 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Arrah");
document.form1.pdistrict.options[2]=new Option("Bhagalpur");
document.form1.pdistrict.options[3]=new Option("Bihar Sharif");
document.form1.pdistrict.options[4]=new Option("Darbhanga");
document.form1.pdistrict.options[5]=new Option("Gaya");
document.form1.pdistrict.options[6]=new Option("Muzaffarpur");
document.form1.pdistrict.options[7]=new Option("Patna");
document.form1.pdistrict.options[8]=new Option("Purnia");
document.form1.pdistrict.options[9]=new Option("Other");
break;
case 5 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bhilai");
document.form1.pdistrict.options[2]=new Option("Bilaspur");
document.form1.pdistrict.options[3]=new Option("Durg");
document.form1.pdistrict.options[4]=new Option("Korba");
document.form1.pdistrict.options[5]=new Option("Raipur");
document.form1.pdistrict.options[6]=new Option("Other");

break;
case 6 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Panaji");
document.form1.pdistrict.options[2]=new Option("Margao");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 7 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Ahmedabhad");
document.form1.pdistrict.options[2]=new Option("Bhavnagar");
document.form1.pdistrict.options[3]=new Option("Gandhinagar");
document.form1.pdistrict.options[4]=new Option("Jamnagar");
document.form1.pdistrict.options[5]=new Option("Rajkot");
document.form1.pdistrict.options[6]=new Option("Surat");
document.form1.pdistrict.options[7]=new Option("Vadodara");
document.form1.pdistrict.options[8]=new Option("Other");
break;
case 8 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Faridabad");
document.form1.pdistrict.options[2]=new Option("Hisar");
document.form1.pdistrict.options[3]=new Option("Panipat");
document.form1.pdistrict.options[4]=new Option("Rohtak");
document.form1.pdistrict.options[5]=new Option("Sonipat");
document.form1.pdistrict.options[6]=new Option("Other");
break;
case 9 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Dharmasala");
document.form1.pdistrict.options[2]=new Option("Mandi");
document.form1.pdistrict.options[3]=new Option("Simla");
document.form1.pdistrict.options[4]=new Option("Other");
break;
case 10 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Jammu");
document.form1.pdistrict.options[2]=new Option("Srinagar");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 11 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bokaro");
document.form1.pdistrict.options[2]=new Option("Daltonganj");
document.form1.pdistrict.options[3]=new Option("Dhanbad")
document.form1.pdistrict.options[4]=new Option("Jamshedpur");
document.form1.pdistrict.options[5]=new Option("Ranchi");
document.form1.pdistrict.options[6]=new Option("Other");
break;
case 12 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bangalore");
document.form1.pdistrict.options[2]=new Option("Belgaum");
document.form1.pdistrict.options[3]=new Option("Bellary")
document.form1.pdistrict.options[4]=new Option("Bidar");
document.form1.pdistrict.options[5]=new Option("Bijapur");
document.form1.pdistrict.options[6]=new Option("Chikmagalur");
document.form1.pdistrict.options[7]=new Option("Chitradurga");
document.form1.pdistrict.options[8]=new Option("Davanagere");
document.form1.pdistrict.options[9]=new Option("Gulbarga");
document.form1.pdistrict.options[10]=new Option("Hassan");
document.form1.pdistrict.options[11]=new Option("Hosapet");
document.form1.pdistrict.options[12]=new Option("Hubli");
document.form1.pdistrict.options[13]=new Option("Mandya");
document.form1.pdistrict.options[14]=new Option("Mangalore");
document.form1.pdistrict.options[15]=new Option("Mysore");
document.form1.pdistrict.options[16]=new Option("Raichur");
document.form1.pdistrict.options[17]=new Option("Shimoga");
document.form1.pdistrict.options[18]=new Option("Tumkur");
document.form1.pdistrict.options[19]=new Option("Other");
break;
case 13 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Alappuzha");
document.form1.pdistrict.options[2]=new Option("Kakkanad");
document.form1.pdistrict.options[3]=new Option("Kollam")
document.form1.pdistrict.options[4]=new Option("Kannur");
document.form1.pdistrict.options[5]=new Option("Kottayam");
document.form1.pdistrict.options[6]=new Option("Kozhikode");
document.form1.pdistrict.options[7]=new Option("Calicut");
document.form1.pdistrict.options[8]=new Option("Malappuram");
document.form1.pdistrict.options[9]=new Option("Thrissur");
document.form1.pdistrict.options[10]=new Option("Thiruvananthapuram");
document.form1.pdistrict.options[11]=new Option("Other");
break;
case 14 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bhopal");
document.form1.pdistrict.options[2]=new Option("Burhanpur");
document.form1.pdistrict.options[3]=new Option("Dewas")
document.form1.pdistrict.options[4]=new Option("Gwalior");
document.form1.pdistrict.options[5]=new Option("Indore");
document.form1.pdistrict.options[6]=new Option("Jhabalpur");
document.form1.pdistrict.options[7]=new Option("Ratlam");
document.form1.pdistrict.options[8]=new Option("Rewa");
document.form1.pdistrict.options[9]=new Option("Sagar");
document.form1.pdistrict.options[10]=new Option("Satna");
document.form1.pdistrict.options[11]=new Option("Singrauli");
document.form1.pdistrict.options[12]=new Option("Ujjain");
document.form1.pdistrict.options[13]=new Option("Other");
break;
case 15 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Ahmednagar");
document.form1.pdistrict.options[2]=new Option("Akola");
document.form1.pdistrict.options[3]=new Option("Ambernath")
document.form1.pdistrict.options[4]=new Option("Amarvati");
document.form1.pdistrict.options[5]=new Option("Aurangabad");
document.form1.pdistrict.options[6]=new Option("Bhiwandi");
document.form1.pdistrict.options[7]=new Option("Chandrapur");
document.form1.pdistrict.options[8]=new Option("Dhule");
document.form1.pdistrict.options[9]=new Option("Ichalkaranji");
document.form1.pdistrict.options[10]=new Option("Jalgaon");
document.form1.pdistrict.options[11]=new Option("Jalna");
document.form1.pdistrict.options[12]=new Option("Kalyan-Dombivali");
document.form1.pdistrict.options[13]=new Option("Kohlapur");
document.form1.pdistrict.options[14]=new Option("Latur");
document.form1.pdistrict.options[15]=new Option("Malegaon");
document.form1.pdistrict.options[16]=new Option("Mira-Bhayandar");
document.form1.pdistrict.options[17]=new Option("Mumbai");
document.form1.pdistrict.options[18]=new Option("Nagpur");
document.form1.pdistrict.options[19]=new Option("Nanded");
document.form1.pdistrict.options[20]=new Option("Nashik");
document.form1.pdistrict.options[21]=new Option("Navi Mumbai");
document.form1.pdistrict.options[22]=new Option("Panvel");
document.form1.pdistrict.options[23]=new Option("Parbhani");
document.form1.pdistrict.options[24]=new Option("Pimpri-Chinchwad");
document.form1.pdistrict.options[25]=new Option("Pune");
document.form1.pdistrict.options[26]=new Option("Sangli-Miraj&amp;Kupwad");
document.form1.pdistrict.options[27]=new Option("Solapur");
document.form1.pdistrict.options[28]=new Option("Thane");
document.form1.pdistrict.options[29]=new Option("Ulhasnagar");
document.form1.pdistrict.options[30]=new Option("Vasai-Vrar");
document.form1.pdistrict.options[31]=new Option("Other");
break;
case 16 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bishnupur");
document.form1.pdistrict.options[2]=new Option("Imphal");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 17 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Shillong");
document.form1.pdistrict.options[2]=new Option("Tura");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 18 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Aizawl");
document.form1.pdistrict.options[2]=new Option("Lunglei");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 19 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Dimapur");
document.form1.pdistrict.options[2]=new Option("Kohima");
document.form1.pdistrict.options[3]=new Option("Mon");
document.form1.pdistrict.options[4]=new Option("Other");
break;
case 20 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Bhubaneswar");
document.form1.pdistrict.options[2]=new Option("Brahmapur");
document.form1.pdistrict.options[3]=new Option("Cuttack");
document.form1.pdistrict.options[4]=new Option("Puri");
document.form1.pdistrict.options[5]=new Option("Other");
break;
case 21 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Amritsar");
document.form1.pdistrict.options[2]=new Option("Bathinda");
document.form1.pdistrict.options[3]=new Option("Jalandhar");
document.form1.pdistrict.options[4]=new Option("Ludhiana");
document.form1.pdistrict.options[5]=new Option("Patiala");
document.form1.pdistrict.options[6]=new Option("Other");
break;
case 22 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Ajmer");
document.form1.pdistrict.options[2]=new Option("Alwar");
document.form1.pdistrict.options[3]=new Option("Bharatpur")
document.form1.pdistrict.options[4]=new Option("Bhilwara");
document.form1.pdistrict.options[5]=new Option("Bikaner");
document.form1.pdistrict.options[6]=new Option("Jaipur");
document.form1.pdistrict.options[7]=new Option("Jodhpur");
document.form1.pdistrict.options[8]=new Option("Kota");
document.form1.pdistrict.options[9]=new Option("Pali");
document.form1.pdistrict.options[10]=new Option("Sri Ganganagar");
document.form1.pdistrict.options[11]=new Option("Sikar");
document.form1.pdistrict.options[12]=new Option("Udaipur");
document.form1.pdistrict.options[13]=new Option("Other");
break;
case 23 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Gangtok");
document.form1.pdistrict.options[2]=new Option("Namchi");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 24 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Ambattur");
document.form1.pdistrict.options[2]=new Option("Avadi");
document.form1.pdistrict.options[3]=new Option("Chennai")
document.form1.pdistrict.options[4]=new Option("Coimbatore");
document.form1.pdistrict.options[5]=new Option("Madurai");
document.form1.pdistrict.options[6]=new Option("Salem");
document.form1.pdistrict.options[7]=new Option("Tiruchirappalli");
document.form1.pdistrict.options[8]=new Option("Tirunelveli");
document.form1.pdistrict.options[9]=new Option("Tirupur");
document.form1.pdistrict.options[10]=new Option("Tiruvottiyur");
document.form1.pdistrict.options[11]=new Option("Other");
break;
case 36 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Agartala");
document.form1.pdistrict.options[2]=new Option("Udaipur");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 25 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Dehradun");
document.form1.pdistrict.options[2]=new Option("Haridwar");
document.form1.pdistrict.options[3]=new Option("Rudrapur");
document.form1.pdistrict.options[4]=new Option("Other");
break;
case 26 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Agra");
document.form1.pdistrict.options[2]=new Option("Aligar");
document.form1.pdistrict.options[3]=new Option("Allahabad")
document.form1.pdistrict.options[4]=new Option("Bareilly");
document.form1.pdistrict.options[5]=new Option("Etawah");
document.form1.pdistrict.options[6]=new Option("Farrukhabad");
document.form1.pdistrict.options[7]=new Option("Firozabad");
document.form1.pdistrict.options[8]=new Option("Ghaziabad");
document.form1.pdistrict.options[9]=new Option("Gorakhpur");
document.form1.pdistrict.options[10]=new Option("Hapur");
document.form1.pdistrict.options[11]=new Option("Jhansi");
document.form1.pdistrict.options[12]=new Option("Kanpur");
document.form1.pdistrict.options[13]=new Option("Loni");
document.form1.pdistrict.options[14]=new Option("Lucknow");
document.form1.pdistrict.options[15]=new Option("Mathura");
document.form1.pdistrict.options[16]=new Option("Mau");
document.form1.pdistrict.options[17]=new Option("Meerut");
document.form1.pdistrict.options[18]=new Option("Mirzapur");
document.form1.pdistrict.options[19]=new Option("Moradabad");
document.form1.pdistrict.options[20]=new Option("Muzaffarnagar");
document.form1.pdistrict.options[21]=new Option("Noida");
document.form1.pdistrict.options[22]=new Option("Rampur");
document.form1.pdistrict.options[23]=new Option("Saharanpur");
document.form1.pdistrict.options[24]=new Option("Shahjahanpur");
document.form1.pdistrict.options[25]=new Option("Varanasi");
document.form1.pdistrict.options[26]=new Option("Other");
break;
case 27 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Asansol");
document.form1.pdistrict.options[2]=new Option("Bally");
document.form1.pdistrict.options[3]=new Option("Baranagar")
document.form1.pdistrict.options[4]=new Option("Bardhaman");
document.form1.pdistrict.options[5]=new Option("Bhatpara");
document.form1.pdistrict.options[6]=new Option("Bidhan Nagar");
document.form1.pdistrict.options[7]=new Option("Durgapur");
document.form1.pdistrict.options[8]=new Option("Gopalpur");
document.form1.pdistrict.options[9]=new Option("Howrah");
document.form1.pdistrict.options[10]=new Option("Kamarhati");
document.form1.pdistrict.options[11]=new Option("Kolkata");
document.form1.pdistrict.options[12]=new Option("Kulti");
document.form1.pdistrict.options[13]=new Option("Maheshtala");
document.form1.pdistrict.options[14]=new Option("Naihati");
document.form1.pdistrict.options[15]=new Option("North Dumdum");
document.form1.pdistrict.options[16]=new Option("Panihati");
document.form1.pdistrict.options[17]=new Option("Rajpur Sonarpur");
document.form1.pdistrict.options[18]=new Option("Siliguri");
document.form1.pdistrict.options[19]=new Option("South Dumdum");
document.form1.pdistrict.options[20]=new Option("Srirampur");
document.form1.pdistrict.options[21]=new Option("Uluberia");
document.form1.pdistrict.options[22]=new Option("Other");
break;
case 28 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Andaman");
document.form1.pdistrict.options[2]=new Option("Nicobar");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 29 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Chandigarh");
document.form1.pdistrict.options[2]=new Option("Other");
break;
case 30 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Dadar");
document.form1.pdistrict.options[2]=new Option("Nagar Haweli");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 31 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Diu");
document.form1.pdistrict.options[2]=new Option("Daman");
document.form1.pdistrict.options[3]=new Option("Other");
break;
case 32 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Delhi");
document.form1.pdistrict.options[2]=new Option("Deoli");
document.form1.pdistrict.options[3]=new Option("Nangloi Jat");
document.form1.pdistrict.options[4]=new Option("New Delhi");
document.form1.pdistrict.options[5]=new Option("Other");
break;
case 33 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Laksadweep");
document.form1.pdistrict.options[2]=new Option("Other");
break;
case 34 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("National Capital Territory of Delhi");
document.form1.pdistrict.options[2]=new Option("Other");
break;
case 35 :
document.form1.pdistrict.options[0]=new Option("Select City","");
document.form1.pdistrict.options[1]=new Option("Ozhukarai");
document.form1.pdistrict.options[2]=new Option("Other");
break;
}
return true;
}
</script>

<script type="text/javascript">
//Load the Google Transliterate API
google.load("elements", "1", {
      packages: "transliteration"
    });
var str=new Array();
var i =1;
key=0;

function eliminateBlank()
{
	var len,s;
	s=document.getElementById("date");
	len=s.length;
	if(s.charAt(len-1))
		{
		s=s.slice(0,len-2);
		document.getElementById("date")=s;
		}
	s=document.getElementById("dateOfBirth");
	len=s.length;
	if(s.charAt(len-1))
		{
		s=s.slice(0,len-2);
		document.getElementById("dateOfBirth")=s;
		}
	s=document.getElementById("ifNotKnownAge");
	len=s.length;
	if(s.charAt(len-1))
		{
		s=s.slice(0,len-2);
		document.getElementById("ifNotKnownAge")=s;
		}
}

function Backspace(e,id2)
{
var keynum;var len;
if(window.event) // IE8 and earlier
	{
	keynum = e.keyCode;
	}
else if(e.which) // IE9/Firefox/Chrome/Opera/Safari
	{
	keynum = e.which;
	}
if (keynum==8 && i>=0)
	{
		key=1;
		len=str.length;
		str=str.slice(0,len-1)
		document.getElementById(id2).value=str
        
	}
else
	 key=0;
}

function copy_data(val,id2)
{
	 var a = document.getElementById(val.id).value
	    i = a.length;
	if(key==0 && i>0)
	{
    str+=a[i-1];
    str=str.toUpperCase();
    document.getElementById(id2).value=str
	}
}
function copy_email(val,id2)
{
	 var a = document.getElementById(val.id).value   
    document.getElementById(id2).value=a

}
function copyAddress(key)
{
	if(key==0)
		{
		document.getElementById("pc/o").value="";
		document.getElementById("pc/o2").value="";
		document.getElementById("phouseNoAndName").value="";
		document.getElementById("pstreetNoAndName").value="";
		document.getElementById("plandmark").value="";
		document.getElementById("pvillage").value="";
		document.getElementById("pdistrict").value="";
		document.getElementById("pstate").value="";
		document.getElementById("ppincode").value="";
		document.getElementById("phouseNoAndName2").value="";
		document.getElementById("pstreetNoAndName2").value="";
		document.getElementById("plandmark2").value="";
		document.getElementById("pvillage2").value="";
// 		document.getElementById("pdistrict2").value="";
// 		document.getElementById("pstate2").value="";
		document.getElementById("ppincode2").value="";
		}
	else
	{
	document.getElementById("pc/o").value=document.getElementById("c/o").value;
	document.getElementById("pc/o2").value=document.getElementById("c/o2").value;
	document.getElementById("phouseNoAndName").value=document.getElementById("houseNoAndName").value;
	document.getElementById("pstreetNoAndName").value=document.getElementById("streetNoAndName").value;
	document.getElementById("plandmark").value=document.getElementById("landmark").value;
	document.getElementById("pvillage").value=document.getElementById("village").value;	
	document.getElementById("pstate").value=document.getElementById("state").value;
	dropdownlistp(document.form1.state.selectedIndex);
	document.getElementById("pdistrict").value=document.getElementById("district").value;
	document.getElementById("ppincode").value=document.getElementById("pincode").value;
	document.getElementById("phouseNoAndName2").value=document.getElementById("houseNoAndName2").value;
	document.getElementById("pstreetNoAndName2").value=document.getElementById("streetNoAndName2").value;
	document.getElementById("plandmark2").value=document.getElementById("landmark2").value;
	document.getElementById("pvillage2").value=document.getElementById("village2").value;
// 	document.getElementById("pdistrict2").value=document.getElementById("district2").value;
// 	document.getElementById("pstate2").value=document.getElementById("state2").value;
	document.getElementById("ppincode2").value=document.getElementById("pincode2").value;
	}
}
function onFocus(id2)
{
    str=document.getElementById(id2).value
}
function onLoad() {
  var options;
  var ch=<%=i%>
  switch(ch)
  {
  case 1:
	  	options = {
	      sourceLanguage:
	          google.elements.transliteration.LanguageCode.ENGLISH,
	      destinationLanguage:
	          [google.elements.transliteration.LanguageCode.KANNADA],
	      shortcutKey: 'ctrl+g',
	      transliterationEnabled: true
	  };
	  break;
  case 2:
	  	options = {
	      sourceLanguage:
	          google.elements.transliteration.LanguageCode.ENGLISH,
	      destinationLanguage:
	          [google.elements.transliteration.LanguageCode.HINDI],
	      shortcutKey: 'ctrl+g',
	      transliterationEnabled: true
	  };
	  break;
  case 3:
	  	options = {
	      sourceLanguage:
	          google.elements.transliteration.LanguageCode.ENGLISH,
	      destinationLanguage:
	          [google.elements.transliteration.LanguageCode.BENGALI],
	      shortcutKey: 'ctrl+g',
	      transliterationEnabled: true
	  };
	  break;
  case 4:
	  	options = {
	      sourceLanguage:
	          google.elements.transliteration.LanguageCode.ENGLISH,
	      destinationLanguage:
	          [google.elements.transliteration.LanguageCode.TELUGU],
	      shortcutKey: 'ctrl+g',
	      transliterationEnabled: true
	  };
	  break;
  case 5:
	  	options = {
	      sourceLanguage:
	          google.elements.transliteration.LanguageCode.ENGLISH,
	      destinationLanguage:
	          [google.elements.transliteration.LanguageCode.TAMIL],
	      shortcutKey: 'ctrl+g',
	      transliterationEnabled: true
	  };
	  break;
  }
 

  // Create an instance on TransliterationControl with the required
  // options.
  var control =
      new google.elements.transliteration.TransliterationControl(options);

  // Enable transliteration in the textbox with id
  // 'transliterateTextarea'.
  control.makeTransliteratable(['firstName2']);
  control.makeTransliteratable(['lastName2']);
  control.makeTransliteratable(['middleName2']);
  control.makeTransliteratable(['fatherName2']);
//   control.makeTransliteratable(['dateOfBirth2']);
  control.makeTransliteratable(['ifNotKnownAge2']);
  control.makeTransliteratable(['c/o2']);
  control.makeTransliteratable(['houseNoAndName2']);
  control.makeTransliteratable(['streetNoAndName2']);
  control.makeTransliteratable(['landmark2']);
  control.makeTransliteratable(['phoneNo2.']);
  control.makeTransliteratable(['pincode2']);
  control.makeTransliteratable(['state2']);
  control.makeTransliteratable(['district2']);
  control.makeTransliteratable(['village2']); 
  control.makeTransliteratable(['RegistraionNumber2']);
  control.makeTransliteratable(['date2']); 
}
google.setOnLoadCallback(onLoad);
</script>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=UTF-8"%>
<title>WAI</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function isDate(txtDate) {
    var objDate,  // date object initialized from the txtDate string
        mSeconds, // txtDate in milliseconds
        day,      // day
        month,    // month
        year;     // year
    // date length should be 10 characters (no more no less)
    if (txtDate.length !== 11) {
        return false;
    }
    // third and sixth character should be '/'
    if (txtDate.substring(4, 5) !== '-' || txtDate.substring(7, 8) !== '-') {
        return false;
    }
    // extract month, day and year from the txtDate (expected format is mm/dd/yyyy)
    // subtraction will cast variables to integer implicitly (needed
    // for !== comparing)    
    year = txtDate.substring(0, 4) - 0;
    month = txtDate.substring(5, 7) - 1; // because months in JS start from 0
    day = txtDate.substring(8, 10) - 0;
    
    
    // test year range
    if (year < 1000 || year > 9999) {
        return false;
    }
    // convert txtDate to milliseconds
    mSeconds = (new Date(year, month, day)).getTime();
    // initialize Date() object from calculated milliseconds
    objDate = new Date();
    objDate.setTime(mSeconds);
    // compare input date and parts from Date() object
    // if difference exists then date isn't valid
    if (objDate.getFullYear() !== year ||
        objDate.getMonth() !== month ||
        objDate.getDate() !== day) {
        return false;
    }
    // otherwise return true
    return true;
}

function validateDate(txtDate,vals){
    // define date string to test
    var txtDate = document.getElementById(txtDate).value;
    // check date and print message
    if (isDate(txtDate)) {
        vals.style.backgroundColor='';
        vals.setCustomValidity('');
        return true;
    }
    else {
    	vals.style.backgroundColor= '#ffeeee';
    	vals.setCustomValidity('Please Enter Valid Date');
        //alert('Invalid date format!');
        return false;
    }
}

function validateAge()
{
	var val1=document.getElementById("dateOfBirth");
	var val2=document.getElementById("ifNotKnownAge");
	var val3=document.getElementById("dateOfBirth2");
	var val4=document.getElementById("ifNotKnownAge2");
	if((val1.value==""||val1.value==null||!(validateDate('dateOfBirth',val3)))&&(val2.value==""||val2.value==null))
		{
			val3.setCustomValidity('Please enter Age or Date Of Birth');
			val4.setCustomValidity('Please enter Age or Date Of Birth');
			val3.style.backgroundColor="#ffeeee";
			val4.style.backgroundColor="#ffeeee";
			return false;
		}
	else
		{
		val3.setCustomValidity('');
		val4.setCustomValidity('');
		val3.style.backgroundColor="";
		val4.style.backgroundColor="";
		return true;
		}
}

//validate firstname
function validateFirstName()
{
//var x=document.forms["form1"]["firstName2"].value;
var val=document.getElementById("firstName2");
if (val.value==null || val.value=="")
  {
	val.style.backgroundColor= '#ffeeee';
  //document.all.form1.firstName2.style.borderColor = 'RED';
  //document.forms.form1.firstName2.focus();
  return false;
  }
else
	{
	val.style.backgroundColor= '';
	return true;
	}
}


function validateHouseNo()
{
	var x2=document.forms["form1"]["houseNoAndName2"].value;
	var val=document.getElementById("houseNoAndName2");
	if(val.value==null||val.value=="")
		{
			//document.all.form1.houseNoAndName2.style.borderColor = 'RED';
			val.style.backgroundColor= '#ffeeee';
			return false;
		}
		else
			{
			//document.all.form1.houseNoAndName2.style.borderColor = '';
			val.style.backgroundColor= '';
			return true;
			}
}

function validateStreetNo()
{
	//var x3=document.forms["form1"]["streetNoAndName2"].value;
	var val=document.getElementById("streetNoAndName2");
	if(val.value==null||val.value=="")
		{
			//document.all.form1.streetNoAndName2.style.borderColor = 'RED';
			val.style.backgroundColor='#ffeeee';
			return false;
		}
	else
		{
			//document.all.form1.streetNoAndName2.style.borderColor = '';
			val.style.backgroundColor='';
			return true;
		}
}

function validateVillage()
{
	//var x5=document.forms["form1"]["village2"].value;
	var val=document.getElementById("village2");
	if(val.value==null||val.value=="")
		{
			//document.all.form1.village2.style.borderColor = 'RED';
			val.style.backgroundColor='#ffeeee';
			return false;
		}
		else
			{
			//document.all.form1.village2.style.borderColor = '';
			val.style.backgroundColor='';
			return true;
			}
}

function validateDistrict()
{
	//var x6=document.forms["form1"]["district2"].value;
	var val=document.getElementById("district2");
	if(val.value==null||val.value=="")
		{
			//document.all.form1.district2.style.borderColor = 'RED';
			val.style.backgroundColor='#ffeeee';
			return false;
		}
		else
			{
			//document.all.form1.district2.style.borderColor = '';
			val.style.backgroundColor='';
			return true;
			}
}

function validateState()
{
	//var x7=document.forms["form1"]["state2"].value;
	var val=document.getElementById("state2");
	if(val.value==null||val.value=="")
		{
			//document.all.form1.state2.style.borderColor = 'RED';
			val.style.backgroundColor='#ffeeee';
			return false;
		}
		else
			{
				//document.all.form1.state2.style.borderColor = '';
				val.style.backgroundColor='';
				return true;
			}
}

function validatePincode()
{
	//var x8=document.forms["form1"]["pincode2"].value;
	var val=document.getElementById("pincode");
	var val1=document.getElementById("pincode2");
	var reg= /^\d{6}$/
	if(reg.test(val.value)==false)
		{
			//document.all.form1.pincode2.style.borderColor = 'RED';
			val1.style.backgroundColor='#ffeeee';
			//input.setCustomValidity();
			val1.setCustomValidity('Please Enter Valid Pincode');
			return false;
		}
		else
		{
			//document.all.form1.pincode2.style.borderColor = '';
			val1.style.backgroundColor='';
			val1.setCustomValidity('');
			return true;
		}
}

function validateEmailPresent()
{
	//var x1=document.forms["form1"]["emailId2"].value;
	//var x2=document.forms["form1"]["contact2_0"].checked;
	var val=document.getElementById("emailId2");
	var val1=document.getElementById("emailId");
	var val2=document.getElementById("contact2_0");
	var val3=document.getElementById("contact2_2");
	if((val2.checked==true ||val3.checked==true)&& !(validateEmailId()))
	{
		//document.all.form1.emailId2.style.borderColor = 'RED';
		val.style.backgroundColor='#ffeeee';
		val.setCustomValidity('enter email');
		return false;
	}
	else
	{
		//document.all.form1.emailId2.style.borderColor = '';
		val.style.backgroundColor='';
		val.setCustomValidity('');
		return true;
	}
}

function validateModeOfContact()
{
	var x1=document.forms["form1"]["emailId2"].value;
	var x2=document.forms["form1"]["contact2_0"].checked;
	var x3=document.forms["form1"]["contact2_1"].checked;
	var x4=document.forms["form1"]["contact2_2"].checked;
	if(x2==false &&x3==false && x4==false)
		{
			y2="Select Mode of contact";
			return false;
		}
	else
		{
			return true;
		}
}


function validateEmailId() {

	var val=document.getElementById("emailId");
	val=val.slice(0,len-2);
	document.getElementById("emailId")=val;
	var val1=document.getElementById("emailId2");
	var reg= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if(reg.test(val.value)==false)
	{
	val1.style.backgroundColor='#ffeeee';
	val1.setCustomValidity('Enter Valid Email Id')
	return false;
	}
	else
	{
	val1.style.backgroundColor='';
	val1.setCustomValidity('');
	return false;
	}
}

calendar = {
		month_names: ["January","February","March","April","May","June","July","August","September","October","November","December"],
		weekdays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
		month_days: [31,28,31,30,31,30,31,31,30,31,30,31],
		//Get today's date - year, month, day and date
		today : new Date(),
		opt : {},
		data: [],

		//Functions
		/// Used to create HTML in a optimized way.
		wrt:function(txt) {
			this.data.push(txt);
		},
		
		/* Inspired by http://www.quirksmode.org/dom/getstyles.html */
		getStyle: function(ele, property){
			if (ele.currentStyle) {
				var alt_property_name = property.replace(/\-(\w)/g,function(m,c){return c.toUpperCase();});//background-color becomes backgroundColor
				var value = ele.currentStyle[property]||ele.currentStyle[alt_property_name];
			
			} else if (window.getComputedStyle) {
				property = property.replace(/([A-Z])/g,"-$1").toLowerCase();//backgroundColor becomes background-color

				var value = document.defaultView.getComputedStyle(ele,null).getPropertyValue(property);
			}
			
			//Some properties are special cases
			if(property == "opacity" && ele.filter) value = (parseFloat( ele.filter.match(/opacity\=([^)]*)/)[1] ) / 100);
			else if(property == "width" && isNaN(value)) value = ele.clientWidth || ele.offsetWidth;
			else if(property == "height" && isNaN(value)) value = ele.clientHeight || ele.offsetHeight;
			return value;
		},
		getPosition:function(ele) {
			var x = 0;
			var y = 0;
			while (ele) {
				x += ele.offsetLeft;
				y += ele.offsetTop;
				ele = ele.offsetParent;
			}
			if (navigator.userAgent.indexOf("Mac") != -1 && typeof document.body.leftMargin != "undefined") {
				x += document.body.leftMargin;
				offsetTop += document.body.topMargin;
			}
		
			var xy = new Array(x,y);
			return xy;
		},
		/// Called when the user clicks on a date in the calendar.
		selectDate:function(year,month,day) {
			var ths = _calendar_active_instance;
			document.getElementById(ths.opt["input"]).value = year + "-" + month + "-" + day; // Date format is :HARDCODE:
			ths.hideCalendar();
		},
		/// Creates a calendar with the date given in the argument as the selected date.
		makeCalendar:function(year, month, day) {
			year = parseInt(year);
			month= parseInt(month);
			day	 = parseInt(day);
			
			//Display the table
			var next_month = month+1;
			var next_month_year = year;
			if(next_month>=12) {
				next_month = 0;
				next_month_year++;
			}
			
			var previous_month = month-1;
			var previous_month_year = year;
			if(previous_month< 0) {
				previous_month = 11;
				previous_month_year--;
			}
			
			this.wrt("<table>");
			this.wrt("<tr><th><a href='javascript:calendar.makeCalendar("+(previous_month_year)+","+(previous_month)+");' title='"+this.month_names[previous_month]+" "+(previous_month_year)+"'>&lt;</a></th>");
			this.wrt("<th colspan='5' class='calendar-title'><select name='calendar-month' class='calendar-month' onChange='calendar.makeCalendar("+year+",this.value);'>");
			for(var i in this.month_names) {
				this.wrt("<option value='"+i+"'");
				if(i == month) this.wrt(" selected='selected'");
				this.wrt(">"+this.month_names[i]+"</option>");
			}
			this.wrt("</select>");
			this.wrt("<select name='calendar-year' class='calendar-year' onChange='calendar.makeCalendar(this.value, "+month+");'>");
			var current_year = this.today.getYear();
			if(current_year < 1900) current_year += 1900;
			
			for(var i=current_year-120; i<=current_year-18; i++) {
				this.wrt("<option value='"+i+"'")
				if(i == year) this.wrt(" selected='selected'");
				this.wrt(">"+i+"</option>");
			}
			this.wrt("</select></th>");
			this.wrt("<th><a href='javascript:calendar.makeCalendar("+(next_month_year)+","+(next_month)+");' title='"+this.month_names[next_month]+" "+(next_month_year)+"'>&gt;</a></th></tr>");
			this.wrt("<tr class='header'>");
			for(var weekday=0; weekday<7; weekday++) this.wrt("<td>"+this.weekdays[weekday]+"</td>");
			this.wrt("</tr>");
			
			//Get the first day of this month
			var first_day = new Date(year,month,1);
			var start_day = first_day.getDay();
			
			var d = 1;
			var flag = 0;
			
			//Leap year support
			if(year % 4 == 0) this.month_days[1] = 29;
			else this.month_days[1] = 28;
			
			var days_in_this_month = this.month_days[month];

			//Create the calender
			for(var i=0;i<=5;i++) {
				if(w >= days_in_this_month) break;
				this.wrt("<tr>");
				for(var j=0;j<7;j++) {
					if(d > days_in_this_month) flag=0; //If the days has overshooted the number of days in this month, stop writing
					else if(j >= start_day && !flag) flag=1;//If the first day of this month has come, start the date writing

					if(flag) {
						var w = d, mon = month+1;
						if(w < 10)	w	= "0" + w;
						if(mon < 10)mon = "0" + mon;

						//Is it today?
						var class_name = '';
						var yea = this.today.getYear();
						if(yea < 1900) yea += 1900;

						if(yea == year && this.today.getMonth() == month && this.today.getDate() == d) class_name = " today";
						if(day == d) class_name += " selected";
						
						class_name += " " + this.weekdays[j].toLowerCase();

						this.wrt("<td class='days"+class_name+"'><a href='javascript:calendar.selectDate(\""+year+"\",\""+mon+"\",\""+w+"\")'>"+w+"</a></td>");
						d++;
					} else {
						this.wrt("<td class='days'>&nbsp;</td>");
					}
				}
				this.wrt("</tr>");
			}
			this.wrt("</table>");
			this.wrt("<input type='button' value='Cancel' class='calendar-cancel' onclick='calendar.hideCalendar();' />");

			document.getElementById(this.opt['calendar']).innerHTML = this.data.join("");
			this.data = [];
		},
		
		/// Display the calendar - if a date exists in the input box, that will be selected in the calendar.
		showCalendar: function() {
			var input = document.getElementById(this.opt['input']);
			
			//Position the div in the correct location...
			var div = document.getElementById(this.opt['calendar']);
			var xy = this.getPosition(input);
			var width = parseInt(this.getStyle(input,'width'));
			div.style.left=(xy[0]+width+10)+"px";
			div.style.top=xy[1]+"px";

			// Show the calendar with the date in the input as the selected date
			var existing_date = new Date();
			var date_in_input = input.value;
			if(date_in_input) {
				var selected_date = false;
				var date_parts = date_in_input.split("-");
				if(date_parts.length == 3) {
					date_parts[1]--; //Month starts with 0
					selected_date = new Date(date_parts[0], date_parts[1], date_parts[2]);
				}
				if(selected_date && !isNaN(selected_date.getYear())) { //Valid date.
					existing_date = selected_date;
				}
			}
			
			var the_year = existing_date.getYear();
			if(the_year < 1900) the_year += 1900;
			this.makeCalendar(the_year, existing_date.getMonth(), existing_date.getDate());
			document.getElementById(this.opt['calendar']).style.display = "block";
			_calendar_active_instance = this;
		},
		
		/// Hides the currently show calendar.
		hideCalendar: function(instance) {
			var active_calendar_id = "";
			if(instance) active_calendar_id = instance.opt['calendar'];
			else active_calendar_id = _calendar_active_instance.opt['calendar'];
			
			if(active_calendar_id) document.getElementById(active_calendar_id).style.display = "none";
			_calendar_active_instance = {};
		},
		
		/// Setup a text input box to be a calendar box.
		set: function(input_id) {
			var input = document.getElementById(input_id);
			if(!input) return; //If the input field is not there, exit.
			
			if(!this.opt['calendar']) this.init();
			
			var ths = this;
			input.onclick=function(){
				ths.opt['input'] = this.id;
				ths.showCalendar();
			};
		},
		
		/// Will be called once when the first input is set.
		init: function() {
			if(!this.opt['calendar'] || !document.getElementById(this.opt['calendar'])) {
				var div = document.createElement('div');
				if(!this.opt['calendar']) this.opt['calendar'] = 'calender_div_'+ Math.round(Math.random() * 100);

				div.setAttribute('id',this.opt['calendar']);
				div.className="calendar-box";

				document.getElementsByTagName("body")[0].insertBefore(div,document.getElementsByTagName("body")[0].firstChild);
			}
		}
	}

</script>

</head>
<body >
	<div id="menu">
		<ul>			
			<li ><a href="modLink.jsp">Homepage</a></li>
			<li class="active"><a href="" title="">Forms</a></li>
			<li><a href=# onclick="loadHelp();return false;">Help</a></li>
			<li><a href=# onclick="loadFaq();return false;">FAQs</a></li>
			<li><a href=# onclick="loadContactUs();return false;">Contact Us</a></li>
			<li style="float: right"><a href="logout.jsp">Logout</a></li>
		</ul>
	</div>
<div id="myContent"  style="min-height: 400px;height: auto !important;height: 400px">
<div id="logo">
  <h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
	</div>
<div align="middle">
    <strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI Registration Form</font></strong>
</div>
<div align="center" style="margin-left:5%">
<%
        
        DateFormat dateFormat1 = new SimpleDateFormat("ssmmHHddMMyy");
        Date currentDate1 = new Date();
        String RNO=dateFormat1.format(currentDate1);
        System.out.println(RNO);        
%>
  <form action="javascript:loadSubmitForm('form1','submitForm.jsp','myContent')" method="post" id="form1" name="form1" onSubmit="return validateAge()">
      <font color="#000000"> 
      <table>
		<tr>
			<td>
				<div align="right"><label></label></div>
			</td>
			<td>
				<div align="left"></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
        <tr>
          <td>
	      	<div align="right"><label for="RegistrationNumber">Registration Number/<%=l.regno %></label></div>
	      </td>
	      <td>
          	<div align="left"><input name="RegistrationNumber" type="text" id="RegistrationNumber" size="35" value="<% out.println(RNO); %>" readonly/></div>
          </td>          
          <td></td>
          <td>
          	<div align="left"></div>
          </td>         
        </tr>
        <%
          
          DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
          Date currentDate = new Date();
          String DOR=dateFormat.format(currentDate);
          System.out.println(DOR);
        %>
		<tr>
			<td>
				<div align="right"><label for="date"><font color="RED">*</font>Date/<%=l.date %></label></div>
			</td>
			<td>
				<div align="left"><input name="date" type="text" id="date" size="35" maxlength="11" readonly value="<%out.println(DOR); %>"/></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label><font size="+1" color="#000000"><strong>PRIMARY DETAILS:</strong></font></label></div>
			</td>
			<td>
				<div align="left"></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="firstName2"><font color="RED"> * </font>First Name/<%=l.firstname %></label></div>
			</td>
			<td>
				<div align="left"><input name="firstName2" type="text" id="firstName2" autofocus size="35" required onblur="validateFirstName()" maxlength="40" onkeyup="copy_data(this,'firstName')" onfocus="onFocus('firstName')" onkeydown="return Backspace(event,'firstName')"/></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><input name="firstName" type="text" id="firstName" readonly size="35" maxlength="40" />	</div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="lastName2">Last Name/<%=l.lastname %></label></div>
			</td>
			<td>
				<div align="left"><input name="lastName2" type="text" id="lastName2" size="35" maxlength="40" onkeyup="copy_data(this,'lastName')" onfocus="onFocus('lastName')" onkeydown="return Backspace(event,'lastName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="lastName" type="text" id="lastName" readonly size="35" maxlength="40" /></div>
			</td>			
		</tr>
		<tr>
			<td>
				<div align="right"><label for="middleName2">Middle Name/<%=l.mname %></label></div>
			</td>
			<td>
				<div align="left"><input name="middleName2" type="text" id="middleName2" size="35" maxlength="40" onkeyup="copy_data(this,'middleName')" onfocus="onFocus('middleName')" onkeydown="return Backspace(event,'middleName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="middleName" type="text" id="middleName" readonly size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="fatherName2">Father/Mother/Guardian Name/<%=l.guardian%></label></div>
			</td>
			<td>
				<div align="left"><input name="fatherName2" type="text" id="fatherName2" size="35" maxlength="40" onkeyup="copy_data(this,'fatherName')" onfocus="onFocus('fatherName')" onkeydown="return Backspace(event,'fatherName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="fatherName" readonly type="text" id="fatherName" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="dateOfBirth">Date Of Birth/<%=l.dob %></label></div>
			</td>
			<td>
				<div align="left"><input name="dateOfBirth" type="text" id="dateOfBirth" size="35" maxlength="45" readonly/></div>
				<script type="text/javascript">
		 				calendar.set("dateOfBirth"); 				
		 			</script>
			</td>
			<td>
				<div align="left"></div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="ifNotKnownAge2">If Not Known Age/<%=l.age %></label></div>
			</td>
			<td>
				<div align="left"><input name="ifNotKnownAge2" type="text" id="ifNotKnownAge2"  onblur="validateAge()" size="35" maxlength="3" onkeyup="copy_data(this,'ifNotKnownAge')" onfocus="onFocus('ifNotKnownAge')" onkeydown="return Backspace(event,'ifNotKnownAge')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="ifNotKnownAge" readonly type="text" id="ifNotKnownAge" size="35" maxlength="3" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="gender">Gender/<%=l.gender %></label></div>
			</td>
			<td>
				<div align="left">
					<p>
			            <input type="radio" name="gender" value="M" id="gender_0" required/>Male/<%=l.male %>
			            <br />
			            <input type="radio" name="gender" value="F" id="gender_1"/>Female/<%=l.female %>
			            <br />
			            <input type="radio" name="gender" value="T" id="gender_2" />Transgender/<%=l.transgender %>
			            <br />
		        	</p>
				</div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><strong><em>Residential Address/<%=l.raddress %></em></strong></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
			<td>
				<div align="left"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="c/o2">C/O / <%=l.co %></label></div>
			</td>
			<td>
				<div align="left"><input name="c/o2" type="text" id="c/o2" size="35" maxlength="40" onkeyup="copy_data(this,'c/o')" onfocus="onFocus('c/o')" onkeydown="return Backspace(event,'c/o')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="c/o" type="text" readonly id="c/o" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="houseNoAndName2"><font color="RED"> * </font>House No. And Name/<%=l.hno %>:</label></div>
			</td>
			<td>
				<div align="left"><input name="houseNoAndName2" type="text" id="houseNoAndName2" required onblur="validateHouseNo()" size="35" maxlength="40" onkeyup="copy_data(this,'houseNoAndName')" onfocus="onFocus('houseNoAndName')" onkeydown="return Backspace(event,'houseNoAndName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="houseNoAndName" readonly type="text" id="houseNoAndName" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="streetNoAndName2"><font color="RED"> * </font>Street Number And Name/<%=l.street %>:</label></div>
			</td>
			<td>
				<div align="left"><input name="streetNoAndName2" type="text" id="streetNoAndName2" size="35" required onblur="validateStreetNo()" maxlength="40" onkeyup="copy_data(this,'streetNoAndName')" onfocus="onFocus('streetNoAndName')" onkeydown="return Backspace(event,'streetNoAndName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="streetNoAndName" readonly type="text" id="streetNoAndName" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="landmark2">Landmark/<%=l.landmark %>:</label></div>
			</td>
			<td>
				<div align="left"><input name="landmark2" type="text" id="landmark2" size="35" maxlength="40" onkeyup="copy_data(this,'landmark')" onfocus="onFocus('landmark')" onkeydown="return Backspace(event,'landmark')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="landmark" readonly type="text" id="landmark" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr style="display: none;">
			<td>
				<div align="right"><label for="village2"><font color="RED"> * </font>Village/City / <%=l.city %></label></div>
			</td>
			<td>
				<div align="left"><input name="village2" type="text" id="village2" size="35"  onblur="validateVillage()" maxlength="40" onkeyup="copy_data(this,'village')" onfocus="onFocus('village')" onkeydown="return Backspace(event,'village')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="village" readonly type="text" id="village" size="35" maxlength="40" /></div>
			</td>
		</tr>		
		<tr>
			<td>
				<div align="right"><label><font color="RED"> * </font>State/<%=l.state %>:</label></div>
			</td>
			<td>
				<div align="left">
					<select name="state" id="state" onchange="javascript: dropdownlist(this.selectedIndex);">
						<option selected="selected">-Select State-</option>
						<option value="Andhra Pradesh">Andhra Pradesh</option> 
						<option value="Arunachal Pradesh">Arunachal Pradesh</option>
						<option value="Assam">Assam</option> 
						<option value="Bihar">Bihar</option> 
						<option value="Chhattisgarh">Chhattisgarh</option> 
						<option value="Goa">Goa</option> 
						<option value="Gujarat">Gujarat</option> 
						<option value="Haryana">Haryana</option> 
						<option value="Himachal Pradesh">Himachal Pradesh</option> 
						<option value="Jammu and Kashmir">Jammu and Kashmir</option> 
						<option value="Jharkhand">Jharkhand</option> 
						<option value="Karnataka">Karnataka</option> 
						<option value="Kerala">Kerala</option> 
						<option value="Madya Pradesh">Madya Pradesh</option> 
						<option value="Maharastra">Maharastra</option> 
						<option value="Manipur">Manipur</option>
						<option value="Meghalaya">Meghalaya</option> 
						<option value="Mizoram">Mizoram</option> 
						<option value="Nagaland">Nagaland</option> 
						<option value="Orissa">Orissa</option> 
						<option value="Punjab">Punjab</option>  
						<option value="Rajasthan">Rajasthan</option>
						<option value="Sikkim">Sikkim</option>
						<option value="Tamil Nadu">Tamil Nadu</option>
						<option value="Tripura">Tripura</option>
						<option value="Uttaranchal">Uttaranchal</option>
						<option value="Uttar Pradesh">Uttar Pradesh</option>
						<option value="West Bengal">West Bengal</option>
						<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
						<option value="Chandigarh">Chandigarh</option>
						<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
						<option value="Daman and Diu">Daman and Diu</option>
						<option value="Delhi">Delhi</option>
						<option value="Lakshadweep">Lakshadweep</option>
						<option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
						<option value="Puducherry">Puducherry</option>
					</select>
				</div>
			</td>
			<td></td>
			<td>
				<div align="left"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label><font color="RED"> * </font>City/<%=l.city %></label></div>
			</td>
			<td>
				<div align="left">
					<select name="district" id="district" >
						<option value="">Select City</option>
					</select>
				</div>
			</td>
			<td></td>
			<td>
				<div align="left"></div>
			</td>
		</tr>
		<tr>	
			<td>
				<div align="right"><label for="pincode2"><font color="RED"> * </font>Pincode/<%=l.pin %></label></div>
			</td>
			<td>
				<div align="left"><input name="pincode2" type="text" id="pincode2" size="35" oninput="validatePincode()" required maxlength="40" onkeyup="copy_data(this,'pincode')" onfocus="onFocus('pincode')" onkeydown="return Backspace(event,'pincode')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="pincode" readonly type="text" id="pincode" size="35" maxlength="40" /></div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="right"><label><strong><em>Permanent Address/<%=l.paddress %></em></strong></label></div>
			</td>
			<td>
				<div align="left">
					<p>            
		            	<input type="radio" name="same" value="Same as above" id="same_0" onChange="copyAddress(1)"/>Same as above/<%=l.same %>
		            	<br />
			            <input type="radio" name="same" value="No" id="same_1" onChange="copyAddress(0)" />No/<%=l.no%>
			            <br />
		        	</p>
				</div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label><strong><em></em></strong></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="pc/o2">C/O / <%=l.co %></label></div>
			</td>
			<td>
				<div align="left"><input name="pc/o2" type="text" id="pc/o2" size="35" maxlength="40" onkeyup="copy_data(this,'pc/o')" onfocus="onFocus('pc/o')" onkeydown="return Backspace(event,'pc/o')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="pc/o" readonly type="text" id="pc/o" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="phouseNoAndName2">House No. And Name/<%=l.hno %></label></div>
			</td>
			<td>
				<div align="left"><input name="phouseNoAndName2" type="text" id="phouseNoAndName2" size="35" maxlength="40" onkeyup="copy_data(this,'phouseNoAndName')" onfocus="onFocus('phouseNoAndName')" onkeydown="return Backspace(event,'phouseNoAndName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="phouseNoAndName" readonly type="text" id="phouseNoAndName" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="pstreetNoAndName2">Street Number And Name/<%=l.street %></label></div>
			</td>
			<td>
				<div align="left"><input name="pstreetNoAndName2" type="text" id="pstreetNoAndName2" size="35" maxlength="40" onkeyup="copy_data(this,'pstreetNoAndName')" onfocus="onFocus('pstreetNoAndName')" onkeydown="return Backspace(event,'pstreetNoAndName')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="pstreetNoAndName" readonlt type="text" id="pstreetNoAndName" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="plandmark2">Landmark/<%=l.landmark %></label></div>
			</td>
			<td>
				<div align="left"><input name="plandmark2" type="text" id="plandmark2" size="35" maxlength="40" onkeyup="copy_data(this,'plandmark')" onfocus="onFocus('plandmark')" onkeydown="return Backspace(event,'plandmark')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="plandmark" readonly type="text" id="plandmark" size="35" maxlength="40" /></div>
			</td>			
		</tr>
		<tr style="display: none;">
			<td>
				<div align="right"><label for="pvillage2">Village/City / <%=l.city %></label></div>
			</td>
			<td>
				<div align="left"><input name="pvillage2" type="text" id="pvillage2" size="35" maxlength="40" onkeyup="copy_data(this,'pvillage')" onfocus="onFocus('pvillage')" onkeydown="return Backspace(event,'pvillage')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="pvillage" readonly type="text" id="pvillage" size="35" maxlength="40" /></div>
			</td>
		</tr>		
		<tr>
			<td>
				<div align="right"><label>State/<%=l.state %></label></div>
			</td>
			<td>
				<div align="left">
					<select name="pstate" id="pstate" onchange="javascript: dropdownlistp(this.selectedIndex);">
						<option selected="selected">-Select State-</option>
						<option value="Andhra Pradesh">Andhra Pradesh</option> 
						<option value="Arunachal Pradesh">Arunachal Pradesh</option>
						<option value="Assam">Assam</option> 
						<option value="Bihar">Bihar</option> 
						<option value="Chhattisgarh">Chhattisgarh</option> 
						<option value="Goa">Goa</option> 
						<option value="Gujarat">Gujarat</option> 
						<option value="Haryana">Haryana</option> 
						<option value="Himachal Pradesh">Himachal Pradesh</option> 
						<option value="Jammu and Kashmir">Jammu and Kashmir</option> 
						<option value="Jharkhand">Jharkhand</option> 
						<option value="Karnataka">Karnataka</option> 
						<option value="Kerala">Kerala</option> 
						<option value="Madya Pradesh">Madya Pradesh</option> 
						<option value="Maharastra">Maharastra</option> 
						<option value="Manipur">Manipur</option>
						<option value="Meghalaya">Meghalaya</option> 
						<option value="Mizoram">Mizoram</option> 
						<option value="Nagaland">Nagaland</option> 
						<option value="Orissa">Orissa</option> 
						<option value="Punjab">Punjab</option>  
						<option value="Rajasthan">Rajasthan</option>
						<option value="Sikkim">Sikkim</option>
						<option value="Tamil Nadu">Tamil Nadu</option>
						<option value="Tripura">Tripura</option>
						<option value="Uttaranchal">Uttaranchal</option>
						<option value="Uttar Pradesh">Uttar Pradesh</option>
						<option value="West Bengal">West Bengal</option>
						<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
						<option value="Chandigarh">Chandigarh</option>
						<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
						<option value="Daman and Diu">Daman and Diu</option>
						<option value="Delhi">Delhi</option>
						<option value="Lakshadweep">Lakshadweep</option>
						<option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
						<option value="Puducherry">Puducherry</option>
					</select>
				</div>
			</td>
			<td></td>
			<td>
				<div align="left"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label>City/<%=l.city %></label></div>
			</td>
			<td>
				<div align="left">
					<select name="pdistrict" id="pdistrict" >
						<option value="">Select City</option>
					</select>
				</div>
			</td>
			<td></td>
			<td>
				<div align="left"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="ppincode2">Pincode/<%=l.pin %></label></div>
			</td>
			<td>
				<div align="left"><input name="ppincode2" type="text" id="ppincode2" size="35" maxlength="40" onkeyup="copy_data(this,'ppincode')" onfocus="onFocus('ppincode')" onkeydown="return Backspace(event,'ppincode')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="ppincode" readonly type="text" id="ppincode" size="35" maxlength="40" /></div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="right"><label><strong><em>Optional Information/<%=l.optinfo %></em></strong></label></div>
			</td>
			<td>
				<div align="left"></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="emailId">Email ID/<%=l.email %></label></div>
			</td>			
			<td>
				<div align="left"><input name="emailId" type="email" id="emailId" size="35" maxlength="40" /></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="phoneNo2.">Phone Number/<%=l.phno %></label></div>
			</td>
			<td>
				<div align="left"><input name="phoneNo2." type="text" id="phoneNo2." size="35" maxlength="40" onkeyup="copy_data(this,'phoneNo')" onfocus="onFocus('phoneNo')" onkeydown="return Backspace(event,'phoneNo')"/></div>
			</td>
			<td></td>
			<td>
				<div align="left"><input name="phoneNo" readonly type="text" id="phoneNo" size="35" maxlength="40" /></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label>Mode of contact/<%=l.mode %></label></div>
			</td>
			<td>
				<div align="left">
					<p>
			            <input type="radio" name="contact" value="cemail" id="contact_0" />E-Mail/<%=l.Email %>
			            <br />
			            <input type="radio" name="contact" value="mail" id="contact_1"/>Mail/<%=l.mail%>
			            <br />
			            <input type="radio" name="contact" value="both" id="contact_2" />Both/<%=l.both %>
			            <br />
		        	</p>
				</div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label></label></div>
			</td>
			<td>
				<div align="left"></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="fingerprint[]">FingerPrint:</label></div>
			</td>
			<td>
				<div align="left"><input name="fingerprint[]" type="file" id="fingerprint" size="35" multiple/></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="photo">Photo:</label></div>
			</td>
			<td>
				<div align="left"><input name="photo" type="file" id="photo" size="35" required /></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="addressProof">Address Proof:</label></div>
			</td>
			<td>
				<div align="left"><input name="addressProof" type="file" id="addressProof" size="35" required /></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="right"><label for="birthProof">Birth Proof:</label></div>
			</td>
			<td>
				<div align="left"><input name="birthProof" type="file" id="birthProof" size="35" required /></div>
			</td>
			<td></td>
			<td>	          
				<div align="right"><label></label></div>
			</td>
		</tr>
      </table>
      </div>
      <br /><br />
      <table width="100%" >
  <tr>
    <td width="47%"><div align="right">
      <input type="checkbox" name="accept" required="required" id="accept"/>
    </div></td>
    <td width="500%"><label>
    I Accept All Terms And Conditions</label></td>
  </tr>
</table>

      <table width="95%">
        <tr>
          <td width="57%"><div align="right">
            <input type="submit" name="submit" id="submit" value="Submit" onmouseover="eliminateBlank()"/>
          </td>
          <td width="43%">
          <input type="reset" name="reset" id="reset" value="Reset" /></td>
        </tr>
      </table>
      </font>
      </form>
</div>

		

<div id="footer">
	<p id="legal">Copyright &copy; 2012 Criterion. All Rights Reserved. Designed by <a href="#">Geniobrainiacs</a>.</p>
	<p id="links"><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
</div>
</body>
</html>