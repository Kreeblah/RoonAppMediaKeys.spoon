# RoonAppMediaKeys.spoon
Hammerspoon Spoon for sending play/prev/next/mute/volup/voldown keys to Roon

This is based on the Spoon to [send media key presses to Apple's Music.app](https://github.com/Hammerspoon/Spoons/tree/master/Source/MusicAppMediaFix.spoon), but modified to send them to [Roon](https://roon.app) instead.

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

If you want to add the mute and volume keys to your Roon controls, you can pass `true` to the `start()` method:

```
-- Send play/prev/next/mute/volup/voldown to Roon
hs.loadSpoon("RoonAppMediaKeys")
spoon.RoonAppMediaKeys:start(true)
```

Additionally, pressing Shift + Ctrl + Opt + R at any time  will toggle between having Roon capture mute and the volume keys and letting macOS handle them.