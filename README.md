# zomboid-restart-linux
Script for automatically restarting a project zomboid dedicated server that was installed using the pzwiki guide.

### Important Notes:
This script was created to run on Ubuntu Server 24.01.LTS, it should work on other distros but I cannot guarantee it.

This script should also run the restart command for each tmux session you have open simulatenously but I have not tested with more than one at the time of creation.

This script will not start the server immediately after a system reboot, I recommend using the systemd method from https://pzwiki.net/wiki/Dedicated_server if you prefer that.

### Prequisites:
You must have followed the PZwiki Dedicated Server guide here: https://pzwiki.net/wiki/Dedicated_server and have started your server(s) in a tmux session.

### Install Instructions:
Download `restart-server.sh` from this repository.

Place `restart-server.sh` in the `/opt/pzserver` directory of your linux dedicated server.

Run this command to open the cron task scheduler while logged in as `pzuser`:

```crontab -e```

Insert the following line at the bottom of the file:

```0 */2 * * * bash /opt/pzserver/restart-server.sh```

This is configured to restart every 2 hours by default, if you would prefer it run more or less frequently here is a [guide](https://opensource.com/article/21/7/cron-linux) explaining how to configure that with cron.

And now you should be set for automatic restarts!
The script is configured to give a warning every minute from 2-15 minutes before restart, every 10 seconds from 20-60 seconds before restart, and every second from 1-10 seconds before restart.
