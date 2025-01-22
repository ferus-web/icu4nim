import pkg/ferrite/utf16view

{.push header: "<unicode/unistr.h>".}

type
  UnicodeString* {.importcpp: "icu::UnicodeString".} = object

func `==`*(a, b: UnicodeString): bool {.importcpp: "icu::UnicodeString::==".}
func `!=`*(a, b: UnicodeString): bool {.importcpp: "icu::UnicodeString::!=".}
func getBuffer*(str: UnicodeString): ptr uint16 {.importcpp: "icu::UnicodeString::getBuffer".}
func len*(str: UnicodeString): int32 {.importcpp: "icu::UnicodeString::length".}

func newUnicodeString*(buffer: ptr uint16, length: int32): UnicodeString {.importcpp: "icu::UnicodeString::UnicodeString(@)".}
{.pop.}

# Wrapper code
proc newUnicodeString*(str: string): UnicodeString =
  var view = newUtf16View(str)
  var buffer = cast[ptr UncheckedArray[uint16]](alloc(sizeof(uint16).uint64 * view.codeunitLen))

  for i in 0 ..< view.codeunitLen:
    let cp = view.codeUnitAt(i)

    buffer[i] = cp
  
  newUnicodeString(buffer[0].addr, str.len.int32())

func toUtf16View*(str: UnicodeString): UTF16View =
  var buffer = cast[ptr UncheckedArray[uint16]](str.getBuffer())
  var data: seq[uint16]
  data.setLenUninit(str.len)

  for i in 0 ..< str.len:
    when defined(danger):
      copyMem(data[i].addr, buffer[i].addr, sizeof(uint16))
    else:
      data[i] = buffer[i]

  newUtf16View(move(data), UTFEndianness.Host)

proc `$`*(str: UnicodeString): string =
  str
    .toUtf16View()
    .toUtf8()
