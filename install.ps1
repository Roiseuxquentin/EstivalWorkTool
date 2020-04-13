# Script Html to Pdf
# Pour Estival 
# eegloo 2020
# quentin@roiseux.fr

# ADD MODULE
Add-Type -AssemblyName System.Windows.Forms

# recup pdf tools
 wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox-0.12.5-1.msvc2015-win64.exe -OutFile install.exe

# INSTALL PDF TOOLS
 Start-Process '.\install.exe' "/S" -Verb runAs

 sleep 5

# DELETE install
 Remove-Item '.\install.exe'

# DIALOG POUR LA DESTINATION DU FICHIER
[void][System.Windows.Forms.MessageBox]::Show("L'installation est terminée, lancer le fichier 'GeneratePDF.exe' pour migrer les fichiers HTML du dossier 'projet_sheets/' en PDF.", "PDF" , 0, 64)
