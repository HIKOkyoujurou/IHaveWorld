-->8 main
frame =0
debug = false


nil_function = function()end
--debug
test = false

function _init()

    now_input = {}
    mouse.init()
    frame = 0
    sys ={}
    init_game()
end

function _update()
    frame=((frame+1)%30)
    mouse_x,mouse_y = mouse.pos()
    mouse_btn = mouse.button()
    check_update()

    local p = make_particle(mouse_x,mouse_y,rnd({7,8,9}))
    p.gravity = 1
    p.change_size =0.9

    sys.func_update()
end

function _draw()
    sys.func_draw()
    print(mouse_x.." "..mouse_y,mouse_x,mouse_y,10)
    pset(mouse_x,mouse_y,14)

end

function init_game()
    sys.func_update = update_game
    sys.func_draw = draw_game

end

function update_game()
    for obj in all(objects) do
        obj:update()
    end

    for part in all(particles) do
        part:update()
    end
end

function draw_game()
    cls(1)
    for part in all(particles) do
        part:draw_back()
    end
    
    for obj in all(objects) do
        obj:draw_back()
    end
    for part in all(particles) do
        part:draw()
    end
    for obj in all(objects) do
        obj:draw()
    end
    for part in all(particles) do
        part:draw_front()
    end
    for obj in all(objects) do
        obj:draw_front()
    end
end

mouse = {
    init = function()
      poke(0x5f2d, 1)
    end,
    -- return int:x, int:y, onscreen:bool
    pos = function()
      local x,y = stat(32)-1,stat(33)-1
      return stat(32)-1,stat(33)-1
    end,
    -- return int:button [0..4]
    -- 0 .. no button
    -- 1 .. left
    -- 2 .. right
    -- 4 .. middle
    button = function()
      return stat(34)
    end,
  }

--music tool
function se(tbl)
    local num = tbl
    if type(tbl) == "table" then
        num = rnd(tbl)--tbl[rnd_int(1,#tbl)]
    end
    sfx(num,3)
end

function music_play(num)
    num = music_on_off and num or -1
    if now_music ~= num then
        music(num)
        now_music = num
    end
end
