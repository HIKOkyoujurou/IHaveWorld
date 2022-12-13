
grid ={}
cell =16
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

function add_grid(x,y,obj)
    -- assert((x<1 or y<1 or x>cell or y>cell),"out of grid area")
    -- assert(grid[x][y],"there is already object")
    grid[x][y] = obj
end