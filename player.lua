-->8 player
player = nil
grid = 8

key_sword = key_x
move_time = 3

function make_player(x,y)
    local p = make_object("player",x,y,1)
    player =p
    p.aim = key_l
    p.have_block = nil
    p.spr_y = -3
    p.idle_sprs ={{1,2},{17,18},{33,34},{49,50}}
    p.input_key = -1
    p.input_time = 0
    p.update = function(p)

        --move
        local dx,dy = 0,0
        local idle = true

        local a = p.aim
        
        if btn(a) then
            p.input_time -=1

            if p.input_time <= 0 then
                dx,dy = move(a)
                p.input_time =move_time

            end

        else

        end

        for i = key_l,key_d do
            if btnp(i) then
                if i != p.aim then
                    p.input_time = move_time
                end
                p.aim = i
            end
        end

        if dx ~= 0 or dy~=0 then
            if p:grid_move(dx,dy) then
                p:act_move(p.grid_x +dx,p.grid_y +dy)
                idle =false
            end
        end
        p.x = p.grid_x*8
        p.y = p.grid_y*8

        if btnp(key_sword) then
            
        end

        local s_no = frame_to_no(#p.idle_sprs[p.aim+1])
        p.spr = p.idle_sprs[p.aim+1][s_no]


    end
    p.draw= function(p)
        object.draw(p)

        
    end
    p.draw_front = function(p)
        if p.have_block then
            
            object.draw(p.have_block)
        end
    end
end

function move(a)
    local dx,dy = 0,0
    if a == key_l then
        dx=-1
    elseif a == key_r then
        dx=1
    elseif a == key_u then
        dy=-1
    elseif a == key_d then
        dy=1
    end
    return dx,dy
end