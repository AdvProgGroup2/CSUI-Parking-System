CSUI Parking System - Group 2
*** Instruction’s Manual ***

Requirements:
1. Make sure that your JDK is up to date (minimum JDK 8).
2. It is best to have Eclipse Luna version on your computer.
3. Make sure that you have a sufficient internet connection. Several assets cannot be loaded when there is no internet connection.

Steps:
1. Install Apache Tomcat 8 on your computer by following this link: http://tomcat.apache.org/download-80.cgi (download the zip file under the ‘core binary distribution’)
	- For windows: 
		a. Extract the zip file into a specific location other than Desktop. For example: “d:\myProject”
		b. To make it easier, rename the directory from “d:\myProject\apache-tomcat-8.0.22” into “d:\myProject\tomcat”. Make sure you take note the location of the installed directory.
		c. To run the server, launch a CMD shell. Set the current directory to “<TOMCAT_HOME>\bin” and run “startup.bat”. Look for the Tomcat’s port number.
		d. Try to run it in a browser by typing this url -> http://localhost:<portnumber>
		e. When it is successful, turn the server off by running “shutdown.bat” on the “<TOMCAT_HOME>\bin” directory in CMD shell.
	- For Mac OS X:
		a. Open Terminal app
		b. Follow these series of commands:
			sudo mkdir -p /usr/local
			sudo mv ~/Downloads/apache-tomcat-8.0.22 /usr/local
			sudo rm -f /Library/Tomcat
			sudo ln -s /usr/local/apache-tomcat-8.0.22 /Library/Tomcat
			sudo chown -R <your_username> /Library/Tomcat
			sudo chmod +x /Library/Tomcat/bin/*.sh
		c.  To run the server:
			/Library/Tomcat/bin/startup.sh
		d. Try to run it in the browser by typing this url -> localhost:8080
		e. When it is successful, turn the server off by typing this command in Terminal:
			/Library/Tomcat/bin/shutdown.sh
2. Install XAMPP by following this link: https://www.apachefriends.org/download.html or enabling mysql system on your computer. Activate the ‘MySQL Database’ and ‘Apache Web Server’ in your XAMPP manager.
3. Configure the MySQL Database.
	a. In your browser, go to ‘localhost/phpmyadmin’
	b. Select ‘New’ and create a new database called ‘parking’
	c. Select the ‘Import’ tab and Click the ‘Choose File’ button
	d. Locate the ‘parking.sql’ file
	e. Click ‘Go’.
4. Install Oracle WebLogic Server Tools for Luna on your Eclipse from Eclipse Marketplace. Eclipse will restart.
5. Switch to Java EE perspective on your Eclipse. Make sure that you link the JDK 8 to the Eclipse.
6. Create a new ‘Dynamic Web Project’ and set the name into ‘ParkingSystem’.
	Right-click -> new -> Dynamic Web Project -> Project name : Parking System
7. Import ‘ParkingSystem’ src folder into ‘Java Resources’ directory in your Dynamic Web Project. Create a new
package of ‘Parking’ in the src folder before importing.
8. Import ‘WebContent’ folder into ‘WebContent’ directory in your Dynamic Web Project.
9. Configure the Apache Tomcat so that it links to the Dynamic Web Project.
	a. Right click on the ‘ParkingSystem’
	b. Click ‘Properties’
	c. Go to ‘Project Facets’ and click the ‘Runtimes’ tab
	d. Tick the ‘Apache Tomcat v8.0’. If there are no such thing, click new, select the ‘Apache Tomcat v8.0’ and click finish.
	e. Press OK.
10. Move the .jar file into the ‘WEB-INF’ directory. (This step is just to make sure that the database can be executed in the program).
11. Configure the JAR file on the Dynamic Web Project.
	a. ‘Java Resources’ -> Libraries -> Right-click on JRE System Library
	b. Choose ‘Build Path’
	c. Choose ‘Configure Build Path’
	d. Click the ‘Add External JARs’ button
	e. Locate the ‘mysql-connector-java-5.1.35-bin.jar’ in the file system
		ParkingSystem folder -> WebContent -> WEB-INF -> lib -> mysql-connector-java-5.1.35-bin.jar
	f. Press OK.
	g. Inside ParkingSystem Dynamic Web Project in Eclipse, there is a directory named ‘WebContent’. Open the directory. Right-click on the WEB-INF and choose import. Import the ‘mysql-connector-java-5.1.35-bin.jar’ file.
12. Run the index.jsp on your eclipse.