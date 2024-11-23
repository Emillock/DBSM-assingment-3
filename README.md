<h1 align="center">
	Database Systems
	<br/>
	Assignment 3
</h1>
<h3 align="center">Introduction</h3>
<p>The "assignment_3.sql" file contains the SQL code that normalizes the data in "Unnormalized1(Sheet1).csv". After the execution, the structure is given that passes all 3 normal forms. The below E-R diagram shows the resulting structure:</p>
<img src="https://github.com/user-attachments/assets/4e740217-4326-4b31-9892-74a60eafcf2d"/>
<p>The last 5 lines of code consist of the "select" statement for all resulting tables with the purpose of demonstration.</p>
<h3 align="center">Installation</h3>
<p>First of all, download "assignment_3.sql" into any directory. Then download the "Unnormalized1(Sheet1).csv" into the following path: "C:\Users\Public" (so the path to the file is "C:\Users\Public\Unnormalized1(Sheet1).csv"). 
	<br/>
	<br/> 
	<b>Note:</b> If there is a need to change the installation directory or name of the "Unnormalized1(Sheet1).csv" file, it should be also changed on the 21st line of code in "assignment_3.sql" (<code>copy books_for_courses from 'C:\Users\Public\Unnormalized1(Sheet1).csv' delimiter ',' csv header;</code>). Keep in mind that Postgres may require the permissions to read the non-public files, otherwise the execution of code might result in an error.
</p>
<p>
	After both files are properly installed, the "assignment_3.sql" can be executed from command line using this command: <br>
	<code>psql -U user_name -d database_name -f file.sql</code>
	Another option is to execute the code through PG Admin interface (there is a need to install it first).
</p>
