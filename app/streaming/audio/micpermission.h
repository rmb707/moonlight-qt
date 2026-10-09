#pragma once

// Platform microphone permission helpers for mic passthrough.
//
// On macOS, microphone access is gated by TCC. The first capture attempt
// shows a system prompt; if that happens while a fullscreen stream is up
// the prompt can be hidden behind the stream window. Requesting access when
// the user enables the setting avoids that. Other platforms need nothing.

#ifdef __APPLE__
// Asynchronously asks the OS for microphone access if the user hasn't
// decided yet. No-op if access was already granted or denied.
void requestMicrophonePermission();

// Returns true if the user (or policy) has denied microphone access.
bool isMicrophonePermissionDenied();
#else
inline void requestMicrophonePermission() {}
inline bool isMicrophonePermissionDenied() { return false; }
#endif
