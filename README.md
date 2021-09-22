
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
