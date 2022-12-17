-->8 box
box = {}
box_meta =  {}
function make_normal_box(x,y)
    local b = make_object("box",x,y,3)
    b.is_have = false
    b.update = function(b)
        if not b.is_have then
            b.x = b.grid_x*8
            b.y = b.grid_y*8
        end
    end
    b.can_get = true
end
