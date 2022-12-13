-->8
--input
key_l = 0
key_r = 1
key_u = 2
key_d = 3
key_z = 4
key_x = 5

inputs = {false,false,false,false,false,false}
last_pressed = {}
last_released = {}

function check_update()
    for key_no = key_l+1,key_x+1 do
        local before = inputs[key_no] 
        local now = btn(key_no-1)

        if not before and now then
            last_pressed[key_no] =time()
        end
        if before and not now then
            last_released[key_no]=time()
        end

        if now then
        else
        end

        inputs[key_no] = now
    end
end

function keyp(key,buffer)
    buffer = buffer or 0
    key+=1
    local b = false
    if inputs[key] then b=true end

    -- if last_pressed[key]>0 and last_pressed[key]<buffer then
    if last_pressed[key] and time()-last_pressed[key] < buffer then
        b =true
    end
    return b
end