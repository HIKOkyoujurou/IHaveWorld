
grid ={}
cell =128
grid_size = 8

function init_grid()
    grid = {}
    for x = 1,cell do
        local t = {}
        
        for y = 1,cell do
            add(t,nil)
        end
        add(grid,t)
    end
    
end

function get_grid_no(x,y)
    return x+y*cell
end

function draw_grid()
    for x = 1,cell do
        for y = 1,cell do
            if grid[x][y] then
                print(grid[x][y].name,x*grid_size-grid_size,y*grid_size-grid_size,10)
                print("x:"..x.."y:"..y,x*grid_size-grid_size,8+y*grid_size-grid_size,10)
            end
        end
    end
end


function get_grid(x,y)
    -- assert((x<1 or y<1 or x>cell or y>cell),"out of grid area:")
    x+=1
    y+=1
    if (x<1 or y<1 or x>cell or y>cell) then
        return false
    end

    return grid[x][y]
end

function set_grid(x,y,obj)
    x+=1
    y+=1
    if (x<1 or y<1 or x>cell or y>cell) then
        assert((x<1 or y<1 or x>cell or y>cell),"out of grid area:")
        return false
    end

    grid[x][y] = obj
end

function delete_grid(x,y)
    x+=1
    y+=1
    if (x<1 or y<1 or x>cell or y>cell) then
        assert((x<1 or y<1 or x>cell or y>cell),"out of grid area:")
        return false
    end

    grid[x][y] = nil
end



function object.act_move(self,x,y)

    if self.on_grid then
        delete_grid(self.grid_x,self.grid_y,nil)
    end
    
    self.grid_x = x
    self.grid_y = y
    -- grid[x+1][y+1] = self
    set_grid(x,y,self)

    self.on_grid = true
end


function now_showing_grid()
    local x = cam_x\8 
    local y = cam_y\8 

    return x,x+15,y,y+15
end