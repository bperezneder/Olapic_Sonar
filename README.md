# Olapic Sonar API
##Restful API testing Using Behat
=========================================

###Requirements:
- Having installed PHP5

###Installation:
1. Clone this repository <br>
<code>$ git clone https://github.com/dgirardello/Olapic_Sonar</code>
2. Download Composer <br>
<code>$ cd Olapic_Sonar<br>
Olapic_Sonar$ curl -sS https://getcomposer.org/installer | php</code>
3. Install Behat <br>
<code>Olapic_Sonar$ php composer.phar install</code>
4. Initialize Behat <br>
<code>Olapic_Sonar$ bin/behat --init</code>

###Running the Suite
- To run the full suite <br><code>Olapic_Sonar$ bin/behat</code>
- To run the full suite writing the html reports<br><code>Olapic_Sonar$ bin/behat -f html --out reports/execution_report.html</code>
- To run the full suite writing the junit reports<br><code>Olapic_Sonar$ bin/behat -f junit --out reports/execution_report.junit</code>



