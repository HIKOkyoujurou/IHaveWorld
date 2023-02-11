-->8 box
box = {}
box_meta =  {}
function make_normal_box(x,y)
    local b = make_object("box",x,y,3)
    b.is_have = false
    b.move_spd = 4
    b.move_angle = 0
    b.draw = function(b)
        object.draw(b)
        print(b.move_time,b.x+8,b.y)
    end
end
