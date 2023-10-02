# RoonAppMediaKeys.spoon
Hammerspoon Spoon for sending play/prev/next/mute/volup/voldown keys to Roon when it's running, and provide a hotkey to start it when it's not

This is based on the Spoon to [send media key presses to Apple's Music.app](https://github.com/Hammerspoon/Spoons/tree/master/Source/MusicAppMediaFix.spoon), but modified to send them to [Roon](https://roon.app) instead.

**Note:** This uses the [Roon keyboard shortcuts](https://help.roonlabs.com/portal/en/kb/articles/keyboard-shortcuts) to control Roon, which means it uses the spacebar for play/pause operations.  This means that if you have a text entry field in Roon selected, you'll see it enter spaces in there if you hit play instead of actually playing or pausing.  To avoid this, just avoid having a text entry field in Roon selected.

To use it, clone the repository into your Spoons directory:

```
git clone https://github.com/Kreeblah/RoonAppMediaKeys.spoon.git ~/.hammerspoon/Spoons/RoonAppMediaKeys.spoon
```

And then add the following to your `init.lua`:

```
-- Send play/prev/next to Roon
hs.loadSpoon("RoonAppMediaKeys")
spoon.RoonAppMediaKeys:start()
```

If you want to add the mute and volume keys to your Roon controls by default when Roon is running, you can pass `true` to the `start()` method:

```
-- Send play/prev/next/mute/volup/voldown to Roon
hs.loadSpoon("RoonAppMediaKeys")
spoon.RoonAppMediaKeys:start(true)
```

Additionally, pressing Shift + Ctrl + Opt + R at any time while Roon is running will toggle between having Roon capture mute and the volume keys and letting macOS handle them.  If Roon is not running, that key combo will launch Roon instead.

For all other situations than the Roon hotkey combo, when Roon is not running, the keys do whatever they'd normally do without this Spoon installed.