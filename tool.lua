function sprint(tx,x,y,col1,col2)
    for i=1.2,-.9,-.25 do
        print(tx,x+.5+sin(i),y+.5+ceil(i)-cos(i),i>0 and 0 or col2)
    end
    print(tx,x,y,col1)
end

function frame_to_table(table,baisoku)
    local max = 30/baisoku 
    local f = frame%max/max
    return table[1+flr(#table*f)]
end