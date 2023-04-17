extends Node2D


var clients = {}

var client_ids = {}

var default = {
    "current_id": -1,
    "name": "anon",
    "happiness": 0,
    "money": 0,
    "spring": 50,
    "dj": 0,
    "vol": 50,
    "skin": 0,
    "driver": 0,
    "route": 0,
    "roundabout": 0,
    "state": 0
   }


func player_connected(id):
    $Network.send_to(id, {"header": "hello"})


func player_identify(id, data):
    if data.has("key"):
        var client_key = data["key"]
        if client_key in clients.keys():
            client_ids[id] = client_key
            $Network.send_to(id, {"header": "init_data", "data": clients[client_key]})
            


func new_player(id):
    var ckey = get_random_intstring().sha256_text() + get_random_intstring().sha256_text()
    while true:
        if not ckey in clients.keys():
            break
        ckey = get_random_intstring().sha256_text() + get_random_intstring().sha256_text() 
    create_new_player(ckey)
    client_ids[id] = ckey
    $Network.send_to(id, {"header": "new_key", "key": ckey})
    
    
    
func get_random_intstring():
    var rng = RandomNumberGenerator.new()
    rng.randomize()
    var x = ""
    for i in range(32):
        x += str(rng.randi())
    return x
    
    
func create_new_player(ckey):
     clients[ckey] = default.duplicate(true)


func update_player(id, data):
    if data.has("data"):
        var updata = data["data"]
        if id in client_ids.keys():
            if client_ids[id] in clients.keys():
                do_client_update(client_ids[id], updata)
                $Network.send_to(id, {"header": "update_data", "data": clients[client_ids[id]]})


func do_client_update(ckey, updata):
    clients[ckey] = updata
    return true
