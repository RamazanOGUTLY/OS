-- install.lua
term.setBackgroundColor(colors.blue)
term.setTextColor(colors.white)

local curdir = shell.dir()
local osfiles = fs.combine(curdir, "os/")

term.clear()
term.setCursorPos(1, 1)

term.write("do you want to install OS ( y / n ): ")
local read = read()

if read == "y" or read == "Y" then

    term.clear()
    term.setCursorPos(1, 1)
    
    fs.copy(fs.combine(osfiles, "startup.lua"), "startup.lua")
    print("installing startup")
    sleep(2)
    print("installed startup")
    sleep(1)
    fs.copy(fs.combine(osfiles, "uninstall.lua"), "uninstall.lua")
    print("installing uninstall")
    sleep(2)
    print("installed uninstall")
    sleep(1)
    fs.copy(fs.combine(osfiles, "os.lua"), "os.lua")
    print("installing os")
    sleep(2)
    print("installed os")
    sleep(1)
    print("installing backgrounds")
    fs.copy(fs.combine(osfiles, "backgrounds/"), "os/backgrounds/")
    sleep(2)
    print("installed backgrounds")
    sleep(1)
    fs.delete("github.lua")
    fs.copy(fs.combine(osfiles, "github.lua"), "os/github.lua")
    sleep(2)
    print("installing programs")
    fs.copy(fs.combine(osfiles, "programs/"), "os/programs")
    sleep(1)
    print("installed programs")
    sleep(1)
    print("restarting")
    sleep(2)
    os.reboot()

elseif read == "n" or read == "N" then 

    term.setTextColor(colors.red)
    print("Canceled") 
    term.setTextColor(colors.white)

end