
function object.move_y(self,y)
    self.remainder_y +=y
    local cy = flr(self.remainder_y)
    self.remainder_y -= cy
    local total = cy
    local vecy = sgn(cy)
    while cy !=0
    do
        if self:check_solid(0,vecy) then
            crash(self,false)
            return true
        end
        self.y+=vecy
        cy -= vecy
    end 
    return false
end

function object.grid_move(self,x,y)
    
    x += self.grid_x
    y += self.grid_y
    if check_solid_grid(x,y) then
        return false
    else
        return true
    end
    
end



--[[
0 -> false

]]
function check_solid_grid(x,y)
    local g= get_grid(x,y)
    
    if check_position_solid(x*8,y*8) then
        return true
    end

    if g then
        if g.is_solid then
            return true
        end
    end


    return false
end

function check_grid_info(x,y)

    local mf = check_map_frag(x*8,y*8)

    if mf%2 ==1 then
        return "wall"
    end
    
    local g= get_grid(x,y)


    if g then
        if g.is_solid then
            return "block",g
        end
    end

    return false
end


function check_position_solid(x,y)

    if check_map_collide(x,y) then
        return true
    end

    if x<0 or y<0 then 
        return true
    end
end


function check_map_collide(x,y)
    return fget(mget(x\8,y\8),0)
end

function check_map_frag(x,y)
    return fget(mget(x\8,y\8))
end


function check_map_spr(x,y)
    return mget(x\8,y\8)
end

function get_map_flag(x,y)
    local celx,cely = flr(x/8),flr(y/8)
    local cell = mget(celx,cely)

    -- local cell = get_map_cell(x,y)
    
    return fget(cell),cell
end