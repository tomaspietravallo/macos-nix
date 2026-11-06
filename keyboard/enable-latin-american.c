#include <Carbon/Carbon.h>
#include <CoreFoundation/CoreFoundation.h>

int main(void) {
  const void *keys[] = {kTISPropertyInputSourceID};
  const void *values[] = {CFSTR("com.apple.keylayout.LatinAmerican")};
  CFDictionaryRef filter = CFDictionaryCreate(kCFAllocatorDefault, keys, values, 1,
                                             &kCFTypeDictionaryKeyCallBacks,
                                             &kCFTypeDictionaryValueCallBacks);
  if (filter == NULL) return 1;
  CFArrayRef sources = TISCreateInputSourceList(filter, true);
  CFRelease(filter);
  if (sources == NULL) return 1;
  if (CFArrayGetCount(sources) != 1) {
    CFRelease(sources);
    return 1;
  }
  TISInputSourceRef source = (TISInputSourceRef)CFArrayGetValueAtIndex(sources, 0);
  CFBooleanRef enabled = (CFBooleanRef)TISGetInputSourceProperty(source, kTISPropertyInputSourceIsEnabled);
  OSStatus status = enabled != NULL && CFBooleanGetValue(enabled) ? noErr : TISEnableInputSource(source);
  CFRelease(sources);
  return status == noErr ? 0 : 1;
}
