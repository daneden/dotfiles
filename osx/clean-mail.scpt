#!/usr/bin/env osascript

(*
Speed up Mail.app by vacuuming the Envelope Index
Code from: http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/
Originally by "pmbuko" with modifications by Romulo
Updated by Brett Terpstra 2012
Updated by Mathias Törnblom 2015 to support V3 in El Capitan and still keep backwards compability
*)

tell application "Mail" to quit
set os_version to do shell script "sw_vers -productVersion"
set mail_version to "V2"
considering numeric strings
    if "10.10" <= os_version then set mail_version to "V3"
end considering

set sizeBefore to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"
do shell script "/usr/bin/sqlite3 ~/Library/Mail/" & mail_version & "/MailData/Envelope\\ Index vacuum"

set sizeAfter to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"

display dialog ("Mail index before: " & sizeBefore & return & "Mail index after: " & sizeAfter & return & return & "Enjoy the new speed!")

tell application "Mail" to activate
