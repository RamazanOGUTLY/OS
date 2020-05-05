-- os.lua
-- testing...
print("Working")

-- vars
local bootimage = nil
local fimg
local startmenu = false

local w, h = term.getSize()
local x, y = term.getCursorPos()

local bimagewidth, bimageheight = 0, 0

local curdir = shell.dir()
local bootlogo = fs.combine(curdir, "os/backgrounds/bootlogo.nfp")
local fimgpath = fs.combine(curdir, "os/backgrounds/foldericon.nfp")

-- clear function
function clear()

    -- setBackgroundColor to black
    -- and setTextColor to white
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    
    -- clear the screen
    -- setCursorPos to the top
    -- right corner
    term.clear()
    term.setCursorPos(1, 1)

end

-- load boot function
function loadBootImage()

    bootimage = paintutils.loadImage(bootlogo)
	fimg = paintutils.loadImage(fimgpath)
    bimagewidth, bimageheight = 17, 6
    
    sleep(.1)
    clear()
    
    x, y = term.getCursorPos()
    
    paintutils.drawImage(bootimage, math.ceil((w - bimagewidth) / 2), math.ceil((h - bimageheight) / 2))
    term.setCursorPos(0, 0)

end

-- draw Taskbar function
function drawTaskbar()

    paintutils.drawFilledBox(1, h, w, h, colors.green)
    
    term.setCursorPos(1, h)
    term.write("start")
    
    term.setCursorPos(0, 0)

end

-- draw icons function
function drawDesktopIcons()

	paintutils.drawImage(fimg, 2, 2)

end

-- event function
function event()

    local event = os.pullEvent()
    
    if event == "mouse_click" then
    
        local event, button, x, y = os.pullEvent("mouse_click")
        
        if button == 1 and x >= 1 and x <= 5 and y == h then
        
            if startmenu == false then
            
                startmenu = true
                
            else
            
                startmenu = false
            
            end
        
        elseif button == 1 and x >= 1 and x <= 8 and y == h-1 then
        
            if startmenu == true then
            
                os.shutdown()
            
            end
        
        elseif button == 1 and x >= 1 and x <= 6 and y == h-2 then
        
            if startmenu == true then
            
                os.reboot()
            
            end
        
        elseif button == 1 and x >= 1 and x <= 4 and y == h-3 then
        
            if startmenu == true then
            
                term.setCursorPos(1, 1)
                term.write("Help not here yet")
                term.setCursorPos(0, 0)
                sleep(3)
            
            end
        
        end
        
    elseif event == "key" then
    
        local event, key, isHeld = os.pullEvent("key")
        
    end

end

-- startMenu function
function startMenu()

    if startmenu == true then
    
        term.setCursorPos(1, h-1)
        term.write("Shutdown")
        term.setCursorPos(1, h-2)
        term.write("Reboot")
        term.setCursorPos(1, h-3)
        term.write("Help")
        term.setCursorPos(0, 0)
    
    end

end

-- run function
function run()

    sleep(5)
    clear()
    
    term.setCursorPos(0, 0)
    
    while true do
    
        drawTaskbar()
        startMenu()
        drawDesktopIcons()
        event()
    
        sleep(0)
        clear()
    
    end

end

-- init function
function init()

    -- call clear function
    -- call loadBootImage function
    clear()
    loadBootImage()
    
    run()

end

-- call init function
init()
