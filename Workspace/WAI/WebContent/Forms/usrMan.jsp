<%
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>


<!-- <div id="myContent"> -->

<!-- 	<div id="logo"> -->
<!-- 	<h1> -->
<!-- 	<a href="#">WAI</a> -->
<!-- 	</h1> -->
<!-- 	<h2> -->
<!-- 	<a href="#">by geniobrainiacs</a> -->
<!-- 	</h2> -->
<!-- 	</div> -->

	<div id="manual">
		<div id="welcome" class="post">
		<h2 class="title">Welcome</h2>
		
		<div class="story">
		<p>
		<p><strong>WAI</strong> is a Unique management system developed by <strong>Bijil.A.P</strong>, <strong>Sunil.B.N</strong> and <strong>Harsha.P</strong> currently pursuing B.E in computer science and engineering at <strong>University Visvesvaraya College of Engineering (UVCE).</strong></p>
		</div>
		</div>
		<div id="example" class="post">
		<h2 class="title">Guidelines</h2>
		<div class="story">
		<ul type="disc">
			<li>
				<div>
					<font size="3">Step 1	:	Collecting and integrating pre-enrolment data : by Moderator.</font>
					<br/><br/>
				</div>
			</li>			
			<li>
				<div>
					<font size="3">Step 2	: 	Logging into the WAI : by Moderator.</font>
					<br/><br/>
				</div>
			</li>			
			<li>
				<div>
					<font size="3">
						Step 3	: 	Using the pre-enrolment data to fill into the application form : by Moderator.
					</font>
					<br/><br/>
				</div>
			</li>			
			<li>
				<div>
					<font size="3">
						Step 4	: 	Capturing applicants' demographic data, banking information and biometric (photo 
						and fingerprint) : by Moderator.
					</font>
					<br/><br/>
				</div>
			</li>			
			<li>
			<div>
				<font size="3">Step 5	: 	Confirming the collected and captured data : by Applicant.</font>
				<br/><br/>
			</div>
			</li>			
			<li>
			<div>
				<font size="3">
					Step 6	: 	Once UID has been generated , it will be conveyed via the mode of contact specified.
				</font>
				<br/><br/>
			</div>
			</li>			
		</ul>
		<font size="+5">
			<b><i>REFER <a href=# onclick="loadFaq();return false;">FAQs</a> FOR MORE DETAILS.</i></b>
		</font>
		<br/><br/>
		</div>		
		</div>
	</div>
<!-- </div> -->