-->8 box
box = {}
box_meta =  {}
function make_normal_box(x,y)
    local b = make_object("box",x,y,3)
    b.draw_front = function()
        print(b.test,b.x,b.y+8,9)
    end
end