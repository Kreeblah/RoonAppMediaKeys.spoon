# RoonAppMediaKeys.spoon
Hammerspoon Spoon for sending play/pause/previous/next keys to Roon

This is based on the Spoon to [send media key presses to Apple's Music.app](https://github.com/Hammerspoon/Spoons/tree/master/Source/MusicAppMediaFix.spoon), but modified to send them to [Roon](https://roon.app) instead.

To use it, clone the repository into your Spoons directory:

```
git clone https://github.com/Kreeblah/RoonAppMediaKeys.spoon.git ~/.hammerspoon/Spoons/RoonAppMediaKeys.spoon
```

And then add the following to your `init.lua`:

```
-- Send play/pause/next/back to Roon
hs.loadSpoon("RoonAppMediaKeys")
spoon.RoonAppMediaKeys:start()
```
