import std/strutils

{.passC: "-static " & gorge("pkg-config --cflags icu-uc icu-i18n").strip().}
{.passL: "-static " & gorge("pkg-config --libs icu-uc icu-i18n").strip().}

import icu4nim/[ustring, timezone, error_code]

export ustring, timezone, error_code
