
function object.just_move(self)
    self.spd_x += self.acs_x
    self.spd_y += self.acs_y
    self.acs_x,self.acs_y = 0,0

    self:move_x(self.spd_x)
    self:move_y(self.spd_y)

    self.spd_x *= self.friction
    self.spd_y *= self.friction
end
function object.move_x(self,x)
    self.remainder_x +=x
    local cx = flr(self.remainder_x)
    self.remainder_x -= cx

    local total = cx
    local vecx = sgn(cx)
    while cx !=0
    do
        if self:check_solid(vecx,0) then
            crash(self,true)
            return true
        end
        self.x +=vecx
        cx -= vecx
    end 
    return false
end
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
    if self:check_solid(x,y) then
        return false
    else
        return true
    end
end

function object.check_solid(self,ox,oy)
    ox = ox or 0
    oy = oy or 0


    for x = self.x + ox + self.hit_l, self.x+ ox+self.hit_r,self.hit_r - self.hit_l do
        for y = self.y + oy + self.hit_u, self.y+ oy+self.hit_d,self.hit_d - self.hit_u do
            if check_position_solid(x,y,self) then
                return true
            end
        end
    end


end

function check_position_solid(x,y,self)


    local bb = back_bump(x,y)

    if check_map_collide(x,y) then
        return true
    end

    --out position
    if x<=0 or y<=0 then 
        return true
    end

    if bumps[bb] then
        for o in all(bumps[bb].m) do
            if o~=self and o.is_solid and
            (o.x+o.hit_l <=x and o.x+o.hit_r >=x 
            and o.y+o.hit_u <=y and o.y+o.hit_d >=y) then
                
                return true
                
            end
        end
    else
        return true
    end

    -- if x<0 or x>128 or y<0 or y>128 then
    --     self.spd_x *=-1
    --     self.spd_y *=-1
    -- end

    --out of camera
    -- return x<0 or x>128 or y<0 or y>128

    
end


function check_map_collide(x,y)
    return fget(mget(x\8,y\8),0)
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