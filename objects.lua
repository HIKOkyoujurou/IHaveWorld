-->8
--objects
objects ={}
obj_meta ={}

obj ={}
obj.name ="object"
obj.x = 64
obj.y = 64
obj.spr = 0
obj.is_flip = false

obj.update = nil_function

obj.draw = function(o)
    spr(o.spr,o.x,o.y)
end
obj.draw_back =nil_function
obj.draw_front =nil_function

obj_meta.__index = obj

function make_object(name,x,y,spr)
    local o ={}
    o.name = name
    o.x = x
    o.y = y
    o.spr = spr
    setmetatable(o,obj_meta)
    add(objects,o)
    return o
end
