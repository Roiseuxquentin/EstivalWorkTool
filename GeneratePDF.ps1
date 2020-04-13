# Script Html to Pdf
# Pour Estival 
# eegloo 2020
# quentin@roiseux.fr

# ADD MODULE
Add-Type -AssemblyName System.Windows.Forms

# PDF tool Path into variable
$PDFtoolPath = 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'

# INPUT HTML FOLDER
[void][System.Windows.Forms.MessageBox]::Show("ETAPE 1 : Selection du dossier project_sheets contenant les fichiers HTML.", "PDF" , 0, 32)
$FolderInput = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{ ShowNewFolderButton = $false }
[void]$FolderInput.ShowDialog()

# OUTPUT PDF FOLDER
[void][System.Windows.Forms.MessageBox]::Show("ETAPE 2 : Selection du dossier pour la création du fichier PDF.", "PDF" , 0, 32)
$FolderOutput = New-Object System.Windows.Forms.FolderBrowserDialog
[void]$FolderOutput.ShowDialog()

$FileList = @()

# READ HTML FILE LIST FROM SELECTED FOLDER
ls $FolderInput.SelectedPath  | Where-Object {$_.Extension -eq ".html"} |  Foreach-Object {
          $file = "$($FolderInput.SelectedPath)\$($_.Name)"
          $FileList += $file                        
}

# MERGE MULTIPLE PDF TO SINGLE PDF
# WRITE PDF FILE TO SELECTED FOLDER
& $PDFtoolPath $fileList "$($FolderOutput.SelectedPath)\output.pdf"

# END MSG
[void][System.Windows.Forms.MessageBox]::Show("Le fichier PDF a été généré dans $($FolderOutput.SelectedPath)\ ", "PDF" , 0, 64)
