#Script uses Absolute paths
#Copies Students JPEG photo files from SchoolFiles folder to the Destiny Folder
#Calls the BuildMapFile script to build and zip required files
#Author: grdsystems
#Date:  04/27/2022 
#Version: 1.0

$source = "E:\SchoolFiles\"
$destination = "G:\Destiny\"


#Use windows robocopy utility to traverse SchooFiles folder structure and pull .JPG files, filters out non-photo folders. 
#future robocopy calls will only copy new or changed files 

Invoke-Expression "robocopy $source $destination *.jpg /E /Z /R:5 /W:5 /TBD /NP /V /XO  /xd 'PHOTOS_old' /xd 'BITMAPS' /xd 'CDFS' /xd 'INI' /xd 'PWD' /xd 'DATA' /xd 'AdminReports' /xd 'Client Setup'"

#Call to BuildMapFile

& $destination\BuildMapFile.ps1



