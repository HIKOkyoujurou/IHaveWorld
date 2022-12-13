objects = {}
obj_meta = {}

object = {}
object.remainder_x = 0
object.remainder_y = 0
object.spd_x =0
object.spd_y =0
object.acs_x =0
object.acs_y =0
object.hit_l = 1
object.hit_r = 7
object.hit_u = 1
object.hit_d = 7
object.spr_y = 0
object.friction = 0.9
object.is_solid = true
object.test = true

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

end

obj_meta.__index = object

function make_object(name,x,y,spr)
    local o ={}
    o.name = name
    o.spr = spr
    o.x,o.y = x,y
    setmetatable(o,obj_meta)
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

