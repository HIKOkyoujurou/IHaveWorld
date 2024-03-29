objects = {}
obj_meta = {}

object = {}
object.spd_x =0
object.spd_y =0
object.acs_x =0
object.acs_y =0
object.hit_l = 1
object.hit_r = 7
object.hit_u = 1
object.hit_d = 7
object.spr_y = -3
object.grid_x = 0
object.grid_x = 0
object.on_grid = true
object.friction = 0.9
object.is_solid = true
object.can_get = false
object.test = true
object.move_time = 0
object.move_spd = 0
object.move_angle = -1

object.is_flip = false

object.draw = function(self)
    if self.x<cam_x or self.x>cam_x+128 or self.y<cam_y or self.y>cam_y+128 then
        return
    end
    for c = 1,#gb do
        pal(gb[c],gb[1])
    end

    for i = -1,1,1 do
        for j = -1,1,1 do
            spr(self.spr,self.x+i,self.y+self.spr_y+j,1,1,self.is_flip)
        end
    end

    for c = 1,#gb do
        pal(gb[c],gb[c])
    end
    spr(self.spr,self.x,self.y+self.spr_y,1,1,self.is_flip)
end
object.draw_front = function(self)

end
object.draw_back = function(self)
    -- circfill(self.x+3,self.y+5,2,gb[1])
    -- spr(0,self.x,self.y-2,1,1,self.is_flip)

end

object.update = function(self)
    self:move()
    self:grid_pos()
end

object.grid_pos = function(self)
    self.x = self.grid_x*8
    self.y = self.grid_y*8
end

object.move = function(self)

    if self.move_angle == -1 then
        return
    end
    self.move_time-=1
    
    if self.move_time <=0 then
        self.move_time = self.move_spd
        local dx,dy = move(self.move_angle)

        if self:grid_move(dx,dy) then
            self:act_move(self.grid_x+dx,self.grid_y+dy)
        else
            self.move_spd = 0
            self.move_angle = -1
        end
    end
end

obj_meta.__index = object

function make_object(name,x,y,spr)
    local o ={}
    o.name = name
    o.spr = spr
    o.x,o.y = x,y
    o.grid_x,o.grid_y = x\8,y\8
    setmetatable(o,obj_meta)
    o:act_move(o.grid_x,o.grid_y)
    add(objects,o)
    return o
end

function change_grid_to_pos(x,y)
    return x,y
end

function set_physics(self,l,r,u,d)
    self.hit_l = l
    self.hit_r = r
    self.hit_u = u
    self.hit_d = d
end

function move_it()

end

