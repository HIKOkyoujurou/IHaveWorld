-->8 map

function load_map_whole()
    local dx = 128*(num%8)
    local dy = 128*(num\8)

    for mapx = 0,128*8-8,8 do
    for mapy = 0,128*8-8,8 do

            local flag,cell= get_map_flag(mapx,mapy)
            local x,y = mapx-dx,mapy-dy

            if flag==4 then
                make_thin(x,y,cell)
            end

            if cell ==1 then
                if show_title then
                    player_pos_x,player_pos_y = x,y
                else
                    make_player(x,y)
                end
            elseif cell == 35 then

                make_item_gum(x,y)
            elseif cell == 51 then
                make_goal(x,y,reload)
            elseif cell == 43 then
                make_kanban(x,y,now_level)
            elseif (cell>=28 and cell<=31) or cell == 46 then

                make_toge(x,y,cell-toge_spr)
            elseif  cell >= 114 and cell <= 115 then
                make_mountain(x,y,cell)
            elseif  cell == 71 then
                make_moon(x,y)
            -- elseif  cell == 73 then
            --     make_earth(x,y)
            end

            if cell == 124 then
                make_monkey(x,y)
            end

            --bg things
            if not reload then
                if cell == 119 then
                    make_building_bg(y);
                elseif cell == 24 then
                    -- local length = (dy+120-mapy)/8
                    local length = 5
                    make_denchu(x,y,length)
                elseif cell == 68 then
                    make_pipe(x,y)
                end
            end
        end
    end

end