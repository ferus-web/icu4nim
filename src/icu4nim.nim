import std/strutils

{.passC: gorge("pkg-config --cflags icu-uc icu-i18n").strip().}
{.passL: gorge("pkg-config --libs icu-uc icu-i18n").strip().}

import icu4nim/[ustring, timezone, error_code]

export ustring, timezone, error_code
