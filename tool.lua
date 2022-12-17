function sprint(tx,x,y,col1,col2)
    for i=1.2,-.9,-.25 do
        print(tx,x+.5+sin(i),y+.5+ceil(i)-cos(i),i>0 and 0 or col2)
    end
    print(tx,x,y,col1)
end

function frame_to_table(table,baisoku)
    baisoku = baisoku or 1
    local max = 30/baisoku 
    local f = frame%max/max
    return table[1+flr(#table*f)]
end

function frame_to_no(no,baisoku)
    baisoku = baisoku or 1
    local max = 30/baisoku 
    local f = frame%max/max
    return 1+flr(no*f)
end

function hcenter(s)
    return 64-#s*2
end
  
function vcenter(s)
    return 61
end

function rnd_int(min,max)
    return flr(rnd(max-min+1)+min)
end
function move(rx,mx,c)
    c=c and c or 0.7
    if abs(rx-mx)<1 then
        return mx
    end
    
    return (1-c)*mx+rx*c
end

