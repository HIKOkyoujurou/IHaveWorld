function init_camera()
    camera_shake_time = 0
    camera_shake_strong = 0

    cam_x =0
    cam_y =0
    camera(cam_x,cam_y)
end

function update_camera()
    if camera_shake_time > 0 then
        -- cam_x += rnd_int(-camera_shake_strong,camera_shake_strong)
        -- cam_y += rnd_int(-camera_shake_strong,camera_shake_strong)
        cam_x += rnd(camera_shake_strong)-camera_shake_strong
        cam_y += rnd(camera_shake_strong)-camera_shake_strong
        camera_shake_time -=1
    else
        cam_x,cam_y =0,0
    end

    if player then
        cam_x = (player.x\128)*128
        cam_y = (player.y\128)*128
    end

    camera(cam_x,cam_y)
end


function camera_shake(time,strong)
    camera_shake_time = time
    camera_shake_strong = strong
end
