
1. Creating a Web Server on IBMi.

Create a new HTTP server.
Follow the creation process.
After creating, edit the configuration file.
Refresh and restart the server.
The server is Created.
2. Create a program to handle GET requests.

Create RPG program with including supportive service program (QHTTPSVR/QZHBCGI) into Binding directory.
The program will accept the parameter from the browser and return the result to the browser.
Pass the GET URL to fetch the corresponding details
Information will reflect the browser.
3. Create a program to handle POST requests.

Create RPG program with including supportive service program (QHTTPSVR/QZHBCGI) into Binding directory.
This Program will convert TCP data to EBCDIC character set.
Pass the GET URL to fetch the corresponding details
Information will reflect the browser.
The program will return converted EBCDIC character data to the browser.
Repository :
Physical file:

EMP_MAST: Employee-related details like ID, Name, Age, Mobile NO Department.
EMP_MAST2: Flat file to store the message.
GET :

WEBGET: Consuming GET to retrieve information from :
https://gorest.co.in/public/v1/posts
Getmthdpgm: Handling GET requests from the browser to retrieve information from Physical File.
POST:

POSTmthd: Handling POST requests from the browser to retrieve information related to the browser like URL, Content type, Request method.
webpost: Consuming GET to store information to : https://gorest.co.in/public/v1/users
PRACTICE_SRC:


PUT:

webput: Consuming PUT to update name/gender/status information as per ID from : https://gorest.co.in/public/v1/comments/
DELETE

webdlt: Consuming DELETE to delete information for per ID from : https://gorest.co.in/public/v1/tod
