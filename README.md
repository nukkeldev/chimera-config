# Chimera Linux Config

Having recently discovered and switching to [Chimera Linux](https://chimera-linux.org/) on my laptop, this repository contains
my configuration files for apk's world, dotfiles, etc.

## Impressions

Having come from NixOS, Chimera is a nice middle-ground of being modern (musl, clang, etc.) and deterministic (apk world constriants).

- `apk` being able to search for, and install, packages based on a `cmd:` or `so:` prefix is amazing.
- The plug-and-play functionality on a musl-based distro is very welcome.
- Use `chsh` to change the login shell for a user.
- The documentation, while quite brief, is very well written.

## Laptop Quirks

The laptop I have running Chimera has an `Intel Corporation Wi-Fi 7(802.11be) AX1775*/AX1790*/BE20*/BE401/BE1750* 2x2 (rev 1a)`
using the `iwlwifi` driver. Annoyingly whenever my system attempts to sleep, `iwlwifi` crashes with the following (summarized) error:

```
Hardware became unavailable upon resume. This could be a software issue prior to suspend or a hardware issue.
...
Hardware name: Micro-Star International Co., Ltd. Prestige 16 AI Evo B1MG/MS-15A1, BIOS E15A1IMS.107 11/29/2023
...
Call Trace:
  <TASK>
  ? kick_pool+0xbd/0x140
  ? __queue_work+0x3cc/0x4e0
  ? queue_work_node+0xe9/0x130
  ? __async_schedule_node_domain+0x10c/0x130
  ? wait_for_common+0x1a0/0x1f0
  wiphy_resume+0x85/0x190 [cfg80211]
  ? __pfx_wiphy_resume+0x10/0x10 [cfg80211]
  dpm_run_callback+0x2a/0x250
  device_resume+0x224/0x340
  async_resume+0x1d/0x40
  async_run_entry_fn+0x2f/0x150
  process_scheduled_works+0x213/0x460
  worker_thread+0x20a/0x2f0
  kthread+0x277/0x2a0
  ? __pfx_worker_thread+0x10/0x10
  ? finish_task_switch+0xb7/0x330
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0xa3/0xe0
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1a/0x30
  </TASK>
```

To further my pain, I have not been able to get the adapter back up without restarting the system.
This only occurs when suspending or hybrid-sleeping, not hibernating, so previously I had just disabled
those modes and set everything to hibernate. Unfortunately when setting that up on this laptop, I forgot
to update my initramfs with my swap so hibernating was exhibiting really weird behavior. I soon fixed the
hibernation but not before writing the following script for `/etc/elogind/system-sleep` that works
perfectly:

```sh
#!/bin/bash

case $1 in
  pre)
    dinitctl stop networkmanager
    modprobe -r iwlmld
    modprobe -r iwlwifi
    ;;
  post)
    modprobe iwlwifi
    modprobe iwlmld
    dinitctl start networkmanager
    ;;
esac
```
