# Sideload Tweaked Instagram

Requires theos (https://github.com/theos/theos) and theos-jailed (https://github.com/kabiroberai/theos-jailed).

Please do not ask me to distribute a pre patched IPA, doing so would be a copyright violation that I do not want to commit.

## How to use

1. Open `Makefile` and edit the path to the decrypted Instagram ipa

2. Optional: Change BUNDLE_ID in Makefile to something else

## Rocket for Instagram
1. Prepare a decrypted IPA of Instagram

2. Open `Makefile` and edit the path to the decrypted Instagram ipa

3. Get a deb of Rocket via cydownload (https://github.com/borishonman/cydownload/releases) or a similar tool and extract it (or alternatively get the files below from a jailbroken device that has Rocket installed)

4. Put /Library/Application Support/Rocket/Rocket.bundle into the Resources folder of this repo (to Resources/Rocket.bundle/(DateTools.bundle/MoPub.bundle/...))

5. Get the rocket dylib from /usr/lib/Rocket.dylib inside the deb and open the arm64 slice in Hopper
> Note: the trial version of Hopper doesn't support export patched file, you can use Ghidra, which is free, instead of Hopper

6. Replace the first two instructions of +[RABuildManager installType] with `mov x0, #0x1; ret;` to make Rocket think it was built for sideloaded installs

7. Export patched binary, keep invalid code signature when prompted

8. Put the patched Rocket.dylib into the `Tweaks` folder of this repo

9. Run `make package FINALPACKAGE=1` to compile the IPA that works when sideloaded. If you want to compile an ipa for TrollStore, run `make package FINALPACKAGE=1 TROLLSTORE=1 FAKESIGN_IPA=1` (until my theos-jailed PR has been accepted, make sure to use my fork of theos-jailed).

10. Optional: if you want to add more tweaks, put the dylibs in the `Tweaks` folder and its resources (bundle) in the `Resources` folder. Finally, add the dylib's name to the `Makefile`