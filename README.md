
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


Create a program to handle GET request.
Fetch data from database using Get request.

Create a RPG program which can hanlde get request.
This Program will send the data from a physical file to browser.
Create a Physical File to store the data.
Send Get request through URL.
Data will be displayed on browser.
Create a program to handle POST request.
Convert TCP data to EBCDIC character set.

Create a RPG Program which can handle post request.
This Program will convert TCP data to EBCDIC character set.
Send Post request through URL.
Give plain text in the body of the URL, which you want to convert.
Program will return converted EBCDIC character data to brower
