-->8 player
player = nil
grid = 8

key_get = key_x

function make_player(x,y)
    local p = make_object("player",x,y,1)
    player =p
    p.aim = key_l
    p.have_block = nil
    p.spr_y = -3
    p.idle_sprs ={{1,2},{17,18},{33,34},{49,50}}
    p.update = function(p)

        --move
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
        
        if dx ~= 0 or dy~=0 then
            if p:grid_move(dx,dy) then
                p:act_move(p.grid_x +dx,p.grid_y +dy)
                idle =false
            end
        end
        p.x = p.grid_x*8
        p.y = p.grid_y*8

        --get_block
        if btnp(key_get) then
            local gx,gy = p.grid_x,p.grid_y

            if p.aim == key_l then
                gx-=1
            elseif p.aim == key_r then
                gx+=1
            elseif p.aim == key_u then
                gy-=1
            elseif p.aim == key_d then
                gy+=1
            end

                
            local name,b = check_grid_info(gx,gy)
            if not p.have_block then
                test = "try to get"
                if name =="block" then
                    if b.can_get then
                        test= "can get"
                        p.have_block = b
                        b.is_have= true
                        delete_grid(gx,gy)
                    end
                end
            else
                test = "try to release"

                if name == false then
                    test= "can release"
                    p.have_block:act_move(gx,gy)
                    p.have_block.is_have = false
                    p.have_block = nil
                end
            end
        end

        local s_no = frame_to_no(#p.idle_sprs[p.aim+1])
        -- p.spr = frame_to_table(p.idle_sprs[p.aim+1])
        p.spr = p.idle_sprs[p.aim+1][s_no]

        if p.have_block then
            p.have_block.x = p.x
            p.have_block.y = p.y-8+s_no
        end
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