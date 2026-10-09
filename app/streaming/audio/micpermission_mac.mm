#include "micpermission.h"

#import <AVFoundation/AVFoundation.h>

#include "SDL_compat.h"

void requestMicrophonePermission()
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio
                                 completionHandler:^(BOOL granted) {
            SDL_LogInfo(SDL_LOG_CATEGORY_APPLICATION,
                        "Microphone access %s", granted ? "granted" : "denied");
        }];
    }
}

bool isMicrophonePermissionDenied()
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    return status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted;
}
