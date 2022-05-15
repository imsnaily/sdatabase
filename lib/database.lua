RocksModule = {}

function RocksModule:new()
    local object = {}

    setmetatable(object, self)        
    print('^5RocksDB: ^4(RocksModule:newDB)^7 new object created')
    self.__index = self

    return object
end

print('^5RocksDB: ^4(RocksModule:newDB)^7 function has been registered')

function RocksModule:string(action, index, value)
    if action == 'get' then
        return GetResourceKvpString(index)
    elseif action == 'save' then
        SetResourceKvp(index, value)
    else
        print('^5RocksDB: ^4(RocksModule:string)^7 Not valid action given')
    end
end

print('^5RocksDB: ^4(RocksModule:string)^7 function has been registered')

function RocksModule:integer(action, index, value)
    if action == 'get' then
        return GetResourceKvpInt(index)
    elseif action == 'save' then
        SetResourceKvpInt(index, value)
    else
        print('^5RocksDB: ^4(RocksModule:integer)^7 Not valid action given')
    end
end

print('^5RocksDB: ^4(RocksModule:integer)^7 function has been registered')

function RocksModule:float(action, index, value)
    if action == 'get' then
        return GetResourceKvpFloat(index)
    elseif action == 'save' then
        SetResourceKvpFloat(index, value)
    else
        print('^5RocksDB: ^4(RocksModule:float)^7 Not valid action given')
    end
end

print('^5RocksDB: ^4(RocksModule:float)^7 function has been registered')

function RocksModule:table(action, index, value)
    if action == 'get' then
        local data = GetResourceKvpString(index)

        return (data and json.decode(data)) or nil
    elseif action == 'save' then
        SetResourceKvp(index, json.encode(value))
    else
        print('^5RocksDB: ^4(RocksModule:table)^7 Not valid action given')
    end
end

print('^5RocksDB: ^4(RocksModule:table)^7 function has been registered')

-- Example of use
if ROCKSDB._DEBUG then
    Citizen.CreateThread(function()
        local database = RocksModule:new()
        local player = database:table('get', 'player-license')

        if not player then
            -- player does not exist on database

            player = {
                license = 'player-license',
                name = 'Test',
                money = 0
            }

            database:table('save', 'player-license', player)
        else
            -- player does exist on database

            return 'Player exist'
        end
    end)
end