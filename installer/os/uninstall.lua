-- uninstall.lua
local curdir = shell.dir()

term.setBackgroundColor(colors.blue)
term.setTextColor(colors.white)

term.clear()
term.setCursorPos(1, 1)

print("unistalling")

fs.delete(fs.combine(curdir, "startup.lua"))
fs.delete(fs.combine(curdir, "os.lua"))
fs.delete(fs.combine(curdir, "os/"))
fs.delete(fs.combine(curdir, "uninstall.lua"))

sleep(2)

print("uninstalled")
print("rebooting")
sleep(1)
os.reboot()