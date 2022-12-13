
grid ={}
cell =3
grid_size = 16

function init_grid()
    grid = {}
    for x = 1,cell do
        local t = {}
        
        for y = 1,cell do
            add(t,{name ="2"})
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
            cursor(x*grid_size,y*grid_size,10)
            print(grid[x][y].name)
            -- for g in all(grid) do
            --     print(g)
            -- end
        end
    end
end