bump_size = 0

function init_bump(x,y,w,h,size)
    bump_size = size
    b_w,b_h =0,0
    bumps ={}
    local no =0
    for ny=0,h,size do
        b_w+=1
        b_h=0
        for nx=0,w,size do
            b_h+=1
            no+=1
            add(bumps,{x=nx,y=ny,no=no,m={}})
        end
    end
end

function draw_bump()
    for o in all(bumps) do
        rect(o.x,o.y,o.x+bump_size,o.y+bump_size,9)
        print(#o.m,o.x,o.y,3)
    end
end

function back_bump(x,y)
    local xx,yy = x\bump_size,y\bump_size
    local no = 1+xx+(yy)*b_w

    -- if no <1 and no>#bumps then 
    --     return false 
    -- end

    return no
end

function point(angle)

end

function update_bump()
    --only one object works
    -- two or more not work
    -- instead bump init all time;
    for bu in all(bumps) do
        bu.m ={}
    end
    foreach(objects,object_bump)
end

function object_bump(o)
    if o.is_solid then
        for angle = 1,4 do
            local x,y =o.x,o.y
            if angle ==1 then
                x+=o.hit_l
                y+=o.hit_u
            elseif angle ==2 then
                x+=o.hit_l
                y+=o.hit_d
            elseif angle ==3 then
                x+=o.hit_r
                y+=o.hit_u
            elseif angle ==4 then
                x+=o.hit_r
                y+=o.hit_d
            end
            local no = back_bump(x,y)
            if bumps[no] then
                add(bumps[no].m,o)
            end
            -- end
        end
    end
end