import icu4nim/[error_code, ustring]

{.push header: "<unicode/timezone.h>".}

type
  TimeZone* {.importcpp: "icu::TimeZone".} = object

proc detectHostTimeZone*: ptr TimeZone {.importcpp: "icu::TimeZone::detectHostTimeZone".}
proc getID*(timezone: ptr TimeZone, id: var UnicodeString): ptr UnicodeString {.importcpp: "icu::TimeZone::getID", discardable.}
proc getCanonicalID*(
  timezone: ptr TimeZone, 
  id, canonicalId: var UnicodeString, 
  status: var ICUErrorCode
): ptr UnicodeString {.importcpp: "icu::TimeZone::getCanonicalID", discardable.}

{.pop.}
