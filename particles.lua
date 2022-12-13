-->8
--particles
particles ={}
particle_meta = {}
part = {}
part.x = 0
part.y = 0
part.size =5
part.change_size = 1
part.acs_x = 0
part.acs_y = 0
part.spd_x = 0
part.spd_y = 0
part.gravity = false
part.time = 100
part.friction = 0.9
part.color = 1
part.update = function(p)
    if p.gravity then
        p.acs_y+=p.gravity
    end
    p.spd_x +=p.acs_x
    p.spd_y +=p.acs_y
    p.x += p.spd_x
    p.y += p.spd_y
    p.spd_x*=p.friction
    p.spd_y*=p.friction
    p.acs_x,p.acs_y =0,0
    p.size *= p.change_size
    p.time-=1
    if p.time <=0 or p.size <0.5 then
        del(particles,p)
    end
end
part.draw = function(p)
    circfill(p.x,p.y,p.size,p.col);
end
part.draw_back = nil_function
part.draw_back_obj = nil_function

part.draw_front = nil_function

particle_meta.__index = part

function make_particle(x,y,col)
    local p={}
    p.x,p.y,p.col =x,y,col
    setmetatable(p,particle_meta)
    add(particles,p)
    return p
end