
<#

.SYNOPSIS  
		Provides a Right Click, Send To Option to copy .PS1 files to .TXT files in the same directory

.DESCRIPTION  
		Tested on Windows 8/8.1

.NOTES  
    Version							: 0.2
		
    Ideas/Wish list			: To work with other file formats such as .psm1
    
    Rights Required			: NA
    
    Sched Task Required	: No
    
    Author/Copyright		: © Tom Arbuthnot - All Rights Reserved
    
    Email/Blog/Twitter	: tom@tomarbuthnot.com lyncdup.com @tomarbuthnot
    
    Dedicated Post			: 
    
    Disclaimer   				: THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK
                          OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
                          While these scripts are tested and working in my environment, it is recommended 
                          that you test these scripts in a test environment before using in your production 
                          environment
                          Tom Arbuthnot further disclaims all implied warranties including, without limitation, any 
                          implied warranties of merchantability or of fitness for a particular purpose. The entire risk 
                          arising out of the use or performance of this script and documentation remains with you. 
                          In no event shall Tom Arbutnot, its authors, or anyone else involved in the creation, production, 
                          or delivery of this script/tool be liable for any damages whatsoever (including, without limitation, 
                          damages for loss of business profits, business interruption, loss of business information, or other 
                          pecuniary loss) arising out of the use of or inability to use the sample scripts or documentation, 
                          even if Tom Arbutnot has been advised of the possibility of such damages
    
     
    Acknowledgements 		: http://stackoverflow.com/questions/15932881/invoking-powershell-command-from-windows-explorer-send-to-menu
                        : http://lifehacker.com/5984868/how-to-customize-the-send-to-menu-in-windows-8
    
    Assumptions					: ExecutionPolicy of AllSigned (recommended), RemoteSigned or Unrestricted (not recommended)
    
    Limitations					:    										
    
    Known issues				: 

#>


Foreach ($item in $args)
{
  If ($item -ne '%*')
  {
    $String = $String + ' ' + $item
    # $String = $String.Substring(1)
  }
}


$Files = $String -split ('.ps1')

Foreach ($file in $Files)
{
  
  If ($File -ne '')
  {
    Write-Host $file
    
    $file = $file.Substring(1)
    
    $file = $file + '.ps1'
    
    $item = Get-ChildItem "$file"
    
    $newname = $($item.name).Replace('.ps1','.txt')
    
    $newpath = "$($item.Directory)" + '\' + "$newname"
    
    Copy-Item -Path $item -Destination $newpath -Verbose
  }
}


# For Testing
# powershell.exe -noexit


# SIG # Begin signature block
# MIIQGQYJKoZIhvcNAQcCoIIQCjCCEAYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUPhXvql6dxDbmW/vrvZCs8lcD
# Bsiggg1eMIIGozCCBYugAwIBAgIQD6hJBhXXAKC+IXb9xextvTANBgkqhkiG9w0B
# AQUFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVk
# IElEIFJvb3QgQ0EwHhcNMTEwMjExMTIwMDAwWhcNMjYwMjEwMTIwMDAwWjBvMQsw
# CQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cu
# ZGlnaWNlcnQuY29tMS4wLAYDVQQDEyVEaWdpQ2VydCBBc3N1cmVkIElEIENvZGUg
# U2lnbmluZyBDQS0xMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnHz5
# oI8KyolLU5o87BkifwzL90hE0D8ibppP+s7fxtMkkf+oUpPncvjxRoaUxasX9Hh/
# y3q+kCYcfFMv5YPnu2oFKMygFxFLGCDzt73y3Mu4hkBFH0/5OZjTO+tvaaRcAS6x
# ZummuNwG3q6NYv5EJ4KpA8P+5iYLk0lx5ThtTv6AXGd3tdVvZmSUa7uISWjY0fR+
# IcHmxR7J4Ja4CZX5S56uzDG9alpCp8QFR31gK9mhXb37VpPvG/xy+d8+Mv3dKiwy
# RtpeY7zQuMtMEDX8UF+sQ0R8/oREULSMKj10DPR6i3JL4Fa1E7Zj6T9OSSPnBhbw
# JasB+ChB5sfUZDtdqwIDAQABo4IDQzCCAz8wDgYDVR0PAQH/BAQDAgGGMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMDMIIBwwYDVR0gBIIBujCCAbYwggGyBghghkgBhv1sAzCC
# AaQwOgYIKwYBBQUHAgEWLmh0dHA6Ly93d3cuZGlnaWNlcnQuY29tL3NzbC1jcHMt
# cmVwb3NpdG9yeS5odG0wggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBz
# AGUAIABvAGYAIAB0AGgAaQBzACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAAYwBv
# AG4AcwB0AGkAdAB1AHQAZQBzACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAg
# AHQAaABlACAARABpAGcAaQBDAGUAcgB0ACAAQwBQAC8AQwBQAFMAIABhAG4AZAAg
# AHQAaABlACAAUgBlAGwAeQBpAG4AZwAgAFAAYQByAHQAeQAgAEEAZwByAGUAZQBt
# AGUAbgB0ACAAdwBoAGkAYwBoACAAbABpAG0AaQB0ACAAbABpAGEAYgBpAGwAaQB0
# AHkAIABhAG4AZAAgAGEAcgBlACAAaQBuAGMAbwByAHAAbwByAGEAdABlAGQAIABo
# AGUAcgBlAGkAbgAgAGIAeQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wEgYDVR0TAQH/
# BAgwBgEB/wIBADB5BggrBgEFBQcBAQRtMGswJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
# Y3NwLmRpZ2ljZXJ0LmNvbTBDBggrBgEFBQcwAoY3aHR0cDovL2NhY2VydHMuZGln
# aWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENBLmNydDCBgQYDVR0fBHow
# eDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJl
# ZElEUm9vdENBLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0Rp
# Z2lDZXJ0QXNzdXJlZElEUm9vdENBLmNybDAdBgNVHQ4EFgQUe2jOKarAF75JeuHl
# P9an90WPNTIwHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNtyA8wDQYJKoZI
# hvcNAQEFBQADggEBAHtyHWT/iMg6wbfp56nEh7vblJLXkFkz+iuH3qhbgCU/E4+b
# gxt8Q8TmjN85PsMV7LDaOyEleyTBcl24R5GBE0b6nD9qUTjetCXL8KvfxSgBVHkQ
# RiTROA8moWGQTbq9KOY/8cSqm/baNVNPyfI902zcI+2qoE1nCfM6gD08+zZMkOd2
# pN3yOr9WNS+iTGXo4NTa0cfIkWotI083OxmUGNTVnBA81bEcGf+PyGubnviunJmW
# eNHNnFEVW0ImclqNCkojkkDoht4iwpM61Jtopt8pfwa5PA69n8SGnIJHQnEyhgmZ
# cgl5S51xafVB/385d2TxhI2+ix6yfWijpZCxDP8wggazMIIFm6ADAgECAhAHg+Of
# aoJDPCCKgFvnHm/HMA0GCSqGSIb3DQEBBQUAMG8xCzAJBgNVBAYTAlVTMRUwEwYD
# VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xLjAs
# BgNVBAMTJURpZ2lDZXJ0IEFzc3VyZWQgSUQgQ29kZSBTaWduaW5nIENBLTEwHhcN
# MTMwNzAxMDAwMDAwWhcNMTQwNzA5MTIwMDAwWjB/MQswCQYDVQQGEwJHQjEWMBQG
# A1UECBMNSGVydGZvcmRzaGlyZTESMBAGA1UEBxMJU3RldmVuYWdlMSEwHwYDVQQK
# ExhUaG9tYXMgQ2hhcmxlcyBBcmJ1dGhub3QxITAfBgNVBAMTGFRob21hcyBDaGFy
# bGVzIEFyYnV0aG5vdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALHE
# 1KWj6eAh2E54UiDcHmcmw817ohO4sZ5zMirY5CFJx4G/IIfEg6JHneIXtNrY9QbH
# 2gBvoCJ/j+rMLUiG0G8jw2n0mOAyWEcBDga57SDzI6OHyKM3n+OkC5D6wQSS0lH5
# e90Suegs5bxLfZFTSFWVRKsHhoCtKFVevaEKIbt2S8wE5Fdss2BCsmgf7RcIrj4r
# Zcxg3OZ1UDtDwCPIncryM0j/BC+81j/QPTJ4fu2rfSVEKELHR89JN+MAdrcJbWLH
# Zl9SgsVGDWG15wQUiVYB+A1Mz6ZwT+3St7/iJgWGFvZdcI+A7sEWZZSIyJMre8/s
# CYEeO1bRImqVbbS1RX8CAwEAAaOCAzkwggM1MB8GA1UdIwQYMBaAFHtozimqwBe+
# SXrh5T/Wp/dFjzUyMB0GA1UdDgQWBBQ4SFcQ1DpIYCaa1vJbAgMEUO7/UTAOBgNV
# HQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwcwYDVR0fBGwwajAzoDGg
# L4YtaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL2Fzc3VyZWQtY3MtMjAxMWEuY3Js
# MDOgMaAvhi1odHRwOi8vY3JsNC5kaWdpY2VydC5jb20vYXNzdXJlZC1jcy0yMDEx
# YS5jcmwwggHEBgNVHSAEggG7MIIBtzCCAbMGCWCGSAGG/WwDATCCAaQwOgYIKwYB
# BQUHAgEWLmh0dHA6Ly93d3cuZGlnaWNlcnQuY29tL3NzbC1jcHMtcmVwb3NpdG9y
# eS5odG0wggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBzAGUAIABvAGYA
# IAB0AGgAaQBzACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAAYwBvAG4AcwB0AGkA
# dAB1AHQAZQBzACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAgAHQAaABlACAA
# RABpAGcAaQBDAGUAcgB0ACAAQwBQAC8AQwBQAFMAIABhAG4AZAAgAHQAaABlACAA
# UgBlAGwAeQBpAG4AZwAgAFAAYQByAHQAeQAgAEEAZwByAGUAZQBtAGUAbgB0ACAA
# dwBoAGkAYwBoACAAbABpAG0AaQB0ACAAbABpAGEAYgBpAGwAaQB0AHkAIABhAG4A
# ZAAgAGEAcgBlACAAaQBuAGMAbwByAHAAbwByAGEAdABlAGQAIABoAGUAcgBlAGkA
# bgAgAGIAeQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wgYIGCCsGAQUFBwEBBHYwdDAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEwGCCsGAQUFBzAC
# hkBodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURD
# b2RlU2lnbmluZ0NBLTEuY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEFBQAD
# ggEBAHgP9yvgRLYzST2TX1EyULaVCbCHskIGU492MMofP18wz0V6+k1xJ0oql+Oy
# Ph5gJBOnAeKOio1dyzxy6UHYTCEmFHgvI58KpJzy930szpCWCoaOIUBegy2zoYd+
# EKB0H1pA4FD93bkt3T48HlP/54FBkSeiDL/Q8Hw1ar7acZx0GOAfHOLa2QjUhzJK
# W1Zp9S2nWX2FSvM5HotQeQDp0UVqIgPd7d7FD16GiRZkPdSWoQ/bQcS+kpQzG9n6
# ePMe1HpHx0FFB78MBYd3LDpPs4XnZlw9pQGuAoL7T4lsoUNMH+SA0io+jRgtLUzB
# XUEZC8y0ESYBXxTteMmbzmUkxT8xggIlMIICIQIBATCBgzBvMQswCQYDVQQGEwJV
# UzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQu
# Y29tMS4wLAYDVQQDEyVEaWdpQ2VydCBBc3N1cmVkIElEIENvZGUgU2lnbmluZyBD
# QS0xAhAHg+OfaoJDPCCKgFvnHm/HMAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEM
# MQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQB
# gjcCAQsxDjAMBgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBTGLYmVssE3buho
# w5FUHnyHJvZSdDANBgkqhkiG9w0BAQEFAASCAQBZSjL8/ctY0QPlsQEmBkhTMY5V
# 3ZN1tKcX+EVMXxf2ydHeDqoGxXxHstnP5DBasxLARJ6XxL6dgTKcooSTLn62SByv
# 7F4fTzCX49W27CFqgvrUDlQhM1LaEDn8yq4mTiK35HN8ZrtpTmvJxYklLYuPixWz
# /T455WTQHtHSN0OqwWh2JExQ2mD1RuktYGLCid1IFdc1C1+hp73k/SeDMnoQ6wbw
# J/xGxjvznpVn6jrbT/683+9rBT1xWZ7Shtr3Q9EWw/Ag0zbvZegCCB4W/Mc2zCU7
# bY1AKR3elSVnpPDIAebQKunQ5e3F54vQsaToFboHxfXTXTT7BiTDHLtq63Eq
# SIG # End signature block
