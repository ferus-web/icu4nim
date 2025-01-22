{.push header: "<unicode/utypes.h>".}

type
  ICUErrorCode* {.importcpp: "UErrorCode".} = enum
    NULL = -256 ## Stub. Do not use this. It means nothing.

{.pop.}

template defICUError(ident: untyped, code: int) =
  const `ident`* {.header: "<unicode/utypes.h>".} = cast[ICUErrorCode](code)

defICUError UsingFallbackWarning, -128
defICUError UsingDefaultWarning, -127
defICUError SafeCloneAllocatedWarning, -126
defICUError StateOldWarning, -125
defICUError StringNotTerminatedWarning, -124
defICUError SortKeyTooShortWarning, -123
defICUError AmbiguousAliasWarning, -122
defICUError DifferentUCAVersion, -121
defICUError PluginChangedLevelWarning, -120
defICUError ZeroError, 0
defICUError IllegalArgumentError, 1
defICUError MissingResourceError, 2
defICUError InvalidFormatError, 3
defICUError FileAccessError, 4
defICUError InternalProgramError, 5
defICUError MessageParseError, 6
defICUError IndexOutOfBoundsError, 7
defICUError ParseError, 8
defICUError InvalidCharFound, 9
defICUError TruncatedCharFound, 10
defICUError IllegalCharFound, 11
defICUError InvalidTableFormat, 12
defICUError InvalidTableFile, 13
defICUError BufferOverflowError, 14
defICUError UnsupportedError, 16
defICUError ResourceTypeMismatch, 17
defICUError IllegalEscapeSequence, 18
defICUError UnsupportedEscapeSequence, 19
defICUError NoSpaceAvailable, 20
defICUError CENotFoundError, 21
defICUError PrimaryTooLongError, 22
defICUError StateTooOldError, 23
defICUError TooManyAliasesError, 24
defICUError EnumOutOfSyncError, 25
defICUError InvariantConversionError, 26
defICUError InvalidStateError, 27
defICUError CollatorVersionMismatch, 28
defICUError UselessCollatorError, 29
defICUError NoWritePermission, 30
defICUError InputTooLongError, 31
