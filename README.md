# PitchPerfect
PitchPerfect is an application that allows the user to record their voices and apply six different sound effects in the playback

##View Controller Scenes
###RecordSoundsViewController
RecordSoundsViewController has a record button, a pause button, and a stop button. Using [AVFoundation framework](https://developer.apple.com/av-foundation/), I created audio media files. Once the stop button is pressed, this view navigates to the PlaySoundsViewController.

###PlaySoundsViewController
PlaySoundsViewController contains six buttons, each one representing a sound effect. When a button is pressed, the recorded audio would be played back with effects applied. Effects are achieved by manipulating the rate, pitch, echo, or reverb of the audio.

##Credits
Leqi Long

##Contacts
longleqi89@gmail.com