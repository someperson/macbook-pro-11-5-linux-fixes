

# macbook-pro-11-5-linux-fixes

This is a collection of fixes for Linux on the 2015 MacBookPro11,5. These have only been tested on Arch Linux with this specific model and may or may not be applicable to other models.

## 0001-drm-amdgpu-reset-SI-ASIC-on-MacBookPros-with-VRAM-at.patch

This is a Linux kernel patch that prevents the amdgpu driver from crashing when trying to resume from being suspended. Without this patch, the driver crash results in no display on resume.

This patch was provided by Maciej Kucharek [after I reported the issue to the amdgpu team](https://gitlab.freedesktop.org/drm/amd/-/work_items/5978) and is slated for inclusion in Linux 7.4. It should no longer be necessary after that release.

## brcmfmac-fix.sh

This is a script for systemd that will stop the brcmfmac Wi-Fi driver on suspend and restart it on resume. Without this in place, the driver gets into a bad state on resume and cannot see any networks or connect to anything.

To enable this, drop it into /usr/lib/systemd/system-sleep/

## facetimehd-fix.sh

This is a script that will stop the facetimehd webcam driver on suspend and restart it on resume. Without this in place, the driver crashes the system, making it impossible to resume.

To enable this, drop it into /usr/lib/systemd/system-sleep/

## macbook-audio.conf

This sets the model of the Intel PCH audio device to "mbp11", which is necessary if you use the built-in speakers to ensure that the woofers are always enabled. The driver is supposed to detect this by default, but only seems to do so sometimes, so without this, you may sometimes only get working tweeters and thus have terrible sound. "mbp11" is defined 3 times because the detected order of the 3 built-in audio devices in this machine (Intel PCH, Intel HDMI, and AMD HDMI) seems to be nondeterministic.

To enable this, drop it into /etc/modprobe.d/


## MacBook Pro Speakers.json

This is an optional preset for the tool Easy Effects that, in my opinion, makes the built-in speakers sound significantly better. It was created via trial and error so is probably not ideal, but feel free to give it a shot if you want. Consider this an optional bonus rather than anything actually necessary for this machine.