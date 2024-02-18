# OLAP STATUS POWRESHELL SCRIPT

# This checks the OLAPSTATUS.DAT File.
# The file only has 3 settings - Running, Stopped and DiskFailure
# This file is checked non-stop and will email the TSC Group when a DISKFAILURE is received
# Created March 12, 2021 
# 

While ($True)
{
    $SEL = get-content C:\powershell\testdata1.txt
    if ($SEL -imatch "Running" -eq $True) {
        Write-Host "Running Well"
        
    }
    elseif ($SEL -imatch "DiskFailure" -eq $True) {
        Write-Host "Disk Failure"
        $Encoding = [System.Text.Encoding]::UTF8

            $MailFromSup = "youremail@company.com""
            $MailToSup = "youremail@company.com"
            $MailSubj = "AUX OLAP Server Status DiskFailure"
            $MailTextSup = "AUX OLAP DISK FAILURE"
            $MailSMTPServer = "10.30.20.10"
            $MailSMTPPort = "25"

            $SMTPMessageSup = New-Object System.Net.Mail.MailMessage $MailFromSup, $MailToSup, $MailSubj, $MailTextSup
            $SMTPMessageSup.BodyEncoding = $Encoding
            $SMTPMessageSup.SubjectEncoding = $Encoding
            $SMTPClient = New-Object net.mail.smtpclient($MailSMTPServer,$MailSMTPPort)
            $SMTPClient.Send($SMTPMessageSup)
            $SMTPClient.Send($EmailFrom, $EmailTo, $EmailSubject, $EmailBody)
            start-sleep -seconds 600 # When it does find it sleep for 10 minutes
    }
        # code if Stopped
    elseif($SEL -imatch "Stopped" -eq $True) {
            Write-Host "Stopped"
            
      }
    start-sleep -seconds 10
}



