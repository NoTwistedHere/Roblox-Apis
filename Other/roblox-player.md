# Usage
```html
roblox-player:1+launchmode:<launchmode>+gameinfo:<gameinfo>+launchtime:<UnixTime>+placelauncherurl:<placelauncherurl>+browsertrackerid:<browsertrackerid>+robloxLocale:<robloxLocale>+gameLocale:<robloxLocale>+channel:
```
# Example
```html
roblox-player:1+launchmode:play+gameinfo:0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000+launchtime:1+placelauncherurl:https://assetgame.roblox.com/game/PlaceLauncher.ashx?request=RequestGame&browserTrackerId=1&placeId=1&isPlayTogetherGame=false+browsertrackerid:1+robloxLocale:en_us+gameLocale:en_us+channel:
```
# RobloxPlayerBeta.exe Usage
```html
--play -a https://www.roblox.com/Login/Negotiate.ashx -t <gameinfo> -j <placelauncherurl> -b <browsertrackerid> --launchtime=<UnixTime> --rloc <robloxLocale> --gloc <gameLocale>
```
# RobloxPlayerBeta.exe Example
```html
--play -a https://www.roblox.com/Login/Negotiate.ashx -t 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -j https://assetgame.roblox.com/game/PlaceLauncher.ashx?request=RequestGame&browserTrackerId=1&placeId=1&isPlayTogetherGame=false -b 1 --launchtime=1 --rloc en_us --gloc en_us
```