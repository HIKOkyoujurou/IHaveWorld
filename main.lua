frame =0
debug = false

--keys
key_l = 0
key_r = 1
key_u = 2
key_d = 3
key_z = 4
key_x = 5

--cols
gb_spr= {1,13,6,7}
gb = {1,13,6,7}

--debug
test = false

function _init()
    init_camera()
    init_grid()
   
    now_input = {}
    mouse.init()
    frame = 0
    sys ={}
    init_game()
end

function _update()
    update_camera()
    frame=((frame+1)%30)
    mouse_x,mouse_y = mouse.pos()
    mouse_before = mouse_btn
    
    mouse_btn = mouse.button()
    
    sys.func_update()
end

function _draw()
    sys.func_draw() 
    print(mouse_x.." "..mouse_y,mouse_x,mouse_y,10)
    pset(mouse_x,mouse_y,14)

    if(mouse_btn==2)then
        draw_grid()
    end
    --cpu
    cursor(cam_x+1,cam_y+1,stat(1)<1 and 9 or 8)
    print(stat(1))
    print("obs:"..#objects)
    print("camera:"..cam_x..","..cam_y)
end

function init_game()
    sys.func_update = update_game
    sys.func_draw = draw_game
    load_map_whole()
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
    cls(gb[3])
    local gx_s,gx_e,gy_s,gy_e = now_showing_grid()

    for part in all(particles) do
        part:draw_back()
    end

  
    for x = gx_s,gx_e do
        for y= gy_s,gy_e do
            local g = get_grid(x,y)
            if g then g:draw_back() end
        end
    end
    
    -- for obj in all(objects) do
    --     obj:draw_back()
    -- end
    map(0,0,0,0,128,128,4)

    map(0,0,0,0,128,128,1)
    for part in all(particles) do
        part:draw()
    end
    
    for x = gx_s,gx_e do
        for y= gy_s,gy_e do
            local g = get_grid(x,y)
            if g then g:draw() end
        end
    end
    -- for obj in all(objects) do
    --     obj:draw()
    -- end
    map(0,0,0,0,128,128,2)

    for part in all(particles) do
        part:draw_front()
    end

    
    for x = gx_s,gx_e do
        for y= gy_s,gy_e do
            local g = get_grid(x,y)
            if g then g:draw_front() end
        end
    end
    -- for obj in all(objects) do
    --     obj:draw_front()
    -- end

    print(test,32,1,9)
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

