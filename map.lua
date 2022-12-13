-->8 map

function load_map_whole()
    local dx = 0
    local dy = 0

    for mapx = 0,128*8-8,8 do
    for mapy = 0,128*8-8,8 do

            local flag,cell= get_map_flag(mapx,mapy)
            local x,y = mapx-dx,mapy-dy

            if cell ==1 then
                make_player(x,y)
            elseif cell ==3 then
                make_normal_box(x,y)
            end
        end
    end

end