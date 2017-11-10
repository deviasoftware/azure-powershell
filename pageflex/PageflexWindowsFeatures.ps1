<#Copyright 2017 Devia Software, LLC www.devia.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Testing:
Tested on Windows Server 2012 R2 against both Pageflex 8.X and Pageflex 9.X.  There is no reason it should not work with other versions.

Description:
This Powershell Script installs All necessary Features required for PF SErver and Storefront to run.  It basically automates the section 
of the readme file:Internet Information Services (IIS), URL Rewrite Module, and Microsoft Message Queuing (MSMQ)  AND Support Article 1545

#>

Install-WindowsFeature Web-Server,Web-Server,Web-Common-Http,Web-Default-Doc,Web-Dir-Browsing,Web-Http-Errors,Web-Static-Content,Web-Http-Redirect,Web-Health,Web-Http-Logging
Install-WindowsFeature NET-Framework-Features,NET-Framework-Core
Install-WindowsFeature MSMQ
Install-WindowsFeature Web-Performance, Web-Stat-Compression, Web-Dyn-Compression
Install-WindowsFeature Web-Security,Web-Filtering, Web-Windows-Auth
Install-WindowsFeature Web-App-Dev,Web-Net-Ext,Web-Net-Ext45,Web-Asp-Net,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes
Install-WindowsFeature Web-Mgmt-Tools,Web-Mgmt-Console,Web-Mgmt-Compat,Web-Metabase,Web-Lgcy-Mgmt-Console,Web-Lgcy-Scripting,Web-WMI,Web-Scripting-Tools



