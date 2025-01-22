import icu4nim

var str = newUnicodeString("Hello world!")
echo $str

var status = ZeroError

var tz = detectHostTimeZone()
var tzid: UnicodeString
tz.getID(tzid)

var tzname: UnicodeString
tz.getCanonicalID(tzid, tzname, status)

echo $tzid
echo $tzname
