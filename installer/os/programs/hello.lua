-- hello.lua
local x, y = 10, 5

local termb = term.current()
term.clear()

while true do

    local window = window.create(term.current(), x, y, 20, 10)
    
    term.redirect(window)

    term.setBackgroundColor(colors.magenta)
    term.setTextColor(colors.blue)
    term.setCursorPos(1, 1)

    print("hello")
    
    window.reposition(x, y)
    window.redraw()
    
    local event, button, xx, yy = os.pullEvent("mouse_drag")
    
    if xx >= x - 4 and xx <= x + 4 and yy >= y - 3 and yy <= y + 3 then
    
        x = xx
        y = yy
        
    end

    term.redirect(termb)
    term.setCursorPos(0, 0)
    sleep(.1)
    term.clear()
    
end
