-->8 player
player = nil
grid = 8
function make_player()
    local p = make_object("player",64,64,1)
    player =p
    p.aim = key_l
    p.idle_sprs ={{1,2},{17,18},{33,34},{49,50}}
    p.update = function(p)
        local dx,dy = 0,0

        local idle = true
        if btnp(key_l) then
            dx=-1
            p.aim = key_l
        elseif btnp(key_r) then
            dx=1
            p.aim = key_r

        elseif btnp(key_u) then
            dy=-1
            p.aim = key_u

        elseif btnp(key_d) then
            dy=1
            p.aim = key_d

        end
        dx*=8
        dy*=8
        
        if p:grid_move(dx,dy) then
            p.x +=dx
            p.y +=dy
            idle =false
        end

        p.spr = frame_to_table(p.idle_sprs[p.aim+1])

    end
    p.draw_front = function(p)
        print("x:"..p.x,p.x+8,p.y,9)
        print("y:"..p.y,p.x+8,p.y+8,9)
    end
end