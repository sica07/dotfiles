import time
import subprocess
import sys


def stopwatch(mins):
    currentTime = 0
    while currentTime/60 <  int(mins):
        print(currentTime/60)
        time.sleep(10)
        currentTime += 10



if __name__ == "__main__":
    mins = int(sys.argv[1])
    if mins > 0:
        stopwatch(mins)
        subprocess.call("notify-send -u normal -a Pomodoro -t 300000 'Time for a break!'", shell=True)
        stopwatch(5)
        subprocess.call("notify-send -u normal -a Pomodoro 'Time for working! Do not forget to start the timer'", shell=True)
